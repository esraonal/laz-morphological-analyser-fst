This project is licensed under the CreativeCommons BY-NC-SA 3.0.

*(Still in progress)*

# laz-morphological-analyser-fst
This is a project that proposes a finite-state morphological analyser for Pazar-Atina dialect of Laz Language,  a member of South Caucasian language  family  mainly  spoken  on  northeastern  coastline  of  Turkey.  It constitutes  the  first  steps  to  create  a  general  computational  model  for word-form  recognition  and  production  for  Laz  by  building  a  rule-based morphological analyser based on Xerox `lexc` (lexicon) and `twolc` (two-level grammar) formalism/programming languages to define morphotactic rules and morphophonological alternations, respectively.  Additionally, HFST(Helsinki Finite-State Technology) command line tools are used to compile `lexc` and `twolc` files into transducers.

## Method and tools 
### Finite-state Morphology
The study is based on the theory of finite-state morphology.  You can find a link to the book written by Kenneth R. Beesley and Lauri Karttunen.

https://web.stanford.edu/group/cslipublications/cslipublications/site/1575864347.shtml

### HFST(Helsinki Finite-State Technology) toolkit 
HFST command line tools are used to compile `lexc` and `twol` files into transducers.

Follow the link below to install HFST

https://github.com/hfst/hfst/wiki/Download-And-Install

Check all HFST command line tools here

https://github.com/hfst/hfst/wiki/Command-Line-Tools

After installation, follow the steps

#### 1. Compile the lexicon file
```
$ hfst-lexc pazar.laz.lexc -o pazar.laz.lexc.hfst
```

#### 2. Compile the two-level grammar file
```
$ hfst-lexc pazar.laz.twol -o pazar.laz.twol.hfst
```

#### 3. Compose the two transducers
```
$ hfst-compose-intersect -1 pazar.laz.lexc.hfst -2 pazar.laz.twol.hfst -o pazar.laz.gen.hfst
```

#### 4. Display the strings recognized by a transducer
```
$ hfst-fst2strings -X obey-flags pazar.laz.gen.hfst
```

An example
```
xordza<n><erg>:xordzak
```
  
#### 5. Invert the transducer
```
$ hfst-invert -i pazar.laz.gen.hfst -o pazar.laz.mor.hfst
```

#### 6. Look up the input strings in the transducer and print the corresponding output strings in the text file.
```
$ hfst-lookup -qp pazar.laz.mor.hfst < pazar.laz.tale.txt
```


### Language sources
- Grammar books: (used to define morhotactic rules and mophophonological alternations)

Öztürk, B. & M. Pöchtrager (Eds.) (2011). Pazar Laz. LINCOM: Languages of the World Materials 484, Münich: LINCOM EUROPA.

Lacroix, R. (2009). Description du dialecte laze d’Arhavi (caucasique du sud, Turquie). Grammaire et textes(Doctoral dissertation, Université Lumière Lyon 2; xxii+901pp.)

- Dictionary: (used to add lexemes into the lexcicon file)

Didi Lazuri Nenapuna (Büyük Lazca Sözlük) by İsmail Bucaklişi, Hasan Uzunhasanoğlu, İrfan Aleksiva

- Other resources: (used to create a corpus to test the analyser on)

Documents written in Laz are provided by Ismail Bucaklisi 

### Results
- Coverage:
Currently up to 68% coverage over 111,365 tokens.

- Since the main corpus for Pazar Laz (with 111,365 tokens) consists of a private document, it is not published here, but to test the analyser, there is a small document provided containing a short tale in Pazar Laz and a glossed version of it as a png file taken from Ozturk & Pöchtrager (2011) grammar book)

### Error analysis:
- Randomly selected 100 tokens that are not analyzed by the transducer are examined in terms of the reasons why they are not analyzed.  The results has shown that most of these words are Turkish or we have a missing lexeme in the lexc file.
(details can be found in the paper)

### What is next?
- a gold standard corpus to test the analyser (we still do not know for sure that our analysis on word forms are correct)
- an analyser to cover all dialects

For any comments or suggestions please send me an e-mail.  My e-mail address is esra.onal@boun.edu.tr
