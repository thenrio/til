match

    select brand, count(*) from products where ean ~ '^36125' and alias !~ '^36125' group by brand;
