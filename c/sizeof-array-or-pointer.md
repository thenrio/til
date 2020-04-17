See file:///usr/share/doc/glibc-doc-reference/html/String-Length.html of glibc-doc-reference,
excerpt below, see beware.

When applied to an array, the strlen function returns the length of the string stored there, not its allocated size. You can get the allocated size of the array that holds a string using the sizeof operator:

```c
char string[32] = "hello, world";
sizeof (string)
    ⇒ 32
strlen (string)
    ⇒ 12
```

But beware, this will not work unless string is the array itself, not a pointer to it. For example:

```c
char string[32] = "hello, world";
char *ptr = string;
sizeof (string)
    ⇒ 32
sizeof (ptr)
    ⇒ 4  /* (on a machine with 4 byte pointers) */
```

This is an easy mistake to make when you are working with functions that take string arguments;
those arguments are always pointers, not arrays. 
