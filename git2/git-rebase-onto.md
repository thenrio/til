
       b
       |
       a
      /
     B
     |
     A

upstream: (B)
fix: (b) 

          b
          |
     C'   a
     |   /
     B'--
     |
     A'


```sh
git rebase --onto=upstream B fix
```

          b'
          |
          a'
         /
     C'--
     | 
     B'
     |
     A'
