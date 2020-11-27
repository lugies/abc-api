# Symfony 4.4 ile Restful Servis

Selamlar ilk defa kullandığım symfony framework ile bir servis geliştirmeye çalıştım. Eksikler ve yaptığım bazı yöntemler hatalı olabilir. Gerekli dosyaları (Sql, Postman Collection) projenin içerisine ekleyeceğim.

## Kurulum

Öncellikle Symfony'e tam hakim olmadığım için kurulum sırasında sorunla karşılaşırsanız benimle iletişime geçebilirsiniz.
Öncelikle projemizi cihazımıza clonelayalım. Sonrasında aşağıdaki adımları izleyebilirsiniz.

```bash
composer update // gerekli dosyalarımızı yüklüyoruz
```
Veritabanı tablolarımızı oluşturalım

```bash
php bin/console make:migration 
php bin/console doctrine:migrations:migrate
```
Eğer bu işlem ile veritabanı oluşmazsa sql dosyası projenin içindedir oradan yükleyebilirsiniz.

## Postman Collection
Postman json dosyası projeye yüklenmiştir. Ekleyip servise istek atabilirsiniz iyi çalışmalar kolay gelsin.

## Lisans
[MIT](https://choosealicense.com/licenses/mit/)