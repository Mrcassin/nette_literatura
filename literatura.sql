-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Pon 23. dub 2018, 19:25
-- Verze serveru: 10.1.30-MariaDB
-- Verze PHP: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `literatura`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `item`
--

CREATE TABLE `item` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8_czech_ci NOT NULL,
  `author` varchar(100) COLLATE utf8_czech_ci NOT NULL,
  `anotation` text COLLATE utf8_czech_ci,
  `year` year(4) DEFAULT NULL,
  `category` enum('drama','poezie','próza') COLLATE utf8_czech_ci NOT NULL,
  `stars` enum('1','2','3','4','5') COLLATE utf8_czech_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `item`
--

INSERT INTO `item` (`id`, `title`, `author`, `anotation`, `year`, `category`, `stars`) VALUES
(1, 'Muž a žena', 'Michal Viewegh', 'Novinka Muž a žena přináší dvě novely, které tradičně řeší vztahy mezi muži a ženami. Druhá z nich pracuje i s mírně fantastickým námětem, kdy její hrdinka dokáže lidem číst myšlenky.', 2018, 'próza', '3'),
(2, 'Macbeth', 'Jo Nesbo', 'Když se nepodařený zátah na dealery zvrhne v krveprolití, přichází inspektor Macbeth se svým týmem rychlého nasazení, aby zachránil situaci. Macbeth je však i vyléčený feťák s problematickou, trýznivou minulostí. Macbetha pronásledují halucinace a paranoidní představy o tom, jak mu osud brání v oprávněném vzestupu. Jak se má dostat k tomu, na co má právo? Tak, že začne vraždit...', 2018, 'próza', '5'),
(3, 'Dívka ve vlaku', 'Paula Hawkins', 'Rachel dojíždí ranním vlakem do Londýna. Den co den si prohlíží útulné předměstské domky, a když vlak na chvíli zastaví u návěstidla, naskýtá se jí pravidelně letmý pohled do soukromí mladého páru. Postupem času Rachel začíná mít pocit, že ty dva lidi zná. Jednoho dne však zahlédne něco, co ji šokuje. Stačí pouhá minuta, než se dá vlak zase do pohybu, a náhle je všechno jinak…', 2015, 'próza', '4'),
(4, 'Tramvaj do stanice Touha', 'Tennessee Williams', 'Příběh odehrávající se po válce ve francouzské čtvrti New Orelansu sleduje hluboce niterný život citlivé a iluzí plné Blanche DuBoisové, přijíždějící navštívit svou vitální sestru Stellu, která se provdala za primitivního hrubce Stanleyho Kowalského. Ve chvíli kdy si žena poznamenaná smrtí homosexuálního manžela myslí, že našla štěstí v novém vztahu, dojde k zborcení veškerých iluzí.', 1947, 'drama', '5'),
(5, 'Audience', 'Václav Havel', 'Hrdinou hry je zakázaný spisovatel Vaněk, který pracuje v pivovaru jako „přikulovač sudů“. Jeho nadřízený Sládek ho pozve do své kanceláře k rozhovoru. Jedná s ním přátelsky, spisovatel se však cítí nesvůj. Je vytržen ze svého prostředí, dělnickým zvykům /pití piva/ přivyká jen s obtížemi, kromě toho neví, jestli na něj jeho nadřízený nechystá nějaký podraz. Sládek mu dá zvláštní návrh - přesvědčuje ho, aby sám na sebe psal hlášení tajné policii. Vaněk odmítne, přesto že mu Sládek za to nabízí „ teplé místo ve skladu“. Ve hře jde mimo jiné o kritiku pokrytectví.', 1975, 'drama', '4'),
(6, 'Smuténka', 'Jan Skácel', 'Básně sbírky Smuténka obyčejně začínají lyrickým popisem a v závěru vyústí do pointy, která míří až do oblasti morálky. Toto etické vyústění básní má Jan Skácel společné zase s jiným českým básníkem, Miroslavem Holubem. Obsahuje básně jako Chvíle, Smlouva, Zlatá brána, Smlouva...', 1965, 'poezie', '4'),
(7, 'Miluju tě k zbláznění', 'Jáchym Topol', 'Básnická sbírka, obsahuje cykly Náhodnejch 23, Vlhký básně a jiný příběhy, Krajina s Indiánama.', 1994, 'poezie', '3');

--
-- Klíče pro exportované tabulky
--

--
-- Klíče pro tabulku `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `item`
--
ALTER TABLE `item`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
