	/*Creo il database e le tabelle delle relazioni e entità*/
	
CREATE DATABASE CasaDiscografica;
	
	/*tabelle delle identità*/
	
CREATE TABLE Genere
	(IdGenere int(6) Auto_Increment Primary Key,
	  Tipologia VarChar(30) Not Null
);

CREATE TABLE SottoGenere
	(IdSottogenere Int(6) Auto_Increment Primary Key,
	  Tipologia VarChar(30) Not Null,
	  CodiceGenere Int(6) Not Null,
	  Foreign Key (CodiceGenere) References Genere(IdGenere)
	);

CREATE TABLE Autore
	(IdAutore Int(6) Auto_Increment Primary Key,
	  Nome VarChar(50) Not Null
	);
	
CREATE TABLE Artista
	(IdArtista Int(6) Auto_Increment Primary Key, 
 Biografia Text, 
 Nome VarChar(50) Not Null,
	 TipoArtista Char(1),
	 DataInizioAttivita Int(6),
	 DataFineAttivita Int(6)
	);

CREATE TABLE Album
	(IdAlbum Int(6) Auto_Increment Primary Key,
	 Titolo Char(50) Not Null,
	 Durata Double,
	 ImmagineCopertina Text, 
	 CodiceArtista Int(6) Not Null,
	 Foreign Key (CodiceArtista) References Artista(IdArtista)
	);

CREATE TABLE Edizione
	(IdEdizione Int(6) Auto_Increment Primary Key,
	 NumeroEdizione Int Not Null,
	 DataPubblicazione VarChar(20),
	 FormatoEdizione VarChar(50),
	 CodiceAlbum Int(6) Not Null,
	 Foreign Key (CodiceAlbum) References Album(IdAlbum)
	);

CREATE TABLE Brano
	(IdBrano Int(6) Auto_Increment Primary Key,
	 Titolo VarChar(50) Not Null,
	 Durata Double,
	 CodiceAlbum Int(6) Not Null,
	 Foreign Key (CodiceAlbum) References Album(IdAlbum)
	);

CREATE TABLE Utente
	(IdUtente Int(6) Auto_Increment Primary Key,
 NumeroTelefonico Int(12) Not Null,
 Email VarChar(50) Not Null,
 NomeEcognome VarChar(50) Not Null,
 UserName VarChar(50) Not Null
);

	/*tabelle delle relazioni*/
	
CREATE TABLE Registrazione
	(CodiceArtista Int(6),	 
CodiceSottoGenere Int(6),
	 Foreign Key (CodiceArtista) References Artista(IdArtista),
	 Foreign Key (CodiceSottoGenere) References SottoGenere(IdSottogenere)
	);

CREATE TABLE Composizione
	(CodiceBrano Int(6),
	 CodiceAutore Int(6),
	 Foreign Key (CodiceBrano) References Brano(IdBrano),
	 Foreign Key (CodiceAutore) References Autore(IdAutore)
	);

CREATE TABLE Feedback
	(Voto Int(6),
	 Giudizio Text,
	 CodiceUtente Int(6),
	 CodiceAlbum Int(6),
	 Foreign Key (CodiceUtente) References Utente(IdUtente),
	 Foreign Key (CodiceAlbum) References Album(IdAlbum)
	);

CREATE TABLE Contenuto
	(CodiceAlbum Int(6),
	 CodiceBrano Int(6),
	 Foreign Key (CodiceAlbum) References Album(IdAlbum),
	 Foreign Key (CodiceBrano) References Brano(IdBrano)
	);
	 
CREATE TABLE Esecuzione
	(CodiceArtista Int(6),
	 CodiceAlbum Int(6),
	 Foreign Key (CodiceArtista) References Artista(IdArtista),
 Foreign Key (CodiceAlbum) References Album(IdAlbum)
);

CREATE TABLE Pubblicazione
	(CodiceAlbum Int(6),
	 CodiceEdizione Int(6),
Foreign Key (CodiceAlbum) References Album(IdAlbum),
	 Foreign Key (CodiceEdizione) References Edizione(IdEdizione)
	);
	
CREATE TABLE Appartenenza
(CodiceGenere Int(6),
CodiceSottogenere Int(6),
	 Foreign Key (CodiceGenere) References Genere(IdGenere),
	 Foreign Key (CodiceSottoGenere) References SottoGenere(IdSottogenere)
	);

CREATE TABLE Prenotazione
(FlagAccettato Char(1),
	 DataPrenotazione VarChar(20),
	 CodiceP Int(6),
 CodiceUtente Int(6),
	 CodiceEdizione Int(6), 
 Foreign Key (CodiceUtente) References Utente(IdUtente),
	 Foreign Key (CodiceEdizione) References Edizione(IdEdizione)
	);

INSERT INTO Brano (IdBrano, Titolo, Durata, CodiceAlbum)
VALUES
(1, "The Rubberband Man", 7.25, 7),
(2, "Hey Jude", 7.10, 4),
(3, "The Sign", 2.46, 2),
(4, "Great Balls of Fire", 2.34, 3),
(5, "Dynamite", 3.43, 1),
(6, "American - III. Molto vivace", 3.36, 5),
(7, "Sing, Sing, Sing (With a Swing)", 5.23, 6);

INSERT INTO Autore (IdAutore, Nome)
VALUES
(10, "David Stewart and Jessica Agombar"), 
(11, "Antonín Dvořák"), 
(12, "Louis Prima"),
(13, "Thom Bell Linda Creed"), 
(14, "Paul McCartney"), 
(15, "Otis Blackwell and Jack Hammer"),
(16, "Lizzo");

INSERT INTO Album (IdAlbum, Titolo, Durata, ImmagineCopertina, CodiceArtista)
VALUES
(1, "Be", 28.30, "https://upload.wikimedia.org/wikipedia/commons/2/23/BeLogo.png", 55), 
(2, "Special", 35.10, "https://www.google.com/url?sa=i&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FSpecial_%2528Lizzo_album%2529&psig=AOvVaw0KcsC43VQSSlLu7AB93_Pm&ust=1675376052270000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCLjil6es9fwCFQAAAAAdAAAAABAE", 40),
(3, "Jerry Lee's Greatest!", 28.27, "https://upload.wikimedia.org/wikipedia/en/2/22/Jerry-Lee-Lewis_SUN-SLP1265.jpg", 59),
(4, "Hey Jude (Album)", 32.32, "https://i.etsystatic.com/6017061/r/il/ab5738/1719236070/il_794xN.1719236070_7f1k.jpg", 41),
(5, "String Quartet In F Major 'American'", 25.06, "https://www.flaminioonline.it/Immagini/Dvorak3.jpg", 62),
(6, "Sing, Sing, Sing (With a Swing)", 5.23, "https://upload.wikimedia.org/wikipedia/en/c/c6/Louis_Prima_Sing_Sing_Sing_Cover.jpg", 78),
(7, "Happiness Is Being With The Spinners", 34.15, "https://upload.wikimedia.org/wikipedia/en/9/92/Happinessisbeingwiththespinners.jpg", 21);

INSERT INTO Artista (IdArtista, Biografia, Nome, TipoArtista, DataInizioAttivita, DataFineAttivita)
VALUES
(21, "The Spinners è un gruppo musicale vocale soul-R&B statunitense. Formatisi nel 1954 a Detroit sotto il nome di The Domingoes, cambiarono il nome in The Spinners nel 1961. Si susseguirono varie formazioni del gruppo duranti gli anni di attività.", "Spinners", "G", 1954, 0000), 
(40, "Lizzo, pseudonimo di Melissa Viviane Jefferson (Detroit, 27 aprile 1988), è una cantante e rapper statunitense. Lizzo nasce a Detroit, cresce a Houston per poi trasferirsi a Minneapolis nel 2011. Ha iniziato la sua carriera da adolescente durante la permanenza a Houston, cominciando a rappare già a 14 anni. Poco dopo, il 15 ottobre 2013, Lizzo pubblica il suo album di esordio Lizzobangers, prodotto da Lazerbeak e Ryan Olson, orientandosi principalmente all'hip-hop classico. Dopo aver firmato un contratto con la Atlantic Records, il 7 ottobre 2016, Lizzo pubblica l'EP Coconut Oil, da cui viene estratta Good as Hell come singolo; Pubblica un nuovo singolo Juice il 4 gennaio 2019, che anticipa l'uscita del suo terzo album, seguito il 14 febbraio 2019 dall'annuncio della title track. Il singolo raggiunge immediatamente un ampio successo, soprattutto in Europa. Cuz I Love You viene pubblicato per la Atlantic il 19 aprile 2019 esordendo alla sesta posizione della Billboard 200. Quest'album segna un punto di svolta nella sua carriera, iniziando a ricevere grande attenzione dal pubblico.", "Lizzo", "M", 2010, 0000), 
(41, "The Beatles sono stati un gruppo musicale britannico, fondato a Liverpool nel 1960 e attivo fino al 1970. Il gruppo era composto da John Lennon (1940-1980), Paul McCartney (1942), George Harrison (1943-2001) e Ringo Starr (1940), quest'ultimo a partire dal 1962, chiamato a sostituire Pete Best (1941); della prima formazione faceva parte anche Stuart Sutcliffe (1940-1962). Ritenuti un fenomeno di comunicazione di massa di proporzioni internazionali, i Beatles hanno segnato un'epoca nella musica, nel costume, nella moda e nella pop art. A distanza di vari decenni dal loro scioglimento ufficiale – e dopo la morte di due dei quattro componenti – i Beatles contano ancora un enorme seguito e numerosi sono i loro fan club esistenti in ogni parte del mondo.", "The Beatles", "G", 1960, 1970),
(55, "I BTS (방탄소년단?, 防彈少年團?, Bangtan SonyeondanLR, Pangt'an SonyǒndanMR), conosciuti anche come Bangtan Boys, sono un gruppo musicale sudcoreano formatosi a Seul nel 2013 e composto da RM, Jin, Suga, J-Hope, Jimin, V e Jungkook. Nella loro musica, di stampo hip-hop, abbracciano un'ampia gamma di generi ed esplorano temi differenti, dalle ansie scolastiche alla situazione sociale, dalla salute mentale all'amor proprio. Nel 2017 hanno introdotto il k-pop nel mercato mainstream statunitense, diventando in seguito il primo artista sudcoreano a raggiungere sia la vetta della Billboard 200 che della Billboard Hot 100. Nel 2020 e nel 2021 sono stati il primo artista per numero di vendite a livello mondiale secondo la IFPI.", "BTS", "G", 2013, 2022), 
(59, "Jerry Lee Lewis è stato un pianista e cantante statunitense. Considerato come uno dei più grandi artisti del XX secolo e, dalla critica, tra i più grandi esponenti del rock n'roll, di cui è considerato anche uno dei padri fondatori, viene spesso citato come influenza da numerosi artisti tra cui Elton John e Billy Joel. Ha un posto nella Rock and Roll Hall of Fame dal 1986 e uno nella Rockabilly Hall of Fame, e recentemente, anche nella Country Music Hall Of Fame. La rivista Rolling Stone lo ha inserito al ventiquattresimo posto nella classifica dei 100 migliori artisti di tutti i tempi. È stato soprannominato The Killer per il suo modo selvaggio, anticonformista e ribelle di esibirsi dal vivo. Inoltre è considerato uno dei re del rock and roll insieme ad Elvis Presley, Chuck Berry, Bo Diddley e Little Richard.", "Jerry Lee Lewis", "M", 1949, 2022),
(62, "Antonín Leopold Dvořák è stato un compositore ceco. Insieme a Bedřich Smetana e Leoš Janáček è stato uno dei massimi protagonisti della musica boema del XIX secolo. Noto soprattutto per le sue composizioni sinfoniche, sebbene influenzato dalla musica tedesca, di Brahms e di Wagner in particolare, con un linguaggio spontaneo ha trovato spesso ispirazione dai canti popolari e di osteria della sua terra, fondendoli con maestria sinfonica e con un sapiente uso del colore orchestrale.", "Antonín Dvořák", "M", 1865, 1904),
(78, "Benjamin David 'Benny' Goodman è stato un clarinettista, compositore e bandleader statunitense. Ottenne grande successo specialmente negli anni trenta con la sua Big Band ed è ritenuto il più importante protagonista dello swing.", "Benny Goodman and His Orchestra", "O", 1926, 1986);

INSERT INTO SottoGenere (IdSottogenere, Tipologia, CodiceGenere)
VALUES
(001, 'K-pop', 010),
(002, 'Rap/Pop', 010),
(003, 'Country/Rock', 011),
(004, 'Jazz/Swing', 011),
(005, 'Sinfonia', 011),
(006, 'Pop', 010),
(007, 'R&B/soul', 010);

INSERT INTO Genere (IdGenere, Tipologia)
VALUES
(010, 'POP'),
(011, 'CLASSICO');

INSERT INTO Edizione (IdEdizione, NumeroEdizione, DataPubblicazione, FormatoEdizione, CodiceAlbum)
VALUES
(070, 3, '1970/1979', 'Vinile', 04),
(069, 2, '2020', 'CD', 01),
(068, 2, '2022', 'CD/Vinile', 02),
(067, 2, '1961/1989', 'Vinile/CD', 03),
(066, 2, '1976/2013', 'Vinile/CD', 07),
(065, 1, '1968', 'Vinile', 05),
(064, 1, '1955', 'Vinile', 06);

INSERT INTO Utente (IdUtente, NumeroTelefonico, Email, NomeEcognome, UserName)
VALUES
(0921, 39076543, 'giovcal@gmail.com', 'Giovanni_Calaresu', 'Gio21'),
(0922, 39654320, 'marrcat@gmail.com', 'Caterina_Marras', 'Cat11'),
(0923, 39054987, 'giuliasolinas25@gmail.com', 'Giulia_Solinas', 'Sol0'),
(0924, 39746323, 'sannantonio@gmail.com', 'Antonio_Sanna', 'AS7'),
(0925, 39080356, 'faedda45faedda@gmail.com', 'Francesco_Faedda', 'FF10'),
(0926, 39756431, 'Bmelis@gmail.com', 'Bachisio_Melis', '8melSal'),
(0927, 39432445, 'angelina64@gmail.com', 'Angela_Sechi', '4NA');

/* Codice per popolare le relazioni*/

INSERT INTO Registrazione (CodiceArtista, CodiceSottogenere)
VALUES
(21, 007),
(40, 002),
(41, 006),
(55, 001),
(59, 003),
(62, 005),
(78, 004);

INSERT INTO Composizione (CodiceBrano, CodiceAutore)
VALUES
(1, 13),
(2, 14),
(3, 16),
(4, 15),
(5, 10),
(6, 11),
(7, 12);

INSERT INTO Contenuto (CodiceAlbum, CodiceBrano)
VALUES
(01, 5),
(02, 3),
(03, 4),
(04, 2),
(05, 6),
(06, 7),
(07, 1);
	 
INSERT INTO Esecuzione (CodiceArtista, CodiceAlbum)
VALUES
(21, 07),
(40, 02),
(41, 04),
(55, 01),
(59, 03),
(62, 05),
(78, 06);


INSERT INTO Pubblicazione (CodiceAlbum, CodiceEdizione)
VALUES
(01, 069),
(02, 068),
(03, 067),
(04, 070),
(05, 065),
(06, 064),
(07, 066);

INSERT INTO Appartenenza (CodiceGenere, CodiceSottogenere)
VALUES
(010, 001),
(010, 002),
(011, 003),
(011, 004),
(011, 005),
(010, 006),
(010, 007);

INSERT INTO Feedback (Voto, Giudizio, CodiceUtente, CodiceAlbum)
VALUES
(4, 'Un lavoro particolare ed intimo dei BTS che in questo album hanno partecipato a diversi aspetti della sua creazione (packaging, art director, planning etc).
Ogni membro ha partecipato nella composizione delle canzoni, eccetto per dynamite.
Il retroscena del processo creativo e organizzativo si può guardare sul canale youtube bangtantv, nella playlist dal titolo log (on), che ha i sottotitoli in inglese.
I brani affrontano i temi della pandemia life goes on, fly to my room, stay e in un certo qual modo telepathy, della depressione blues & grey e del rapporto amore-odio con il lavoro dis-ease; infine l album finisce con dynamite, canzone estiva e hit dell agosto 2020.', 0924, 01),
(5, 'Ho conosciuto questa band grazie ai film della Marvel e non posso esserne più felice!', 0925, 07),
(5, 'Ottimo disco per chi ama la collezione completa dei b. E’ imperdibile ci sono delle incisioni perfette canzoni che non hanno mai tempo e storia indimenticabile di uno stile unico e che lascerà nella musica il suo solco.', 0921, 04),
(4, 'Questo album consacra il suo essere una stella ormai nata e cresciuta.
Eccessiva, in tutto quel che fa! Ma solo lei può!
Special si presenta molto più pop rispetto al precedente Cuz I Love you, ma comunque in grandissima forma.', 0926, 02),
(1, 'Così noiosooooooo. Pessimo acquisto', 0922, 05),
(3, 'Molto soddisfatta dell acquisto! Splendido LP per far rivivere al mio papà la sua gioventù', 0923, 03),
(4, 'Il vecchio swing non smentisce mai!', 0927, 06);
	
INSERT INTO Prenotazione (FlagAccettato, DataPrenotazione, CodiceP, CodiceUtente, CodiceEdizione)
VALUES
('S', '2021-03-11', '0101', 0924, 069),
('N', '2022-06-21', '0102', 0925, 066),
('S', '2021-11-05', '0103', 0921, 070),
('S', '2022-12-22', '0104', 0926, 068),
('N', '2017-08-13', '0105', 0922, 065),
('N', '2019-09-01', '0106', 0923, 067),
('S', '2019-05-19', '0107', 0927, 064);


/* Operazione In SQL*/

SELECT Edizione.DataPubblicazione, Album.Titolo
FROM Edizione, Brano, Album
WHERE Brano.Titolo = 'Hey Jude'
AND Edizione.CodiceAlbum = Album.IdAlbum
AND Brano.CodiceAlbum = Album.IdAlbum;

SELECT Brano.Durata, Artista.Nome, Artista.DataInizioAttivita, Artista.DataFineAttivita
FROM Brano, Album, Artista
WHERE Brano.Titolo = 'Hey Jude'
AND Brano.CodiceAlbum = Album.IdAlbum
AND Album.CodiceArtista = Artista.IdArtista;

SELECT Autore.Nome
FROM Brano, Composizione, Autore
WHERE Brano.Titolo = 'Hey Jude'
AND Composizione.CodiceBrano = Brano.IdBrano
AND Composizione.CodiceAutore = Autore.IdAutore;

SELECT Utente.*, Prenotazione.*, Edizione.*
FROM Utente, Prenotazione, Edizione
WHERE Utente.IdUtente = Prenotazione.CodiceUtente
AND Prenotazione.CodiceEdizione = Edizione.IdEdizione
AND Prenotazione.CodiceP = 0104;

SELECT Utente.NomeEcognome AS NomeUtente, Album.Titolo AS TitoloAlbum, Feedback.Voto AS VotoRecensione, Feedback.Giudizio AS TestoRecensione
FROM Feedback
JOIN Utente On Feedback.CodiceUtente = Utente.IdUtente
JOIN Album On Feedback.CodiceAlbum = Album.IdAlbum
WHERE Album.IdAlbum IN (
    SELECT COdiceAlbum
    FROM Feedback
    GROUP BY CodiceAlbum
    HAVING AVG(Voto) > 4
    ) ;