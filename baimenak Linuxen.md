# Baimenak Linuxen

- [Baimenak Linuxen](#baimenak-linuxen)
  - [Fitxategi eta direktorioen baimena](#fitxategi-eta-direktorioen-baimena)
    - [Baimen taldeak](#baimen-taldeak)
    - [Baimenak esleitzen modu simbolikoan](#baimenak-esleitzen-modu-simbolikoan)
    - [Baimenak modu oktalean](#baimenak-modu-oktalean)
  - [Sticky bit baimena](#sticky-bit-baimena)
  - [SUID eta GUID baimenak](#suid-eta-guid-baimenak)
    - [SUID](#suid)
  - [Ezaugarri bereziak - lsattr eta chattr](#ezaugarri-bereziak---lsattr-eta-chattr)
- [Ariketak](#ariketak)
  - [Ariketa 1](#ariketa-1)
  - [Erantzunak](#erantzunak)

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

## SUID eta GUID baimenak

### SUID

SUID aktibatuta dagoenean fitxategi hau exekutatzen duen erabiltzaileak sortzailearen baimenak izango ditu.

```bash
chmod u+s repos
```

Sortu exekutable bat root bezala hurrengo edukiarekin

suidfroga.sh
```bash
#!/bin/bash
id
```

sortu exekutable bat hurrengo edukiarekin eta izenarekin 

suidfroga.sh
```bash
#!/bin/bash
id
echo $EUID
```

baimenak esleituko dizkiogu fitxategiari
```bash
chmod 755 suidfroga.sh
```

## Ezaugarri bereziak - lsattr eta chattr

Ezaugarri bereziak ikusteko `lsattr` agindua erabiliko dugu.

Ezaugarri bereziak aldatzeko `chattr` agindua erabiliko dugu

Adibidez **i** atributoaren fitxategi bat inmutablea bilakatzen du. Hau esan nahi du inork ezin duela ez aldatu, ezta ezabatu, ezta root-ek. Ezabatu nahi izatekotan, i atributoa kendu beharko genioke lehenago
```bash
chattr +i froga.txt
lsattr froga.txt
```

**u** ezaugarriarekin fitxategi bat ezabatzen dugunean, datuak gordeta gelditzen dira eta bere berreskurapena ahalbidetzen du

```bash
chattr +u froga.txt
```

**e** ezaugarriarekin fitxategi bat ezabatzen denean, okupatzen zuen memoria zeroekin berridazten da.

```bash
chattr +e froga.txt
```

**c** ezaugarriarekin fitxategi bat konprimituta gordeko da.
```bash
chattr +c froga.txt
```

**a** ezaugarriarekin fitxategi bati bakarrik gehitu ahal zaizkio gauzak, hau da, ezin da aldatu aurretik zegoen ezer
```bash
chattr +a froga.txt
```

# Ariketak

## Ariketa 1

lotu dagokion baimenarekin:

-462
-123
-711
-333
-161
-765
-567
-101
-162

- rwx--x--x
- --x-w--wx
- --x-----x
- -wx-wx-wx
- r-xrw-rwx
- rwxrw-r-x
- --xrw--w-
- r--rw--w-
- --xrw---x

## Erantzunak
-462
-123
-711
-333
-161
-765
-567
-101
-162

- rwx--x--x - 711
- --x-w--wx - 123
- --x-----x - 101
- -wx-wx-wx - 333
- r-xrw-rwx - 567
- rwxrw-r-x - 765
- --xrw--w- - 162
- r--rw--w- - 462
- --xrw---x - 161