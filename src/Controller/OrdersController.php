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
     * @Route("/orders", name="orders", methods={"POST"})
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
}
