<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use App\Entity\Customers;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class CustomersController extends AbstractController
{
    /**
     * @Route("/customers", name="customers", methods={"GET","HEAD"})
     */
    public function login_get(): Response
    {
        return $this->json([
            'message' => 'Hoşgeldiniz'
        ]);
    }
    /**
     * @Route("/customers", name="customers", methods={"POST","PUT"})
     */
    public function login_post(Request $request): Response
    {
        $customers = $this->getDoctrine()->getRepository(Customers::class)->findOneBy([
            'username' => $request->get('username'),
            'password' => $request->get('password')
        ]);
        if ($customers) {
            if ($customers->getUsername() == $request->get('username') && $customers->getPassword() == $request->get('password') ) {
                return new Response('Giriş Başarılı Hoşgeldiniz ' . $customers->getUsername());   
            }
            else 
                return new Response('Lütfen Giriş Bilgilerinizi Kontrol Ediniz!!!');  
        } else {
            return new Response('Lütfen Giriş Bilgilerinizi Kontrol Ediniz!!!');  
        }
        
    }
}
