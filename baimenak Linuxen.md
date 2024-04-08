# Baimenak Linuxen

- [Baimenak Linuxen](#baimenak-linuxen)
  - [Fitxategi eta direktorioen baimena](#fitxategi-eta-direktorioen-baimena)
    - [Baimen taldeak](#baimen-taldeak)
    - [Baimenak esleitzen modu simbolikoan](#baimenak-esleitzen-modu-simbolikoan)
    - [Baimenak modu oktalean](#baimenak-modu-oktalean)
  - [Sticky bit baimena](#sticky-bit-baimena)

## Fitxategi eta direktorioen baimena

Fitxategi eta direktorioen baimenak hurrengo aginduarekin ikusi ditzakegu

```bash
ls -al
```

![alt text](image.png)

### Baimen taldeak

  - Jabea (user): Fitxategi bat sortzen dugunean, sortzailea jabea izango da defektuz
  - Taldea (group): Fitxategi baten jabetza talde bati ere bai dagokio
  - Besteak (other): Jabeak edo taldekideak ez direnak
  
  ![alt text](file_permissions.png)

### Baimenak esleitzen modu simbolikoan

(R) irakurri
(W) idatzi
(X) exekutatu
Hiru baimen hauek lehenago azaldu diren talde bakoitzari aparte esleitzen dira

Adibidez Jabeari (user) exekuzio baimena horrela eman ahal diogu
```bash
chmod u+x froga.txt
```
Besteei baimenak kentzeko horrela egiten da
```bash
chmod o-w repos
```

### Baimenak modu oktalean
 
 - 0 = 000 = --- = baimenarik gabe
 - 1 = 001 = --x = exekuzio baimena
 - 2 = 010 = -w- = idazteko baimena
 - 3 = 011 = -wx = idazteko eta exekutatzeko baimena
 - 4 = 100 = r-- = irakurtzeko baimena
 - 5 = 101 = r-x = irakurtzeko eta exekutatzeko baimena
 - 6 = 110 = rw- = irakurtzeko eta idazteko baimena
 - 7 = 111 = rwx = baimen guztiak
  
Adibidez baimen guztiak kentzeko
```bash
chmod 000 repos
```

Baimenak gehitzeko
```bash
chmod 777 repos
```

Eta erabiltzaileari baimen guztiak emateko eta besteei irakurri eta exekutatu bakarrik
```bash
chmod 755 repos
```

## Sticky bit baimena

Sticky bita daukan fitxategi edo direktorio batei jabeak edo rootek bakarrik aldatu ezabatu edo izen aldatu dezakete

```bash
chmod +t repos
```

![alt text](image-1.png)
