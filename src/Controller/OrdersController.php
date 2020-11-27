<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use App\Entity\Orders;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class OrdersController extends AbstractController
{
    /**
     * @Route("/orders-new", name="orders-new", methods={"POST"})
     */
    public function insert(Request $request): Response
    {   
        $order = new Orders();
        $order->setCustomerId($request->get('id'));
        $order->setOrderCode(mt_rand());
        $order->setProdutId($request->get('product_id'));
        $order->setQuantity($request->get('quantity'));
        $order->setAddress($request->get('address'));
        $order->setShippingDate(new \DateTime());
        
        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->persist($order);
        $entityManager->flush();
        if (!empty($order->getOrderCode())) {
            return new Response('Siparişiniz başarılı bir şekilde alınmıştır. Sipariş Numaranız = '.' '.$order->getOrderCode());
        } else {
            return new Response('Hata Oluştu');
        }
    }
    /**
     * @Route("/orders-list", name="orders-list", methods={"POST"})
     */
    public function order_list(Request $request , EntityManagerInterface $em): Response
    {   
        
        $qb = $em->createQueryBuilder('o')->where('o.id = :id')
        ->setParameter('id', $request->get('id'))
        ->orderBy('o.id', 'ASC');

        $query = $qb->getQuery();
        return $query->execute();
        
        
    }
    /**
     * @Route("/orders", name="orders", methods={"GET"})
     */
    public function show($order_code): Response
    {   
        $order = $this->getDoctrine()->getRepository(Orders::class)->findOneBy([
            'order_code' => $order_code
        ]);
        if (!$order) {
            return $this->json(['message' => 'Belirtilen sipariş numarasında sipariş bulunamadı '.$order_code]);
        }
        return $this->json([
            'Sipariş' => $order->getProdutId(),
            'Sipariş Adeti' => $order->getQuantity(),
            'Sipariş Adresi' => $order->getAddress(),
            'Sipariş Tarihi' => $order->getShippingDate()
        ]);
        
    }
    /**
     * @Route("/orders", name="orders", methods={"POST"})
     */
    public function edit(Request $request, $order_code): Response
    {   
        $entityManager = $this->getDoctrine()->getManager();
        $order = $this->getDoctrine()->getRepository(Orders::class)->findOneBy([
            'order_code' => $order_code
        ]);
        if (!$order) {
            return $this->json(['message' => 'Belirtilen sipariş numarasında sipariş bulunamadı '.$order_code]);
        }
        $order->setCustomerId($request->get('id'));
        $order->setProdutId($request->get('product_id'));
        $order->setQuantity($request->get('quantity'));
        $order->setAddress($request->get('address'));
        $order->setShippingDate(new \DateTime());
        $entityManager->flush();
        
        if ($entityManager) {
            return $this->json(['message' => 'Başarılı bir şekilde güncellenmiştir.'.$order->getOrderCode()]);
        }
        else
            return $this->json(['message' => 'HATA']);
        
    }
}
