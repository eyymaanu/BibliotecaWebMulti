/*
SQLyog Community v13.2.1 (64 bit)
MySQL - 10.4.32-MariaDB : Database - proyecto
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`proyecto` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci */;

USE `proyecto`;

/*Table structure for table `autores` */

DROP TABLE IF EXISTS `autores`;

CREATE TABLE `autores` (
  `Autores_id` int(11) NOT NULL AUTO_INCREMENT,
  `Autor_nombre` varchar(100) NOT NULL,
  `Autor_apellido` varchar(100) NOT NULL,
  PRIMARY KEY (`Autores_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

/*Data for the table `autores` */

insert  into `autores`(`Autores_id`,`Autor_nombre`,`Autor_apellido`) values 
(1,'Paulo','Coelho');

/*Table structure for table `devolucion_cab` */

DROP TABLE IF EXISTS `devolucion_cab`;

CREATE TABLE `devolucion_cab` (
  `devo_numero` int(11) NOT NULL AUTO_INCREMENT,
  `devo_fecha` datetime NOT NULL,
  `devo_fechadev` datetime DEFAULT NULL,
  `devo_usu_codigo` int(11) DEFAULT NULL,
  PRIMARY KEY (`devo_numero`),
  KEY `devo_usu_codigo` (`devo_usu_codigo`),
  CONSTRAINT `devolucion_cab_ibfk_1` FOREIGN KEY (`devo_usu_codigo`) REFERENCES `usuarios` (`usu_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

/*Data for the table `devolucion_cab` */

/*Table structure for table `devolucion_detalles` */

DROP TABLE IF EXISTS `devolucion_detalles`;

CREATE TABLE `devolucion_detalles` (
  `devo_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `devo_codigonum` int(11) DEFAULT NULL,
  `devo_arti` varchar(100) DEFAULT NULL,
  `devo_cantidad` int(11) DEFAULT NULL,
  `devo_libros_codigo` int(11) DEFAULT NULL,
  PRIMARY KEY (`devo_codigo`),
  KEY `devo_codigonum` (`devo_codigonum`),
  KEY `devo_libros_codigo` (`devo_libros_codigo`),
  CONSTRAINT `devolucion_detalles_ibfk_1` FOREIGN KEY (`devo_codigonum`) REFERENCES `devolucion_cab` (`devo_numero`),
  CONSTRAINT `devolucion_detalles_ibfk_2` FOREIGN KEY (`devo_libros_codigo`) REFERENCES `libros` (`lib_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

/*Data for the table `devolucion_detalles` */

/*Table structure for table `libros` */

DROP TABLE IF EXISTS `libros`;

CREATE TABLE `libros` (
  `lib_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `lib_autor_codigo` int(11) DEFAULT NULL,
  `lib_titulo` varchar(100) NOT NULL,
  `lib_categoria` varchar(100) DEFAULT NULL,
  `lib_img` blob DEFAULT NULL,
  `lib_cantidad_real` int(11) DEFAULT NULL,
  `stock_actual` int(11) DEFAULT NULL,
  PRIMARY KEY (`lib_codigo`),
  UNIQUE KEY `lib_titulo` (`lib_titulo`),
  KEY `lib_autor_codigo` (`lib_autor_codigo`),
  CONSTRAINT `libros_ibfk_1` FOREIGN KEY (`lib_autor_codigo`) REFERENCES `autores` (`Autores_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

/*Data for the table `libros` */

insert  into `libros`(`lib_codigo`,`lib_autor_codigo`,`lib_titulo`,`lib_categoria`,`lib_img`,`lib_cantidad_real`,`stock_actual`) values 
(2,1,'El Alquimista','Novela','ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0„\0	\Z\Z\Z\Z\Z( \Z&\"1\"%)+...383,7(-.+\n\n\n\r/% &-+-.-5-/-----05-----------------------------------ÿÀ\0\0½\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0G\0\0\0\0!1AQaq\"‘2¡±ÑðÁá#BRSbr‚’²ñ3¢$CÃ4ÂDcsƒ£ÿÄ\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\00\0\0\0\0\0\0\0!1QAa\"23qB‘ðR±¡ÁñÿÚ\0\0\0?\0ú]Rö5´ZÒ’wY5–íR%iÕûÕKgÊñÆÐ]>%–},ÐþUcö¨õ©\r¤Éÿ\0ºê‰îkÝÍ)ï²ì‡Ãü™¶ü ÏíýBºvƒ#þê?¨|ëZ¨ë½ö]Žøt?É›Ê,þÕÔ+Ãi³ûTP¬?w\\(®÷Ùv\'áÐÿ\0&n+1ûTP¨®ÇíQëXpŠïwSï’ì‰øt;³mùaÚ§ß\\ü·‡ý¨÷ü«ÖJ6I=5×*|Ÿc¾‹‹fÌíÌ?í¢¾UÁ·°ß´ÿ\0Š¾U‹(å^É]ï“\'áøû³gù\rûOø¯å^ÿ\0Ô×ÿ\0ŠþUŒÉ^ÉSïsô;áøû³h6þöŸñWÊ¤6æö£Ðº±9+™+½îD|?vn“¶°ÿ\0µ@êcãE±¶°ÿ\0¶oúÓ_9SuR›«-\\»ýŸìúÃ{Mƒ£ÍŸçOÎ‰JÁÐƒ_StÏ²ÎñMbTy…Zÿ\0[¨±Õ[ÝÉ ¤ÚgÔëÂ½^špÍ3ëTR\r¶3)\'øªœ¼i^ÐLåé÷šÎ×?•\ri6È\0Z¨¨âŠðn²Í>°>ê¼Ú ‚\0?Ä$yŠ7»¯!«Žµ1nÉsØîÐp#0éa¢×v…*ÊÏ*RÒr¨ÐEŠÃ´¾Ëwå’H!I\n…(Øk¾ÛëíËs»OpÜ(6ÙT•90²œÞSA·±pÎGzâ{Ä­m£ÄãîH‚µNY žœ«G$a)¸y‰cÉ8ÅNÎ9³V•%$	X”ø“r3=EOòZûÒÏ‡8\0ÁRwÜu1Dm–Þ`U—*ÚÒ¬¦P•~j?Ê¯é4r°ŠEo)0Ù\reY²IÊS\0ó»[Õž7çåÿ\0!ªuüÿ\0À7fN$¤+Ù*J€6”ñèiÇÃ)hQÜ•8T¥	FI<+CÙÜ*›Å¿˜Gç_ò¬¨¤ô Ð[7UƒÅa…Õ•åÂUâ$<~¬±\'†ÿ\0S*óµ.µÍ\"…`7ß%I[s’LÀ‚½ESÜÑÛAß³à\\l¤‡Ê†ÛˆVm	Á\"óÊ¼Ûð¥rÅE&¼ü†qem´À;ªðfî+½Å¨7X¸5^\rS³Ô{Šî²Ýbå7U©ºdY5R™«)–R)º#d¢hÿ\0÷ýÂ­S5f¨q÷ÓñHÏr&þV}*½é¯VñæŒ«Ô;íÈOJ½êµ\rÊSÒÕÇ©$©X/s]Ñªl’\0çB½Žm;ç§ÌÒ2‚,v.RúQYf»ÝÄƒÄXÐomCú ·4/~ëŠ	’m\Z{…ª7°ÌtókæØ%<$æ.8o0·¡ä`T1ÉiI)S„®E©3Èå7hm±ˆo\n´²ûF%C1Nb–ÛNâ².wÀß·Ã‹p‘ß1‡R	¸m+B€ÞR¢£=7ñyFQiÍÓ)FKåM¯Ù³‰F9\"aRhŒi<ëÏ+\n¥fPRˆÒdÐLPøF¤Ê’I6à&Þê a(/+O‘µ¦ÅGp¡–Ë>)ÏZ»¬\"RP“ªrª>ZYH©¥‚tÐ\Z¯‹}Îzl}ÂpL4€ÐNmÀkä)’ð„D‚\'I¤%³¹DsƒäE2í¹Wy‚ ßó¿ÚÝ#’2“åeÆá8Å=˜j°jJHyÍU´PÙnIPP¹$Ÿ÷u=jlãÎPTÙˆÔL{êrâ„cŸ*ÁEM¹.Î‰*%š¹8öÎåzXAxã”Ðbøeššå–*\nÃÓñ³úBº„1]ÐŸî¹.P¥xz‹,Bæ>4Ùxz¯¸®éi—Yv55Ø¯\nõz4b\'G:Mµ±®%a)Z€Ê,	¹S—E#Ú¨—ð§ûEgk]$?ìè©eß°:žRŒ’IæMvjÔ²*ä¤u•)›{.€4ï³þt“¨IP>–)Ê»Ž-,.$oFøç¿Ê§E‘o‹žž9(‹’Üâqn(xÔúÓü©ð HA]0ÆáÚyÅ;‡q®\nÛ*	PP9U¥€xM¼:»î´Êw•-2z$I£j0ä–VÒ´üÁéócŽ$›¦¼¼ÿ\0€ÞÏàÃ®x®”‰#/•*Ø»_µ÷Êp„ª\Z\rÉ9xÆýf‹ìÎÜ@ZÜ‚\ZR”`ÎP¯ˆ7ÓãT·†e\\bîJÔ ®õ£˜¤¦fD‘aÂ‹ã‹äú¯ï`s§™øŸK[{6Î#ËbÁð£qANb:…Jlb‹XÏýÒYi”£#(%JQ7Q[hAÓÅÂyÐjÚêÄãS‰JHe‘¬Ö+“+Tn\0„ï€ÃlŽ÷ÿ\0ie¥”­.©(6˜7¼‰ŽÔÃp¹øVÂê3ù<^)ÿ\0X?j%÷å¦\\B#Ä¥„¤(î)H$ñ™ÔÃ¶žÖÿ\0Ùýˆ¥ÈÄ²µ6çyúË\0†ÇEzEöháû>\\Cy™\'0ñÉ”G‡Ãs Pq·/Õ:4¢ñtÛI‡b(ÙŽ¨•\'@±™30JwÆ¾TGeyÄº‡Ü.‚JR\"A [N”»Ãý‰Ì:±\r¥ÇJg<	‚&cJ»³ÛWÈRœy\0Ú¼oÒŽmxKÊ·ž;Y]o{lWØaß¤8»åH1ÄŸðhÌí—Ô¤¼ëŠ=â®‰ð“ N‚8Žwd±íá¼!aÄD)H\n0$Á‚ê9ÔÞ9qLwYÊ‡ŒgJI’’ßµ\"à[…ˆV>T·þöÕäo\';{Œöü7ˆFp9ƒ\nûš•mzñ˜•b\nB{¶‚„	%J#t“§\0(œ&2NUYCqßÓˆ¤õˆÜ8ÓFkëä`Þ)iÑG¡¸÷ÑlíÖO˜ùPu4‘JÇ,£Áyâ„¹FÜWMA£áøTz¸»G™|™7 Úëì	þÔÓ×k5¶Õùãm±4†­]û9ÖGø8\\áj÷|xšJ$Éú‹œÆ‘xÑ´¤öƒÄTÓˆ<(\0£-ïø×B²Úäñ¼7ÐùU4_¨-öÛsÛ@WP\rAœ>ËhÊTëÒÎ¤—ºûª:\Zá°Ñ	µ¢ pm“%	ž0($½V%ÙãåCxÚó$8(nªÝJUí\0z‰ª‡­p¬ßê*¾D¤’\0€\0éjäŽÒ‡q©Wt“H\"EzÜQš»ÞTt“A)PÅ6’d¤OKÕYêAUZgPDTTuõº ]ªîŽ¢sD2‚t¡	® Ájä8ì}|þð«f‡ÙÊ–›?¸>Ez¼_Bü#ÉdU\'ù2šÊm”žý^#ú6·ê\'ÎµOšÅíÝ ”âNRL¦ÿ\0ÊšS=¶¨kBâ¦ï±YJÖzþ,‹áBH™…qÖˆghØŒ„ƒ¨$A¥ä¥ØÖŒ¡ÜœÇ´ <ÅH¾€`+7¨øin#fÍŽµcjå/UèîYe½wyõzînt2xUèI5F¨,]–%c­\\ÚãHó¨†m;º×TtËY($’LÍu&ºÌzŠÖOõ\n†Éº=5áéR#¤ŠâMTî£ÕÚq²Ê¾ÏŠ!)R›h©¹BTB²¬ˆ´ªàXð¥Ügq.dyS*eP$æðä‘çVXíXy}n5Ç¯rÅ4 $¥@ä=j Ñ[}Õ}‹	*3ö˜2fFW½ÚP‘Tœ)\'Ü6Ýw~M¢É©Us]„ÐrÐjb©¬J¯Td³è$þe¿á]±°ßO¼Ñâ½6·Â<†eY%ùf9í>êÀmäÎ-Í=¡ý©­ûÕ’Ú˜iÄ,ÇézØR¹æ¢Ð}>¹4)F›«Ñ‚4Á¬€Ò.µé¸¤¥Ÿ±±áE-ÅHÙ*:\nèÁÀº…Y‹Ú%RáÀÒµ:¹‰×J´TåÉW(ÇÈ`”Çé{Ê‰oØ¥è¯&W“®ê²8Îk¥‰>Ye•ÕP[ï³>Oòßñ©¤èh`™ÔEZ–8T´‘r.Iÿ\0b\0ªÐÔUéM\nL:õ&:U€\rÂ D4Ý\nS¢Ô3Ø­­LbÂB¤² ˜™Í•qoÒ“`vKÊe}èJ@q]æh)UÎ},£Eb6pZ©@&ðSð\"—œ+$A.”ðÌHþê¼rEÆ•‰øOÄ”¶Þ‡[s\n¥à°ÙA!8¢`Ù9¹åq~t\"šP¤²JL¹á`yUŠy3á\nŽqî¼ÔIÚK±|Ppo~]Sg­@\Z¹\nš™H4?ÈÊ›@àÔÓº¼¦8TRL‰¨k°E4Íÿ\0gÏý:<ÿ\0¸Ó¥]™Wý:z«âi­z\r?ÚáWS÷eùf7mHöÀÊ¹\0\\êxÓ§Í¦ƒ®”+Ù’IàÉä\nÎÖ½â5 täý/f«ì.»ÞîÔ¤M€`¤GQY$É0¸­WböƒŽb1iPCÐ¦\0”©\0sF½+´pÇóÌE›QËÍÄø:Šˆ%TƒcÊúÚ—žæï°¯,¥Ä©aArÀH)©}7Öb2VÊ¥É#ˆ_…kÿ\0ÓeÈÄ\'þJÅö+q¦A\0æ\'\\ A$Ž;¼ÅY\'L¬gå“|šÃx’:¨|êÔ†F®&Ü/Ë¥¶öšÄ¯†Ã2¤²r­ÇÃŽ)k‰TB†P&-ÀéM;i³˜Ãµ†Sm¥%×^¦Á¹Ê	21iª¼Né°Þö¶¤T¼k‰ô	¯k«n¿…‰eÉÄ£ÛniáÌb0TI>4_apí=™.0ÙÊ”¯&fscpÐ\n	Uœµn›®Øl[EBRbou¦-­K¶pª|¡„¬¶”Ê…$g“ gƒ¯Aì,\\¯ÄÒ…0©€œðr€Eã¨§=²Ã!¼K(m´©µ©@$\\…$	‹èj¾wL»ÊÜã^À\"v“\\ÎºîÙ\0xÍÏÊ›<†Î^!l!*H3ÝšË®`‘¼I×J—fÖ-mÌm@H9ÔA‘u˜(@¼Þª°C’%ª{íÇ&mìzÜ±Q­Â „‘x<ïjoÙ Òž§’Þe6]p‚áRdNX€	\Zi¨í„%¬jÚBD¡Ä¤Ý>,À‚7‰Iõ¢8ÒØ˜f¹S\\ðU´ö«m¦Ö^‘ÞPœ§4«BJ¢#ž•&þµ§|„`[t!´-Kh(¥ {J…Fð+¸,û3¯°„¾ð³hQðÚ&DÜÁ&7ÀãT”z©\"!B\r»æ…IBŒÂa–á„‰´ž\0q&…‰\r­/2Þr‘¥¾íITdÝ1<ëKÙ7Š›q$\0n2g4æ;ôOæJËäÏ(ãrHÏ4 ¡ È:\Z™\0Ð½œqO%¢àe¦Èí¥IHÊ”zkM6^ÓC¸¢Ó-4¼:W“9\nR–rÝITÄHÒOw¹yg¯-êÍ?f“¦šÐ¸‚s¥\"\0]‡T¤ýæ‰­Ì\n±¥è`æ—TÜ»˜¬A¤›¶[%µ;ˆ{ºB…””$•8¡è;~³8×±Eå‰P@Z‚RÑ	E‰LéÎiMu&Æ4p”­/Ü+·Ò¤¨âŸVB	J•)P\Z…Oj¯ýHÁBÙÄ¤xV;¥›ó[gûÇ ¯`–¤Ä*àköçÖifßÆãÑÿ\0Ö+!\Z™\"ÇK¢•Ã6åMê0SR‚ÿ\0¦ Æ o†ÿ\0òEg¿ÒRCÉIÕM)\"xÊU‰>”³\r¶±l !œJ›J`x[dÉ¹¹)&bMÎãK]Ç¾V·%@ˆXJˆ$‚;°É&Eý)åÓõ’}MûO‚[8ìJJOç+Oï%g7‡Ž¥1ÈÖ·ýH9YÁfŸhÈÓþÖþÆvÃh8ßwö¢<>Ò[BVF‡Ç1kOþ¨®0ØûÚõkãPÓêVVÚé°Ò;Ý†è@Ì@$$ø]JÍ…æÅþž²AqY””¦äpž}|ûfv“‡¸w$Ü‚¤õ!S8yéV3¶±ß´/êH²¼!)$–8ˆýÕ^7ARo©/1ÆËµ”©*¬DGçyFúÛ¥åÆa¹´èôSdïæ+/…Ú©å¼¼A.¨\0$%#@\0\"ÿ\03z–\'ŒQÊî)Å$–€ƒÀå††„ã»·ÈÊŒ›„«ƒ]µTÈ|2¨ú,ð©vø×¤dOÆ²glcáµ¡1R–ÈŽrŸ¿}Oþ)	ÊŒRÑ$¨©!&çqŽ1P’I+à‡†mN¼Éö\\F(rÅ8^ñBŠí²‚vœ¸þ·EÓ¸„¨¹ö—\nÈËœ„H:®ýh<[øµŠqÀ0 EÆ€oçDM6Èx²FQ•poiNmŽƒ¸)“ÿ\0õï¥˜,f#„¸Ê‚RµgARcÚ\Z‚y})J¶¾4ÜãH<1ÈFZ·gí<R\râ™%Jð¡ADÄÈRHžb*zi\"°Œ¾k\\»7/lœCShB[FbâIÉI#7²DN§Z£ý9Å—P¥*Ä¥?ª±øµb1)ˆRÑ¯vPƒÂR€¿Â˜aq5¥–Ì@\"iP Ž´95h¼tòp’[_»²Ì)im•›”*ÚA2;\Zx¶ßo–o¹Ã·‘KPMÝ›ªVDik8q8µ¨)ÜJ×@\0î0„‰5v5X‡à?‰ZÛÍ€”üy\0ÍçTùS{—ž,³é¿ãþÏ¦4˜*æ©ÿ\0ŠGÝVÒNËb´(-eyTf$˜“ÔÞÖ¶	ucLÇË	¸³ù¬Þ(žõ_Æ¯\\Õ¢|Vuÿ\0÷UüJŸê5›­å\Z>Ëú¤uñ»üU]¢D´›éÓˆúš¹£&fô?iÊ†õ›ÄO(<8Ò0ûŠ<¼	6´™àn@·.tº’fmåÃ—\n7 ‘ îô2mÏ‰øPN&HˆÒ7k1¼ë|ô­ˆ³*h¥+´iëckþ Ú¯Å¾€ÚÓ†îÒ<?™*) ‚\n”aQ7­f\\]í>_=õq¹‰×©¶‚®Òä$Ò«xøè×Æ(Ö])#ŒO_‡ÀÒ×–Up@å¯¯/Æ­dÉ’	çÏ™ó×¥s[Œ©ŽØv`Ÿ¼\\ýÿ\0u9eô­9Uü¦ö6µÇ5™A›Ä	jx˜Ó|km(Ö\\TØA\'C¬ƒ$_M\'Èù­’;‹%Üi@èoçÒ<þú!€m\\=Ô>N—ÅÀÔOôÅ¥OÖïŽ”¼Û\\ŽB)ðY†q3îéÓ]Ô*Nb<†±Â§Ã”\0¤ÉéyZƒZ‚¡FÄb4;Áæ#ÝQ¹GIù/\'Kñãó®)£ºÚ{þ¾¦¹†Yóôú÷s£T‰5ŸŸ×¥© n	îŠ\Zp=5>¾ï}‡	üj„·7OÏ—Ÿá\\:ó¸ùq®i2 ÔDï¢µ\0Ó×¿ÈúÑM¹4)Á†‹LØö9^z§ï­¬ÏcWþèþñ­=ji~Ò0u¿~_·ú0¯\ZÏ8z£ûÊþãzÐ<k;›óŠTuã0>uŸ®å\rû/™2›Ä}Z’ö¡Ùu\"l‘s¼ýuò†€\'€“©¬^Ö|I“˜Á×x\"g¬Ûè«§W;ÌöFE·\\”€€&J¥YÔÃIP¸éQÄ`Ô¥¥ ´¥E\0•ë‚<*Ô?•.6 —*	\n%\nÑŽ¦ÂkŽí\"¤”&xHÙÚK#‚›˜7áZq3§hQˆÁ:¦Ô’¯a%$\rQ©“k\n¹Ížù!ÓQ`[p^4\"`*G ¢q›mN-µ÷h@mJ€œÃUw„^ö*Uõ9¸ÜÞ½¼²\nr øŠâHñ}¡X„ø§õ”Dpß4[`U‹—€wsj¾‡\"îÁ4€}D\'cºD­K	B³ ¶[\n˜ŸÚ$n½ªÖöËÙ›Ì¯÷sÌ*BàýÌ±§yV`¶êQù´¨ ¬Žð­G2ÔÊÉ9Œ•$°=LAËÜˆ§|á˜Z³eJ‰P‚BGé^TÏ³TøT\0l¬xs„‰È4¹=h<Ñ-÷À%\'½$”ª\n5T¤‹ÁVò\r„&X\'k)ÎòR€—ûÄÉ’TÚ\Z*\0€D\rü€9‹—!¬É\0–×ít*Æb#-‡¨¢˜6\\æMŒÚ4±¾” ÚŽ)Ä­HL¥Or8”´@!\0(^dï®±#[rJ³M¯*Q$7Eâ)\\ŠÐö	J÷CÔ -$o>‡•ôÒ•bp—6[ÄsõhÜ;†bü½ã]5øQØ–ƒ‚H27ùÅ+¸1œ‘³0ÔŽ±3ºúýÂúS\\3§×Ã¡ªÜÃ™0&ßñŸuA\n#×ëvºSWÔ…ÕÄ¹ÔD:ýÓn[ªm¯ÃN#Ÿ\r*ä¾‚ÚõûêÐ‰°±ƒ<>¤TÑÖIÆŒÆ~¦¤Ü€=ÿ\0\\~B¦Ùž{øÛ_•y)§¶¼j/È²5½‡W‰Áod|bµÂ±ˆê¿üc‡õç[:ÐÒ}³]÷Ÿì`Ýûë>“OˆüIµ?{QÔRÈÍ¿SýÆ~¯å\r{/õí5„²®‘ó‰yD«]ã¡€$wëéZžÑ»\r¤o™ãå¦ù;«$¾H$xXñ>[èZUòØæVqJä-ìŽCÊÒ G#Cb4º–-Êˆ+‚fM‰‘îƒÂû¸î ŠA hÆ‘\0~õ;-0ºßßÊæ\n&,mcÊ j>„™¡U&TfñëDr“ÿ\0*±&ßñxÖEŠÄ’Tct\']Ñðùq½‰Ùî4†– \0zTÙ\nJ³‘$å$ ï ’2ÄÅôé­Ì™ÐðÜ+dš1#d²U”-¢$\nPO?	ÕI:$Ê ë	øD’m\0ûæ‰ÃXn´‚‹Øàf5ãê×	†aÜ)x¤±Ý¼ÒV¥*\Zua ©…ˆ“ h*Ý³²ƒ(¶†ÔÉs*mîð(B²÷‚,³\0˜„ën4r°‘’°&RUáò™<w ·>”S+ _~áºÑÔÌt«öÏCÉ_‰è)iÇ; ¡*Í\n˜H#áG+”3ˆRÚ)q—[F\\ÓáZô$Ú óÐoÆa•FTVËÒwzûüþ´¦8W¸i1¾ºþÏk½X\0„µ†‚\nâe$ÁTXLÉ‹	ãWìE2ãí¡9î‰%9‚P°a\nRAPµ­Æ––6Æ}æ\r_¥“s\n—E¬£ètü)jð‘2#­­îžt×ïzÓþp)×;¼ñá+`\\ÅõÝz-æPê^VR’ÁX} …eVaödG*¬àëÈÍ?ü3.[@\r¦mhæ¤¢o<>£ÐÓÝ§³r!E(JÛ”Žð9$LfÌÜxnH‰Ü8Ð›#‡P«­iPlÎPV ÆôÊe|Dâä€LÞxŽ€__ñV%^^ãõñRÄÄ¡\'>@\\¹Õ^Èˆ±È3úÂ¸¤Ž·Ïz#\\ÑxÊÕ£MØÀÊÔ>âšÙÅb;±ß)úÛÓúO·û™Zï»û\'\rÇQYæU*ë6´ëZÇQñ¬Ó*ñ>g­gëùC^Ëý@½¦\\”$ð¼Ûþ?\nBò|QÊÑ©ß>Ÿ\nqÚrÂú€Fùã…½’ —®™BRâÛñØTÉ#)VR$L€F•\\B\ZÍ$0!$È×q¶º™è-Ï±–d©€?ˆ“r&û©÷jÉRðàÜ}¥+y\'3’E£1ãÒ—5„Z@}n“ÞdD…©JXBR£\0\\“Ë¥3°¬¥jÅ*‰¥ Á7ÁÔ|ê,DE´ÃRt“Çuj{Q³‹¸ìb‡…,©J)*2\ZJ”¤IVà/A=Ù×\n)i\r©e9Ö!gÀB\nîsH GŠbŠ¦¨k‘2\\¼ð8ÓâoÒ›7µß \0ÃŸÌ¨ ¤T3åÌA0LðÒ»ƒÙ\r¸Î%ÀòBXJr¥yUIŸmä\",ÉFÎRÙÁÝ””êRRÌU™\"$+B¬²±\'tÔ9&J«*ûs«P•!\0:—r%9R·B”\09 m5µëËÄ)IJT†Áï;´6•.\neFI0“\0LpŠ)ý“Ý6÷çYÃ8”8„\n–S9Šwò’&-z·±–§;²SÞ†ÃÉÌS—4—>RNY˜47 ±XÁðïžì%¥¤\\÷ˆ*Ðî´\"`ðµ0Ãí“ÞJÐµ>¤•çBU*MÒB-1` ¥@@)ÍR«A	4òøÒ¼æ2‚\03¤‘èxÐæèj8£.Fx}®þlù’JÝ‘0¤B ‘¨ˆçVàqï!]â{ ¡dåjÄÁQ$Àˆ*·\n¸“¨7<M§\\ÖˆŸ_*$«ž“ßê4T	IŒÇ;aÝ^FÛ[Vq	P!pR æ?¢b/LV·Ì¤€¥¼©)Ràƒ\nTÄ$€7ãJØ7å÷oè)’\r¹ðë@œäsÃÁ8öâTABs•eIJ–¬À)DŸ‰°\ZP|¡aj^D§Ä¢llA Ü¨È€8Sœ¯õéè)VÓc*ãvº›\rO Ÿuv­º\n´…*yEJqgÄâÊÕÄˆÖÂÃøjÔß}ç¿ñ¾¬}\0\r	Ýsbo¦·½ôª\'Èi»¥¸ó§¯¨¢];#MÙÔ$~ê¹Í¤ýÕº¬cT~Ð‰ß›ûL|+ÒÒ}òfk~âü?wQÔ|k2Ûy‘ñšÒ9¨ê>5”B·ÛCïáYúï©{+õ~Ä;B‰JL¨ÓMãÏ^:s¥›h4úË¤:V´¤÷jÊYJÂr…$•Ù62ÌõšsŒFt©‰_vêÌ,\\@”“3#Å¢‡áå¬À¦ª¡­F;i„íœr^SE!`!”2T¬ (¤¨È(R¬siËÒ·v“*Ã#ê]–œR¦òps¥y½#ÚmÆ‡R…¬L‰\0Ä ðç©T:N``zr$å<SQ–5T:{´­ºæ0äy-bÂ	‚„ºÚ’SâÊG†L‘cUì¢†T¢Ã˜–Tr„¨ÊÎlè*	Þ’büDâ€\"A¸Ò31§AÆ‡Hˆ‘$Iç[Äïß­%@:(Ô+´m;öÂ¶Ô‘‰K`d*Þ[¨%$¨¤“Ù†µ^k´¦ð¸U‡qkQ!»æ!c,®ÇÀ9_u%ïrŽW\"÷MÀ™òß÷ÑM¸›|&fÑüQËá5V«È¼q®ãŒNÓmC´˜oóe.g…žò\"dZûùSíà1kKNwå°\na!¢çwÝ…g\'6H û?¡Ö¶™dˆ Eãy3¼‹Ú¤m¤‚áÜ­ÂÑx$žs¯CØ*Â‹°)Ê,P €³66¿Kq¢P	ÌI!B\0PANø<èF]Ë0I	 	™\0Î§€<8s¢R²`~”ð6´‚7Z‡+‡HNÀ@‹¼Žšy£˜\\îôçë@€@´\0?Jñ ,óe²Db5Òçîž´	p1è\ZÙãÏïçG2O˜ÝëC³¯\0G§®ú34ãïã@›:L??_uCk\"BWÀîç?…q­Ý=ÿ\0F‹y Ž_.¤…å³³<£¨â=ö 	ó÷Pø†§x#ˆÔÆ·ó˜¢`Ä\r$d	E¾§Î¼¢×‹Ì‹ÌXÏ®œã}iA”’\Zv>~Ð‹\ròGð«ü×Ðëç½•‰Džgx?Â¾‚Mii~—ù2u¿Zü<tÜuA¿8ÓÎß\\«Zõˆž5Œez\\Ø\0}½gë~´9ì®$1mfE½x™›t‡i1•zÚÜ/AM[pÞúûõˆ¯bZI_|DpüiLré‘©’=HÍ(Ü”`™\0\r½j¤É‘b,’w˜3søò«Ýd$\0m¬à»|ý^¨R  E¸™Ôún§Ó±	&AJ‹EÌª _Ù#ÖÝ|ê¥¦LÍÊ¡¹5ë\"â™ é“}úð·/:¤,(ƒ\Z$Æñ{<¯Èßu0rD‚H‘™^Ï`\\Üi êMZÚ¤øD4‚.\rˆS®ïJ‹h2T<#’dLƒ¡#téåp9Hã\0ÆínH´ÜñUl•Ö¤R\0ÊsHæ	;;ºï¢q•Å¯7MÍ‡ën¡Ô$¨^\"`fD\rû‰µ‰ž…$‹‰\0\0Dï k0uÝÎåÜ<x¢Ö é9}™_€xÁÍ1\ZUfs\'Hù¤ÌNóqð¡©¶c‘\0@ÀFþ7ƒf»þŒÚMàAž>¡H4`æÔ\"óhç{uÚEÆ±¸ÞÝxþc;â\0xx›uÉUúÇ¡Ó—\ZHn±“\rŸBu6ûíóÖŽaËZö×ãþ(\\8zÚÞsñô£\0á~\ZFît	l-­Ä}~6£Æ„\ràý\Z^Ð‹tÓáð£Ú?\Z™žx¨®†dòãçCf‚M‰\0XõŽÿ\0äÝ¤œªV·Ð[¡ë¯ÔR÷]#tÈ#Yæ\'­ëO´RRØkÙ“ÿ\0R‰×07ØŸþUôh¯—vmÕ}¥©¸Î4‹É11{x«êZzuI™\Z§rGÍß7óšÃ¶³å§¨ÝÒ·x¦÷×Ï™sÃ}À\nCV¾d?ì¾$\Z•^,~[$sþ-­.esÓëñ÷UáÍO»‡\r7›RM\ZÄ1ìBµ;âó{À›E vÊ6‘›Äþ_5©IŽgðÖyéKöŽp	‰DXeÖÜQpä­˜¾l{Zé6Ž¾46àx›ƒP(foh‹~Œoóã&®\n!2| FëoÂÙª$\0W¼	Ê@u0/©Úb6¢I7H¿/@5Ÿ¼ëD2LA\'RDÎaq1\0ˆŸxýÚò@ö¸È½ÀN¼=F•4^ÚØëÂææt’&ús®lèªlì\ZW+\n	ÊAQ2eD*ÚjN^uyØŠ$…)Z‘*œ¤ÂÔ“;H×@U»ZWÞD$“¨- ± Þb,8ò«ˆð•“ui 3p\0\'w˜ªðY¦øc4ì5ÅÔ¼J¶R  BE½ž¶\Zî½8bÒ‚UH\"4¸÷gÏ¥(Ì\0uï3<LÄFú5‡¦$EÄó\'ÎAçCÉMÅq{°ÖLÌ‘¯1mfyQÍæÇ­¬Fºùy\Z©¤ï°ßÏžŸ…I	°±°‡\0†—±‘“qs¤ßÈnø\Z)7IW˜‰·1@$ÀßøDÚŽA\0F—ëçõÆ….\n´Ï§;Æërµ\ZÒèÆ·\"Çw=ü4õ£\ZÂâ… 2íÓƒ¸ó¸¸ã“­`e­Ã§º	#Ó;Ûé0˜ý+rÐÏÆ³ø©UÁ‚	Ðrîéë­iiiÅX¶K­‚û6¿Ïµ}\\G¸Þ|Ô}ü«ëòÏîY\0HƒÆ¯¯V®$eævÏŸâdƒÒ°_‘ÞOèÿ\0È¾êß85 žN´¸c7l¾ŸS,7ÒeÀln}Ÿ¯ñW£åÆC§õ¥<RDÔZ=iw£‡v5ñ,­Q¬qÒÚtBðdˆðž\"ÿ\0)ÿ\04Kcâ¯ÒD*•¢ÇêUûC5ùœ_g³(Ê èt‘TÉbJ±	 f$ð½¹­“cÃõÊŒF‚‹<WpRÖä}Œ!ì^&ÑÝ ‹ð¡Ð=æ¼ßañ—ñ7© ç3yŸÑé¾¾ˆŠ½5%=î~‡Ïÿ\0ôV+yhê}£3r7~±7ª‡a±d\0r\'¼7ÔðÐ¶å_Iù|êÑ\\´ñ\'ß2z7c±8È…Ïïßîñ$ùš/ØÌX#ý°\0Úž§K™ãÀs­øÒ®¨zX?6^:ü‹Š1¸~ÌbºQ¤YCŒõãVÍbsL\'ú‡×Ð­ ûÍH\Z§Ãñ÷a>\'›ÐÇ·Ù¼FðñâOÝ”B;8ýýß¤\0Ý?\nÕƒW\"»Ü1÷e~!—ÐÊ§a?»\'*3<¬mEµ±^|#¢Ê´\rh+µÃêUëò¾Æchvyç\0RÉ&:Z”Ãb¯7nK27Î•½š’hØô¸ñª@¥ªœ¹1Û\'±KiÖÜSéðr¥$Ô“\0ÖÒj\rÔÅ1¨ðRo“ÿÙ',3,3),
(3,1,'El principito','Novela','ÿØÿà\0JFIF\0\0H\0H\0\0ÿÛ\0C\0\n\n\n		\n\Z%\Z# , #&\')*)-0-(0%()(ÿÛ\0C\n\n\n\n(\Z\Z((((((((((((((((((((((((((((((((((((((((((((((((((ÿÂ\0Q\0ì\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÚ\0\0\0\0á=,t(¤m˜âæŠeÆêLù^¾¼IX¿¤¤ÛÒRmé)ëxJÅâH‹À•‹øJzÞ’°cÓ¡Z^,¡£\r­™v6xöSrÏÔWÐã½ÙBÙÈû®äÞW×#\0F’KvŸÅÙ“Ç”õàJúÞ’‘xS²âÛüMÌãîbõxG$Nüt‚DG3ÔòµžÌ¼—ÑinG›êy›–{/¸!½MF:v,Øo1Œíg1í,ƒ2c	ÅbÒEL/#×‚­zó}tõäÍBâéTÙ=F¯§QmÊlµ5ñ»F¶¬-QÁ¢AT¾fsÙ¥’]•\'å{dTñqiÑXàž¿o¤v¿Œ£€6ÙÂŠ\\v¤ÞƒÖ@É. ÈÉÄH{Ïf=_MkÍäš°§³O–f‹(¡=j\n	é’úúG$™$’%™ôñ(V€/OÏôž öd)ÅÙ†Ž¢žÛˆ…\rG4‚Dƒ‚À!ñ<|IRõï7P;Ä\n×G‰¨‚¡h\r\Z7½Ìisõõ|¾¯3M®ç¸Ÿ7(L\nÆ§‰éô+Õš¿‰àtíiz\"oé+âxÁk µ0[?7‹\n;øý3ª·+¿—eohsÛ½Z\0ÐPÚÄ$w9¤-@Ì«B#JÆóT9/àC•e¡ÈRŸ·:]Ì,]n·ªãôóólôÔö¼uÚ9ÜÚ;H=)˜Æ.3˜¨à¦Áy{¹4ºL}Ùô¼y»*Õ`ke$m‡–ÊË †uŽÍž;¾|ÍZy\'yþÁÏ^«„¹~†|Ž‚‘€¶à\Z¼ƒ;VrÉÛe©n^ÌU¨ãéZ•i}îoJ›·¸]ÌÀÍ²¼~[éÔnGk\0üûj›\\µZKöOƒhtrý‡‘æÛ· :Ž\0·±/k1J‹dÒû@ßžÞíLþÿ\03Ú‚ÝwPS¬ÕX°Ê5~B‡|KÏz\rŒ­³G!Ã\\3PÞÂÑš²PÝŸB×^Ž¦¦ÿ\0¥Jt*öúë™AÀŠ«×x^åZBý~>³Ùº9ô°ÈWÏn`á1éž“5s·Ö#Û]_šÅîRés¹ogJ^y]>)nË;Bgw\\ŽÛ§v»+v¸ªÂVTÜLˆ§z\\õ`T®ŽcéqºÐ2%åý>³,\nÏfŠDHK<Ü0–­ìÏ…¦¢i¯|1¡`ê\\_ÀÒyòç[7vHÃbK¡cv\n”¹]#Ï÷t•^¼?FÚµ¹d|cYc!Ñ\'é]¬ÚÓæ¶›ò54ÐÐæ®ÓÐ3S;Ðyòæ/±‚|¸Ùõˆ¿µÕ¨þ¹ë>&ö™ô•½	ÈîRž!4b°ŒøT\"xºÍFr´ë§OÓZñŒÌ]—1ŸK`jàz=$wp­[æYÐ½+LÊú¤cƒØ½Ç1èæ±PóX‚|aœú¼ÛÇ¬u­²/+—Bá! ‹°+—\ZTËô¼ÍYç©ÑÏªžxAÆ%CtØßÀú\"ï›icª!„_ê¢¤\ZYáNžq’¢Ú’¨È©`¬0–‹ç!GªÊ3ÎYÊsÜpWXËPÖð½]ÒÕ»*X›IõT¾‰XWÈ÷dV*^ _Z±%€Dfï^|é9,‚Ög1ªNzÜâæ²[ô<ógëƒ¡—\'Î„‘6ÃµWŒï‡ÕÐžKÒ¦zäôÜ‡{>S³³®yüßY£\rŠY©®h/ƒj”üÇ-ÑÏÒòwzþ¦zþÝò7±Ãg–·½9øpfëf3—GÕg’æxý,°×ÐrË\"¸\"Þhß•$1—4Y¿<÷«:¹â‹‘›%ëQ³fùWRr!õe£%Ã—}œà&m½ê®*þô1>ñ·¼$ûÞ3×÷ˆ›ûÒG½é\"=è+ïxO½«ïK{ÁI>õ–UÏxÿÄ\00\0\0\0\0\0\0!1 \"A#03B$245@DÿÚ\0\0ì+&5l½˜’ò®ì‚SW)bKWƒåT-<$Mk·JþQvˆhJº‡õ&ÄØŸ·ÝZ=üª×SÆ	Í£€›ÙM\0¶O>‡»-ú\\\nèêNöÙÕ®K,ÄÅÎÆíUv\\ùY8Ê »ÛuWtk/«/ò¶Ïð¬•²ÚÞ›~ã1 €N¥b3v$žý\rš-wºÏÒj>§ªY_S¦Cˆ©U¯êÊ:M]#>ôÈ·ºqÇêšN ót¬]äuB÷un¬†þ«ªhÍÌ­vM¸ëƒö)*MÖ‘÷c~_¦fM˜YÝ…UýG4ÕÙ†Æ×ªô»)2sò[3)«²ü‹ò\ZËïµØ³¶Fe÷L¡nÓcU‰‰PÉ¿§gòúVZâ_ÒíÇˆ­kâm\\RO‚·K˜9-…—Ö0×+ì×mJ/|qAo é¸¡s+¡í—ÓgQlÕ©2þýMN~]wõ>­e7\\Ïs®r[NVB=P‰Pú¯Ócã^µ8ÍwéØƒ&ÌÌ–ÈÌn¡—®°÷Ýo+0ÒÐ¦ñüŽŸpÆÏê; dáôsã­Ûu^;u5=¨8B°‰©Æjjyîâ\Z›;«·:ç¨¯òÜ¦ëéÙmÓSS]µ\0Š²´w²ÜW®5N³A”³SRÛï¹u÷jkìÔÔÔÔâ8Å‰ãU)Bú33Ì­WÂ÷ëg·ÄÔÔ×mMMMM}•‰ýÕcÚö}.B¢d:QU^4°C÷þð	¨&¦¦ šš‚kì®-š8¥ÞéKA°Fï¯¿]µ55ÛSS_jÇ±j˜.^2ÜÔWÔ*ŒMË`Û]µ5555ßS]µü€²Æ+-ùéû\\|œ³]uW¹o°GõÛ÷Ôã8Â³S_É\"ÀF\"´å°ÈÌ?NÙþ®Ûçê^&°¤Ç~uØ=ë°qŒ°ŽÚƒ¾¦¦¦¡SRÆW~C[1Tå[Õ(Zñ:fOÓXÖó|L«*oÛùÚ°ˆÀ³Œá¹esŒÔÔÔÔ×mN3SŒã2k/wEu\\[nËëGXX4[m¸¸Élµ«:1[²mÄ+8ÅX¥X•Æ@%ÿ\0\ró®Úší©©¨ÚPùH¶ÔVÅÉ1±ë¦~¡Ëôê1©gØ¹iÓ*­0,Öpœ`Y©RnXxKXñ°ÍMMMCòlàÝ€™ìFCƒbâ9L­E‰:Õœú…Uœ›×1¹&ˆýÖë\nB¤ã8z\rÄ(6Ù’ÚByøŠÜ—°\'»ªÁ$Ð ©VïIFéXm[[“ZKròØ¾FMIMŒs™yÑ„åèêx‚jjºÊ3…gÆ\\x¨Ù§{•.­U›ŒÜäÒ”à(ÉÌ®§É1ªðÔ2ÙiZöÙ­Î3*ï-‡ý©Õó–®›×,Å™½~Û’»HŽW]\',ÛU–W\\»¨c óeZpÙ²)U-hFç8ÍöS` é²$ür-•»ÌÜ³jÙaÿ\0büMêbdx»\rììÊ©J«0ÏBlMaDÖ…¶ý{Ët¡ò+RZÛbã¼òÅ,ÿ\0ç_ƒYÖõ>F.GŽ0G<ã1»\rÎ~ÃÅ1}Áu+>¢ÑëµË¸¸Ë<GŒÄ\ZMÈË>+RçŒ5F£Þˆ˜¶nŠ€±cÎSQe`Ä€L›Åš¼jFâ	NJ‰»ZÐÚs]QiôörÇ¯Ç+EphSYO±Ž&\rŸOföÆÜaõ`C+Øƒæ³¹w¬•Z•AÔ/Æ9?…x²	ÃFµØj_À«r‚:ƒ\r<b,éö	ˆŽD±£´²Š\' @(âWùËþçÄç\ZÈ¯ýrì¨­+@H! „ñOé^ÑÌs½rÜ\r¹S»ÑYnÖŸ R_×9Ê3FöFåÃ¯&æ;£¨hõñoîåÚ©•ÿ\0^Æ;Ë,…ç18‰XÔSÊÿ\0¸°1€0¤U•$³å„\"TÅevmv¦?Á«ÙÚ\ZÛÝfx”¿,{#ÃÛs‘‰dVå2¿£5¡¸>w¨­éŽ¡}“*Ö©‹‰ùRp\0¤Þ¨£þ%–Bw7Û€ÎBS`™>è=È‰Øú¥‡ð\'Þå4ü/Èv±`øÌ><\r2×¢g	Æ6—E}Àñòçºæ»z„ŽúŸØ`âUî)ö£ò‚0€{êºm*b 1‘D²ÅsÍÅh-ˆÜ—i1vgµâ‚¥Ñ­b¬ÛS±=Be­åê]ïêC–cdny{#hÑüK_)mç1ì”÷ø;Xß50yïcÔÒèh@Dk¾CŠ«Åb´ZCœ½¦-í„ÜéÏŒ™8ÿ\0JåÌ}Ùfµ‘®Æ	±\0s–Ìä åúŸÚ§gSàuWÿ\0GaÕlÑ½Â;j~ÐFµÚ±:g#–PVjj©¨?8V|Aî\" š:Žh yµ¹áh`‚jl÷î=/\rüÆ¾1­­YÌ|Â&¡µž1·øp$/(Šaõ:Žjb«;3>-¿R:/P&î™“Q|[j«*“o9ä›ì:à¹V¾,ËÉ²óñ1ïjåÈ¯]‚ûõ­zÖÇM\r?)ÕcÆ;•þcŸª?ì1Çú¦6Äw—´ÓÓØDáBg[Í÷6\'í’(±³ñÖQ•NDÑ‹¹ì\0Úœ‰ŽÉX¿¬R³\'*ü®ÌcFÌTêæ3;/9Í˜ébÛs	®Ø˜ÞC…MuWqEWy-wƒ°>»|¨º.vJÁÕrÄÿ\0ÌÓæd¼ù0MÄp^7UÁH¹v,UÈò”iÜ:vªÂ²¬ãà²÷°ïîÜÜææç)¹¹Êr›€ûì-PÔñfùNP~R$??øÏÛ²|ÿÄ\0+\0\0\0\0\0\0\0\0!1\"A 02Qa#RqÿÚ\0?É=ˆù©Y¹_Û†—,Öä‡ÇÎ·.W¦(Å\r°Kí\"9Ôâjä¥•µÕ‹ÀÄx,²þ…6¸²Ë,Nø/hÚò&H²Ë¤pÇÖË¨Ý%–X®NñM{YfòË,²Ë,±³GJ-û›âÕ2RNNºÙeýlÓÁÇÖ—£¹(Ö4I(ÒE–_Ù\\˜3‹oèÔjVÔOö„þÅB+rÜdÒàxÛÇÁ£K}L†jïÏ±š‡ B0éïò2àp6Š6lLƒŠ”¹³Y¦ùy¤½Å9K†Az‡)AÒ\ZµglØ`Ó7É—$pª÷2ÍävÈÕòB“&Y¦×<pØ¢COórîftdÓaÂª\näÌúnÎÔ‰cÝÁÙxrlÊJ<3	KØÞ¡\ZDçê²W\'b™f,RË-¨Óé£†5uÙlæ¹59{Ê¡–;ro¦|Çöj=8›Ù¸Ü…6ˆNü‰·Â4x8ò9QáðJ¤O«’e‘‰¯6ÿ\0©—¥‰Ál²·NçÂå¾ð…¡\\‘‹2BÑàÍª|”ÑÜ¯&²[2´‡;,ŒZ2BâÀœ\'1*éÀ¥ê*ÌØÚvˆ7‰£F½SLWÓiÏƒà*±Í}(£e>™âR´k×â…ŽÛCð‰mÈáû(]D‰Í41ŠÍ[Ý’¦ÑrcÁù¥(dM\nV…Òq±”LnÄ¸lÝ¹ØŸDºcƒrLY\"•Yp)CÉÏ‘’e¯,Í¨–OL|+¥ôÇ‡&WQFu0KÜ”­šMKÇ-­ðw Ý&JEŽFLñ‰“,§äð9\'ÒÈ4Ÿ\'Í(+D®RÜÊ(GrkÜîÏö97ç«Fº?iôC?ÿÄ\0)\0\0\0\0\0\0\0\0!1\"A Q#02RaÿÚ\0?„71¥éŽõ»¡†Ïe|ˆÞÓsý{»e1¾2Œ¥ïðk‚Æâù4©øù= ²Û,N2ÉZoäYÃMúÜø_HPyË6¿³?±4û8Eò×lv”\\~Q•‹’;¸‰(å`©ñ‡Û	GsÂ1$ù#,?ÅÇ+Ë=dÇlY\n–é²\Zí<ýK¶²xD±ù¾ÝV6_j‚ÿ\0(z[išœ%JQ­){þÝKÝ•\'ëÑ¥UçtÙ\\å,î_Õ“\"äÖÐ¦ùôÍ’Ç/Ñ%·»f{dÉ“q¸”¸à¯Wgùdù¨®§ýå?B‘‘ÈÔëÕm(²GÉ¸ß“$¬de¸Ø£è›ÅiŒ-Iµè’Û,\nfó]Ô#WÄÓie¨žùz*‚®8DÓK‚Yk’¾Öâ?&ËzãZ(¾íLþRÄW³Ë½¶B×”[/5~JþˆØ¤²‹õ0­rÉÕe÷rŠ´éÃk!ˆ-¨q%×[\Z£¹—_+åÉ\Z[\\ŠUÁm‰D·r\"«\\^`ÍU>O~þÑL7ÛÅZ0`h™<.Y¬Ôùgÿ\0‚–d™¹²­CQÚNø×#!©ý‘º\nÕ1	y:£ÛV?dŽEÈ¥¼‹žØfŠ^J“dbm$6u©fQ‰°K‘»‘r!ö‰Ó^SBF;N\'X_É>ÌÚm$°e£\"ŽŒ³½þ=nâV/¯Á±Ø‘»#„‘ÒiÛ§ÞþÍØ7›Î¡¯ÔQ8Æˆç%».¢J~°IsÞk=’0WùICömUÅEížÚ«”*’lÛ9¼¡æ/LlÜ#T›ÛÉ¤ÑÂ…º|ÈódáŒ‹-ÔWBÌ™EsÖj“ôT£µSB®‡’äx-ŒwJ/H²×}a\Z}$4ëd¹+­§–}dqm|HôùÙksbj1Û\"˜ÚcÓÓ.Qÿ\0Oÿ\0DBºáþQ¸rÏe.Ù }ÿ\0wÿÄ\0>\0\n\0\0\0\0\0!1 \"AQa02q#±3@BRb‘¡ÑSr‚’Áá4ðCƒÂÿÚ\0\0?×$[SHuù«ÜHÜ·ŒåN295AWÏ\\Ä¨MÇ\0eÃyGcœðþåE¼<šç8òj¿„0ÝpŸqAÖÔ{£w-^™Ì—H?å7Õ7þP¥òwÉÔéQ§¦è4fÒØ)õþNV]ôø×‚‹÷tz/cz¦±‚\\ã\0\'R©MÛF‰#;\';E¦ÚÀlî‹«ÞïÔ¬\r\Zn˜n7Æ/Dêu…íÌx\n—üPc9g®÷×¤ü¡TNÄCtê•N\'ºä­%ßh4¥6›¯¢eø›Í£k2M•&Ô0Âà	M¡¡0Ö%Î8è›N®:ú3ÎqBÓž8XÝ=fV™ì©²«´svæåµ6$ìÙÐð’šêíspÕcDÚó‚­´<[L#°Zaoþ0=ùÍ\Z1V­n½º*”´^6c†BnŠÝ’ÓíìçvZ`¯9ßÒZÜÙROé¨V¥èGP´m/`gIáÚ7+õUt‹tzM8]»]3Rõ´g}Kyþ‹Òihÿ\0\'´ðìÈ»{\'Õ$ážžAÓqkÆD&º­BK|¼¡5Õ+Ts™å$ä‹œIq3(c-C¬ØÄGTkŠì¡QÞvT>Ê¦’Á´ù¾N\"1¼ÿ\0„ñI¨UPhµ©Wä×qG§ˆæÖ£Õ^±ÐöÚ1¸soS¦Òç›B©òVŸÁŠôÝ÷\\ªbÍÁ§ô[L0úup“Ô©•›–NB¥ô¸™À\r{æcÄ‚ŽÑÅµ+°¸6“n)M\n†•£Ô²ç=Ö,ŽEVÒ›Ll)œ|VNJ†‘V‹hh˜xC¹Ý•Vèÿ\0FÓóá2Ž‰V1˜ÂnÃFÃ¶}L<Ñ}W<ó)´þQ¢kaòÔi‡Ú\Z5-•\0q\\ÉqÖì^mÜ>Uáš=+Ô(Öd³\r©Å°…«¼Úö‚\n¥ PÌ\rÖïè¨ü Ãô¸—Ÿ²Þ¥W¦ièZEf;ÍïßÂ£UþPnªT ÃZ•C‰¥—N«§»bÁÊn°‡\0ÒbJs15Ðs\ZÈÁÌO†Ú{WšCìM–—Z•v¹úC8>z/œÕ£[G­N]T!Me84ÄüÏ…k=ƒ +ÛT{ýO€ÖÓh Ú{§Ô™kHû\\¬Ÿ‹ìær\n[½#5†­joB~¡3~šì.l exï–¦HsÙ9¤\0|Ö3àÀ¹ú‹F<>«Øi;ìÇ/úP8Úçf[×¥Ó\r{\\µqgàÛÃ¾÷•ØAâw ¡¯2ÌLÃðºÇÅq6V¨çC¦z¢€?Z2è&ñÕ\ZÍq¤2Ë/rÃµ‚gÞPibÂÜ!³ˆ;?¬†7<ý­¬ƒ„¬L<‹f,¤¨>Cú}cDž©Ñå<û­ ñ³û4„#³¾$vWXI—2ßV/#$8DR›@s7ôæ©Šm\rk]’®Ü±ar­YÙ½Éá¸Apè³ÎèVpÂØ°ëõg†ç\nhÕ?uÂ\Z~Î£.OÝ^¯j«³f;4ÈS¬ýœØZnN ÃQ¥ês\rŸC¨ø€ËÂ’°Åº©a‘ªÕ?0œi¶ÿ\01ê´z~®ÿ\0\n½O¼øü‚«†Å®ÆÓê©í†£~Øø*[&\"OsàÊ¶ì\0Iè\rª×Ó\',bÇß¹…Ö—	¿5LL;•\"û6µ‘Ôÿ\0Ò©	âii¼Ý|á£Ê!þ‹+”h;1vø—TîŠžg4öT×rPó%¤²zÁ×Áï²ŒÚv[Z‚: KÏF¯e²¢;ñŽ¦™UÝ„	T¥Ä»i.wâXjÁ‘\0û¸KLöF­ìz}Ïôk¡Âò˜*Òs\Zã‡Èvk¬êâi\"&Í”÷Ó>ÎHkF^ºÆa çœLcq—Í{Lº¢Ým*í¥5™Æg®áÙÑc³¡{g‡¾«®–­ž×OÙµÄffê(Oº‡Ý¿Aú7‹þé´«}+G›“ÇUíÆú”vnÚ»£uç§M¿…“ñM{¼ÒAŽÅOˆ\\ã\r’¥“OFë“ª~ÁZ\0ŒÂ™¶t¼œÝ×r{ëì°?Èrì®æ=S‡Ã$r”Ö0C[aâI°XüFžÿ\0õôWRL.%dc¦Aq8Õs>«¦§ÅªÅq\rXääzj¥9ãïþ-ïš0Å&ñWwÿ\0+(è:j‡.»„³²¸ ,!a`’£W\r—X”åÙ:§6Œ zîç¿n*§ÈÁ™X\\q:qÔwWk¾ ¤•Ì¨6÷)\rPDwBÉB¶©‹¬|¹÷R2ð/®¨ûØgòQ’µÕì³WV]Öz¯ªû—Õdi;6eé»ž«îcûî.÷rE£šâ\r×%Í	CUÕ•\'rwíá<ŽA·&ˆßƒ¹_QºçŒØÿ\0-Ü·]îøø¹*uXjº¾ª­ìññTV‡‚}GÇÁë	YB¾º‡ù•ä\'o[XðëŒ)­è#À²#¨ñ-®wYKø¯\rVð½7ì®³×mD²¾{Ÿ†ƒgÞ|6bHÑaËíO«ó²÷NþZ¯}V:¤Ç8ä¢÷:¼n×H‘Ñ²¶ í/hZ2\rê…Zµb•a\0ó)ÁÆÁ“¢%5ŒÍÆÚ27¬w,¹#‹¢á\\ýã]oHMoA½–¶1Î–³Ê:j¦GÙ—þA±Ÿ]ù]ÕÕµe¸\ZÑŠ£²?I~(¸`ò„Uü)ïÄ„zõW˜ÏHì\nZàæöÞ·æ£šƒ«¢ÍwQæªrjsêyÌªz=>:Ïhtz‰_Bõ…†®É§½P‹ÎÁž‡,32Ðà{ùNÙ¾ž8ºí’\nöÅðÕ,ü–&Øó\Z»ïð‰W #OCã7òº.yÄçfãšŒ‡UJÙ4ÜaÏS?—ü­3ú>*ƒ²q¢ÉoKnÃ[*jG¢¼\0ç4qyšó—z\r\'B¬VM ¨À}Ë\'j³ï²Å¤=£ÔÀQA¦«ºäµÜn[”tªpø¦Ñ‡+Ä+Òwô¸~É¯©ó†¼6>ÉUiÑÛTÃçˆ²n!¬kgÐn]Ð¸4I(™·-ù+éjrµcï¼Ôÿ\0±}#£ÿ\0u”›žû‡„ž d&û7Yø³M.a0\0ÿ\0kèÌI´uTê`$BÃ€ÏU\\Gê 1Àúv×dá+‰ÄýU–å¹£:Kg§ûG†Í†áNôúïÿÄ\0\'\0\0\0\0\0\0\0!1AQaq‘¡±Á ÑðáñÿÚ\0\0?!z‡pA,yJ­ÜÌE+±ÑxTÜ®µ+ø×Zþ,WSµuÒ§Ö‹jò´À6ÖrGÈŠÇÏcŒJ•;_\Z•*T©S9ëR¥JÄ¯ã«1Þ$³/Q²“=6*¾3ÚæZP°@½x_.#$-={½ÿ\0Bb[uÑ\r¤.Ù.éæåJ•*T¨KÂµˆŠ\nL#+­JœC\ZÄ©X®ìÕ+Úk õ$Ï®û=èuR‚9ó-»nÊoU*|ì%,c‚an{îß?/ñî$\r­\'—¢áÌÓaxƒ\'Cly®çÔ„O©€ÚÂâ¡;±ÄßJåplƒÿ\0I\'ýŠ8Hö£ŽE\'VT®•hAGçOh’‹ó„6vår¥fb8•ÒŒ»7ûÜ>XÕb=:1á[üt%¤Écïÿ\0f;ÙŠuþñ,Óéq‚\\™q¹–ª\0öÌXêX‹bî‚Ðå4W¢ÆfÅŽ3áqyVçbx%ð\"ÆY‡œGâ°†ˆê~Í°Õ…WÖFéià–ŸÜKðwÎ\")Â‚ƒtÊÄ©R±rÂ;„ 5øÇJ•*TLEÅiøµœV­ëµ«µv0oýPëû\'˜‰„ƒÙ¦Omó÷?õp«.å$Û†Õ’g\'t«;•Ï˜ó’ò/Ä¸¹\rÊ÷–ñ$Ii4Û2ÎZçr²vŒï%ç73JŠ˜ÆßrgPÕ^óÿ\0–2¥Oˆ*T©S\n{yÿ\0wŒÔò<ÿ\0qŒ\r	˜8¼<æ|¿¾ò°Zïƒ÷!L¤æô%Ìtÿ\0p+(»Bö}ïæj\'ÖT®ýÐ!è1RÖH\0øYkùc¤Mƒ>|žáù$—àŽð\rLJÂW»ö‰uäÜÏk¹R¥tçR¥t7‰«ò­Q•¼ïn@Mï–•Æv¾f^><Š²¥Ä¡æËx3øjðgßAé-R¢wƒª9®ÄpÆ–,:¨ö%+Ø‘Y–E6,¥é€ý ÏÈŒ«”ýx™´ŒVnœ!*T©Y•*Uå•8«Ï°•qB•£lÆ¦\0=—P=L±•{„Pj¶ÆmÐUÞ£Ù¡Öxú/(Æq¸ÚgŽ]©n¬:C.˜Ô¢qÅ›‹Ú%b:/}h;J•T©R¥jeb|Uô‹\rn³‡Ä)èös©·50 q£ô¦WÎ…­æ`ãk$Ë`-s.¦W*Uq*R¦)€dN!Á,ÛNŠ•*T‚*T¯à4ÜÉG,S2­—ÎçÄwcpPvb–BÇžóPX/ÌWáQSÎ¥pzs*$©Pd\n`™•*ÐêOâ	+2³2f5GIÚDnûã\\ÁéÙ»4küìMÁÙÕ‡ê«y›å¥ØÑ}¹ûG§mÞ´ûõÌà‚T©R¢qR¡‹X­x‰ÞZqòÍ¦-ÐûêR]@^É.$IÌÚ[jBJiÎ]”}e›øszï{^VßÆXu%µ<P\ZûÊ•ÑQ\"Jœç3×EtztT:„Œ`fÃ»eX¬L£å­L/\'´8äB<‹G8+¸Jî@ÂÎäÝD•ÜŒTÓ¥–X	VÂ N¥T©ÇDí*]EW\'s@Ýím}ËdÉä=ÒcÝHŠ24^ëëd\ZcìJnÊöo?ÜïÌ®ŠPtž£ÑYÄ¥g2§1:é+´¾\"ÏØîË [²˜¶(oW¢˜ÆüwDgæ6þ¾¥V„‹V+aLbn\"í8b˜Fžàt<}6ä¢y¥M Ìž†š„º$¦f·÷˜#c½r»À 0\Z¦ãÛ\nÝUPm¶ù˜YEäã³ó)räxÓ\ZÂð˜mú›&^•5ô³™é\"Ž³-á„T2è¯A0­]Ûº}eÝ³w±¨Yöë‚Xí3AÊ4¢È\Zo¼Â8Ÿ}Ï©G5Égú½L\rÆ,>:@Å\r2Ég®’<Â®elŽ„›FÒ¡ÝÓ·h„Ô­mj|»NÖ‡Ga““¿÷!È¥óý‡å”R¯Ã?k2Ÿ#òÄ})L§åó(\0¹2ò+ÌÙû–±ÊgÒ„Ü…ˆD*a›‹¾€t1o“é€²µ€¸J•ÐXø2u\\|B8—TùþãæÀ­ÿ\0}aX:,z`rf¾ ŠÜîîÊå+ÏÃöYb¨Øñ\rögÕÉ.þ\Z‘oÕÃJ®ìe¥º1Ä\Z3\0’É^ƒA]@´¡d	‹’ùéP}—pt„\0C+*ˆ}éCÉ\Z¾ñT;S÷©Zò¶þ¸‰Ñ£Á¨ÉG­|—†¿ä\' ©\nñÁQÈZ¬Ë=ÿ\0øõ­y‹Ë¼L¤vWóÔ™ÞRdü 	žÄLÅ_\Z†øß!Ð{»ö—¶ˆÎFVd\räÐ¯ú‹b‡D³æ.\0ÒyD^ñÉÊýeÝa =uIã#€oÃ¿¹êb‹¥VV^½¯ÛÏ¿Ô €ÅC8B¶?]°&;\\\Z¯¦%§:ÇæmNç?ñ2Á M×ÔTMAð~ä\nÄñ“ÄCûô]žX_é\0ˆh¨YôŒwKLAYŽNšÅ–A™KÕQ,¶Š(íO°èÁ¨)]ì²3!W‰b“ÿ\0ñ((•vs4ƒ/DÊ\nZ7G¥k³Ðÿ\0¯Ç¨\nêù…QÎ5i5¸*³Ì¥£´‘P{KÜôÀ!ã]6¡ã¬£(«Äjó2å	—›ãDI0ó{¶n_…  ™Az1qNÐÔº÷?nïñ2ü<F›ÎüÄ¨ó>/‰­½0¶á}0ü½£ì‹DLÀ°w§<K´Âa5¸ùJÅJÐoDÖ/bFjõ69–ñs\rTÇXáyóŸ ÄÕÅ—Ü¶¸=¥y/öŽÈjOÊGÒQì6_Ä0F|.ñË3y[ua33J8«Ê_ëÌ©ù‰_ïÄ·	Ö¦,d®kwÌ0ˆNÝa¯´n»¸‹l¥!P}à[Ê‚1¶®S‘*WqiqÙQ¶‹ýa®í>VÁqÿ\0r6{Hh<£ul}¾ðT\06>Rômæ9’ÎÃ´5™ÄDVœË1k®Xp€j¼Ï.Mc;¤žzú§Å”øLÉ—êëöt	LIÜGÄLŒÄá°`TX½üh¯²¢ïc}¥®#ÍîbAWpî±\nó2÷QË»?PY¿ö¨|ÍÑx!ª=ª/,~b…ÅdÔÎou×Éq÷Ž%GžUË¥mc-Ì)wq3\\{Ij(\\º2g=\\¹q™k1YMNV4&ðé\nêç†a}ˆ€åvví6aš¹¨:™j!íê\r(ã¦2é³ö‚0*%yœNQöL\'oq/Ä\'rœÞb`¸5¥Ìé–W’RÍ‘<ä}å\Z7Ò#íÚ{*ÍrŸ²S9ˆ¹Ê¸—3r@ ëó\0nÙ6Žîc„n“|“8ÝÁ¾IiÊLuÅÌNñå.cæj\\Æ;R¬ùšŒËO\0§ù3ÿ\0ç;Œ½Ì·™pmL¸aÐ\nSà¸3¹Xˆjyj\0Ãá(ŠÀ;¦z—Ë´@/pÒìæfó<å^å-ÇIÚOýqTÃÎ?²+íf±)¹i÷-áß™]ŒªÊ_€‚`Ç§µÏ‰Eï©´]¨È,\rçÒæs;\\YoÏO&\ngï)î„vÖõvýˆ»‡ÌB†PºÁçÃ-Lå)˜ Rg‰{œª„z~½É«ä<ÌR³†]ÏÚSÂ¼LÕ-()j]Äáiˆ_©¤8ƒE¥}¿´a„q.rœú6åš3JàLk“R¿Ó‚”÷3Ã[»{—QáE4Lšg!˜\"¹õÅ~b5 ƒ—Ò]C°õSþ1,yÛæú¶}¦ÛÒø„Ê×¯GÁÌX¯Ü7RÛ~!,(¸;M»W$83†ÇË:ƒ¿`‡!Ä¼0Ü£Ô\nÓ; Á¾ƒpÜ¸®Øã!y…¡ˆr¿Y‚ŸAAm¥gýƒÅoÍ@Ê†f\\Œ·³÷™ÅˆhÄ¦Ò­d…ô_VX¹™1–\r<†Ù¤#óÛÈ÷¬TGÂ=‘.b–ÀÌ0¥ÂgÁ,ó¿h1-­ß¹®sî \'q\"kåñ„zTýÀZg¦ÿ\0”0«mr^âÜ”jWR\0Ad‹RU=~`Ž\n¯þËÃï\'âlªÄ+G¢ô9ÙXp`=´Äáþñ˜]öJËîo/bo©ÿ\0Dâ$…úŸ^û%aeú±‡tÅë\0á†af!Hx ËýÄ\\:yN­ÄŒ–Í÷ÌÎÊh ‰VHÛÚÓ*\r7´KÄ-4Ê[}eõ+FáuJ¬ÑÞ;´wpK¥‡ÍlÁqýÈ™\n´eY³PÚÃNÖ?-ôÊÎø»VwùÆSð(?&bm™ê´óÚWTºîeÃ\rÑÇˆç\nUð›ÃÄ6-YÓÃ3‡€ì¿¬fº}w¼ÀÜùfo©ò+÷¦ïÚVŽd(?¹{þÛª½—yª¡\\<’š`\\1>áAm¥hs{Çâmh\"×ÄnÁ¿–†§žúÂÐ¦a¶Àhs9Ë˜e4ÆL1YÆ ÅÂÚƒœÅ‚…‘\ZH¥~|ÝŸTb.ö\"Ö=bêö¤C#ÞVËˆ¼êV\n:P½qøà\rŠ¾áñ/†\\Ÿ“(íl(h}˜%ÂAš*QV±ÍÑ˜ÝK›ßÓ3Š4ae?©‰Q3\n#®q¥âãÊÎËæã Ë—Ò7lJ\0Ìñ¸U²)Ú¼¼¤45Ã¨Ëº°V¿Ñ)à)ïÎ¾¨å°O`í»žóûéþ¾É·Óõ7{‡S©ê\Zèôz0×G£ˆhêæ~yÿÚ\0\0\0\0\0\0q8TÎ(¹AÓ¥ðÁã’`µ·*#_ü‚–¤¼”ñls¥¤Xü¶EçEö–N9FØþDC0hžarß˜®à˜ØXRýÙádð(±ùÏN¨¬A wzÆtÛÞvÃp¶LÞÞÙÛ%ãn6½1}%àiæ›c(Ãû±]‘P”£p+`ž¡õõßI¼èvAÓRÏŠÏ™WîšÚ¸!‰Y\\tA™ÍÐ».óúŽÉcv„­“…„kÚòÓ]ñ}™¬fé°ÖKàÏó÷\ZYvYz‚0çF²irïà9ZwÓSBÆäw~et2Lº¯]I€ÚDH‰ÿ\0/Æ è½ô‹øƒƒÿ\0ÿÄ\0\'\0\0\0\0\0\0\0\0!1AQa q‘¡±ÁÑáðñÿÚ\0?;×d2:eË—.\\¾n\\²´HdŠˆ;ÅÇg©G˜•7Cu2ê\\¹q–^ Äÿ\0(0*j*1¤AˆìCqi*å”ª%“=w7.\rD\0‘\ndZRÜÜNþ”e† \\¾[3an9¶oàêð+¨Ù¸|D‚>úŠ#ˆ¥­Á—Àà¹rù&’©wÂúÜ¾Kæ¿ý¢¨¶³èø‡._\'&Ó<¹Wìÿ\0p¢RåýLûÀbVp*\\©P åâE/å\Z+žn¾ÿ\0¨BØFÿ\01“oo÷øˆØ§ù‚¹UÚlÄG,ÎláOð]u};õÜ$6>©^Õ³nb0Z¼ÿ\0ÈÖZe‚¶!HETI\\v\'ïÉü@\rnë‹Ï»èw¢ÔÏÎå{LuW§¥éý>\"•S²öF+Ë\nrùiÈM\0Ïl7ì†÷y8úD°UEª”oþú=ASø<=çPøŠÂÄse„µ‚û;„éÔ\0A†V¤‚7H§Jôfož§°Oæ¦<JxÄ¡5néù–z}Üùä>Øó¬:ˆi¹fàæ0ä÷æ…&úÜ8(Ü\ZAUjR:Á® vF\ZÒ£.VÔ÷5õ?®f†W˜‚P˜‰V,q‰š„û’Ž²õé÷!FŸ(B˜DÇ\\V} 8ÐÓ	USz#‰ž€p.0mŠ³(Ç‚1h·rˆ%JeÔ¦¸;ºÇ	ÂGHf;–¸#ê×™n’ƒàFž¥à°Tk˜c;ö”#W«ˆn#¦_Üì­ŠÖž ƒ0\nà€SdFÏz<Kß,f±ýcäM‘c™In9‰ÆˆÃ—†upwÃiÿÄ\0\'\0\0\0\0\0\0\0\0!1AQaqð‘±Á Ñ¡áñÿÚ\0?Þj_¢PB¥J•*T©Q%MÀB…“méÞæzü ÃAlcˆBƒ¸€%‘\"DUD&Ò­ù\"v•.MÝO)ê(¢®Øñ¨ççx€áè€\ZÀ>ÉQÚêWEG÷,BŽ;ÜÃ\\ñ”El\Z•`ùCqòOÁÅÇ÷*WJ„Ë™€¨;ó;•(j` ”´ç×öß	d¤¢‡¡D¨¿ˆc‰A÷¹†ÑÅnó¨âØ3Õ\"Jé}.\\¹q@Ö¯Ò¹óþ ‰1¯}î_¨»;øõÕè’åË—`9ðE<\nú“}†¯Þ_¥Ÿ3¨@Ü¯]†nÐ.Á™Ogõ+]€S½Í§5Òf¬Ìð/0…-YMÍä1+f*±S¸îRòÎ<D}%Â\nÍJ´)4‰¶£<ÀÝÆTÂ#™~~çz…c±åƒc\\zã¤ªl®Ç5Éû;êY&<FÍîh9â\0è:F(ÿ\0¬»<p\Z “»/f?}áŽîûÍŽ@¹×Þy?d¨8¿Ÿˆ6ê^”Pá¯žÕ“hÁx‡é^f@¶$Ù£8•=ûÕÌà=t&qµ¦e–Þe¯ ]KB+„w\0±–¼~)R†7nïÿ\0 9‚ #Á\Z`62í®b§0û[”›\')Ôýÿ\0¹å,¯Á…u5-ÔÁs5±Ÿ?r£5\Zc£mO§ý„VTÀ\ZX$LnfÔÈ1ïéÇJ@Å>”î¢Ýl¾×~ÍÀ0œÃ]Ô¬S–ÀFY”CÀ%Ù˜JZ0È\nU{‹\0°ÐièÖ\\ß\ZŠå÷PEåÄ<FÛxõ\0éfhü1Ø¯·0ŒoÇ!ñ ‰p½¹;yñÓ(éŠêPÒg¶ß´ÕyÏõ¿Ä¿[]À¬yÃ¼ëåò‰LÆ¼~ðñPb¤6“¬¢Ùö&Ÿ>’¤Ô”N `A·FÍèk§ÿÄ\0\'\0\0\0\0\0\0!1AQaq‘¡±ÁÑðáñ ÿÚ\0\0?¨Š…°“vjù—pµW%ÂãæüEí{h9q•ÑgÅGLPp\n?é˜ªT+=A_™U+©¦óz–€Õ^7Tâ±‰R¼ËQç8b5\\J½²«$® ò@##ÍZÅ§÷âmžPwWÃÜ*Ð„´¬¼Á-f‹«³ÐiZìÓ¦,q@`«®}Ï¤mPPx7>“Âxÿ\0‹Ú\0¤¦SÔ©·Séþ¢˜qáWÌ/…ÎQ%J«Õˆ‘Hî\r<F”Ž,ƒesÙg¹i¥™¬/žaóÀÜ©Ä3š¨ß#Ä;ŠO…oÐ#h^ÁfË{î-Uº*)@|±4ÉÕ“\Z8Õouãü4ÅMn±/ÑCHüÁ¼JÕ¸8¨©H›†lDè•…63Wu,í*“A‹RWö)\n¸k³©ž}ËèçdG®s²;óYGÞ_p¬@	J·j³ ]!¨b « Æ]h ˆ”,¡j6ùe%EuPÞ‰Á¡Ixå³;pk0í‡ÀzZg†ªt\Z‹\\¼5Xj¨eM2%‘(É7‡Trð\\C/(XéD>jo‡¦€™¦gÚo;9â*ƒuU,Nì1ÍÔ¯8ãô6Ã\r	žÎ®Ct(gj#ò½˜JDMŒ³n2dõ¼_©Žÿ\0Á45‹¦³*XpLž&“4‡‘Õr[ñÜñx=Ãá\r‰ºT&ë\Z®Šœ=J¡R”5\n}á<Bú§Nz:\r|~sRû’FyŠ+€\nžRû­¾´Q}—]& :öa\'â£sw)CÆüîŠYyÞs,†ëÀ†r-%óZ¬F•òÄK;„VªRÐU€@9nÚ…)ÖùH|w\\Æl±ýTÑ–µd G–Ð‰ÐûV4UØOê„|0”A¤5’Ê•£Ê”\"’»h¢CÍAw,ðš‚¨ê°{‡#]y‹7ÉrÔ†NbéLjy7Í_¾ã£I[ «gßøêzÌìDÎŠ3ßWõ.™@k;È¯­XðüÀ1b\ZAkš\\ú–ÀmØf˜^ÔÅÁ4¤9!§n¢:œ\09h¼r’“ÃŒ\Z\"’°Þ­®%ÿ\0ô}*V×,Å¥RO.å„Y	-ÛÄ‘€ßGw3\rö¬]ÝÆv‘V/q”Ä€<Jºiˆÿ\0p˜-Uä¬(\"76\Z¯4jÐ¼5w‚gàÈ0Ó{>¢(­=CER”ÇB\0\n‰ž<žf±ÆN³|  /V^®gx£s$Çâ×!^BÑ¬Òê2>íg M•ÂÇš`0%©>¸öê…‹´ŒU	æÇAY¥<YãR\r0¹p<2Ã7UÄr‘ió8{4òGMi]ñ€ñáº$±Z¤æµÉõÝqM<Ák¼DÞ¦SÖ-%ˆŽ‘Úš`7„&¶Þ´ƒ$Ðµ\r`7Ä±Z1c£ÖH&=n‰•0ŽTôP¾c‘¥,X\nò\0Ö¼?*sË5¸9áŒBÚ-HÀ\rr@\ná¨€\ZÓÑ•ÊÞqÅÄÆÂì½AÀCÎ^Ð;Ï\"æ.ä®°VöÅ;ê¥ëÔ·âÕrR¿àKmeâŽå3²Û\nçØæýDj©me¨Õ]\roù/Šß&æWØ¬è¼Ò/Ò+\n`¦švµÊÄ¼Ó†ñ•ƒnqD„X‚óBžˆ1ÝH2™r…h¨@Ð&z\0R›»¢Ødm©Zm®¼Ã	â„›õRöKÐ«1â•.éü.ý’Â	w…ra*2œ\"C½`ëgÄÖÌF,X¬F€&@Å¸ËQ¶*_;Š…z¡¦¼Ê\n+¬E	¥Í	«”–)O0vQ².‡{ç0F*ÑR®c×tcZñ+ií¼5i˜Û¨´X·1¶µK·î3j´˜ .UXÃj-q9ÃÖ5Sóßø¥ÑÇ˜48\"wæì—öÇâ2XDxÒ(ÌKìçp‹@UÛÞX–«¬DB:Ñyê!r€\\,^nŽX–+¤U€¹`àÎXáulèj„6Yº›nMx÷w,^#œ @_,Mã\'z–+sŠ;–p²ÁÂ&“¸Á¥9|°¨ôBfâe¸\'(¡¹cš¢\"[XI›ª†ø!–F¦¾}Ku‚“,Ã¥Ûz3_r–`—ˆ…hÔÌµãÞ’\r62¨Ðh(bõ¼žÑB¿†[<HP†š³ˆ_¹Øe³`®T{…mÞê9‹ggUákYxêÂs35æ+Â9ê=0¢µz	J“À\'¬‰¯]ØwWF7©‹Oª–åxÑ(ÍTE/œGJ·¿\nÃ¬™½ÏGÌ`£Ã F:\rÅÔ@- Œ6HK˜œ—Wy3\rËÜ2·k ,l®à°µÛÛUG$\"n€°17Õ¤–ºª*²óZQw3êJÍbh­ó,ÝÖcã,NŠÕÒ¸læ%Þ\\ÇdNxÜx/ÍÂ|h,ù!€@åpÖ%‹YÔ¡lB#gæ<©®Òt(äLZ%¸%oÅL¿ÀåøŽ…\rðÞ™~p3‰yÊ<m0-²¡\r¸\Zî–õPikåEAAAOmoU|ó›ª¡ÝãRÕËh…À(mf}G‡ˆ/uWIë<1)4<JÓQ0FÖ2—D%-¨f^@ÍªÔ8TÍÔ´ue¥µÄ2ÍÔzõpÏÔ\"Ufã™IG=Ç0,õ(…´$dÀ¶Ö¥ *86(Ýˆ…æ¡ÝŠ,e[E©È	š!1Šë¯‰[9ñÀÁHV¶Ä+*pÕo9jÄÀ²“\\\\­”5Îw§‘ªfFnØÅb¹˜8Æ\\ÊÔ3\\Ì0HÖú?«Ç‚a<¼E¼k~å‚Å5¸œÑów)÷)Nq×qSF¾â¯=Bž¥ªŒq©sÊ0±Ã•X<[ƒ*­ÌÃWk›ÏêJ:0AØ¡¬CxV½,ª€mj‚5u/BÔ¼¼yŸ¸ìu­RZtXÓÜ©iWÛnc‘u\nZVH÷G	aPSFV\rZÊ†öh¨Ö<@V`˜º§PÜ=C×{üC¶\'¬Îf™”d{ÄßÕãÌJJñ49c¸>Ì±ÏÌ1ÃµÔ_o\0Çó[Ø<`\0êT@°@éAë¨ú`@ìV¾F.tˆÙ§äD[‰Ç” ‡’ðr\rD‘š#•2_&\0ø\n§œòPùÉHô*tšj:_QX\nT>y—új³×PÆ›Ö óUÆóViŽ˜¹B×QZ¢žâ´ÚÌÏFe‡ƒÅeŽJ”Þb[ºªø‹ÜÞ®§ƒæRY‰hõîRóZ±w[Ç‰bµ,ïc˜í]ÊÖ\\Ü¸‡(®+²4òÛjCÞR<£­\"iÅ…:ß¨ÒÙpµWVíX-±+å‡C‹ËGÌ¼+¾c~Ñ[Æ.õC|Æ¤Öu™cùŠµj ®	ÏÜ\n»Ž·)LcŒA\\GY˜Žug›e1\\.¥5\\BL°VsâZ˜Áâaõ¡¤_œbSš[rz\n—ì=À×MtQ-m¼Vœæ®.„÷eŸ’5PÈ.›zŠ~¨( «ÁôÈë“GÀÈò1‹SZ’‚œØÕ»5ÕÉlùŠQbÞGá_ÄµÅ¡ã!5vyˆÚØQ6—_¹{2(pÐQ¸\nµ|ZYóþ¡oEÿ\0=•’éÜÃAˆ²ÕeÄZR¾¥ïG¸SÆ1éJÇúŒ\r˜×Á1ÁÊihÃ¯<ÙÄ¥ë-[Ÿ¹E`r9„]œ*œ–.NB®ê.[q•hÅ¬t˜Ãê„Nò°*ê0  XäÐxÁâClû›€”Ó‡µn-£CfÁYþ¨Œ\\JÂ*cæ9lz›Á™ÜRØC­|Cí9˜d¦óû$<€è³õªÅ»ÜÅ	ì€xÏ3åD:.ã\r\"#w\n«¾ƒÚK	ðÀ-¼(°&Æù²ŸÉn\\Ë	jgò«®nækp¹§›]mÌl.­2\'K\\)šèM(ÂæW¹D©˜¦|°˜…Õ¡ëñž;^Òœîþ£XÛ€U··ç¸rÁ\'”ýÃšéz™eëdÉvÜ¡ª‰•w8¸÷1tÔT•x	õÝMQÐ=ÊàY’sYÒ@îË2¹jãZ\0f÷ÿ\0³6$*¾„ÒpÅVnâÕãêP@9ŠñÓÈðÇðú­¼W”	†*5Ü¼Û¤\'ŒÞÃy<^%‘LŽ5áw«Õ˜ó+/LñVY@çm¼f\Z/ŠH>Z¿ˆ˜S ý þcˆ€{8N_Ä·\\\"É£`”8q†{…êÁTž¶|Eâ66,ìÐ7ÍÝfe“.în¹þðcŒX9øvu|1ðéLh¤Êt¸FdDÌ~£¸¢ Ê¦BÙ`@äèR×]ùŒjð€ÊMlÅªÅ¥Þ¨¹Gû\\v\n”\Z«Ì@†³¸æîâ¡vŠD«;>¢Øqâ\n¨à(WŽw4ÅRéó¨º›˜¥®ª+”T¹W´²Æ9”ÒG·â.‰5ÚÁ;â\rØ°§á}ïSŠR€çç¨Ò\0T4·<K0©pL»ähã-°\nÀëlë”WÓˆ{X]ºõ6âš\n1UÔÓ>¡aà»>\\.Aï]¥2» ß‡uESy0û|ò_‰Bmf1Æ¥YžK>ÿ\0’QcyŽ¥ùy}‰l­\n}!aÝ/ˆ¤m4láÈ<ËŽ¬SçÜ¶#\r‹¹zM­¾æÏ¾ Íu0XÔj\r’‹îvÞXAúflGaZ¡mWDfQŒÀï’ö|D4:n<0%¯kªù1F–+‰•ûHSN-¼úØUµ—µ{‹©”%ÔÃ)av5ôFµï‰ªa%)IJ¸¾G2‚ùezÙ–M®ÕË€y…¿eÉ‹BÍqýaöÄ®ðô0<]ñ\0x!n‡ž^W•`—™kDö p·‚ˆ¢¥LÁwÌ\n¹ º‰bB•×˜D7ëd·Û-@Uà*„ê®éÁ®XSA£Ðù9IuPx÷ârƒðŸïõ…9ß¼Ì½Ñ¥û\Z!Â!èüDšëñ\rùáÙ\\l2l\Z1÷4ãÿ\0§û¨¹48²*ÊÐìçÏg8‚€\0 Ø“º$¬úYìŽŠâu331ÊegÌ¶­ù—s;…¨¬Pz5Þƒ2—vq©õ¾`¶gqð¤5žIïgÅC†Šâüú%p³v÷È]ƒóZ\0ùbp{…†Èó6£ØJiW¶¥Ý_0ó’h¦R¶¬ÜÝ¨\r0y^W’‚®oZ]°­¾?Ô¸¤{¿ñp¯i„ðõßÌvÖê>P¸‘C2ÂÖÙ®Ú‹X·¨«¥WÃR¦Åâ\nh9sÃÔ­QjÎÒ[¸#‰vB\\¹†Qº3¯µ@\\PÜ\\÷êú8è ÙÓx7-–AÜ0êL]ãã\0›‹¾ .	yŽþB\\_¦v¥ÑŸÃŸÔI6¾vy–M´¥[¿2„\nñ.žÂi8c¶ä7Ê(#Y§5ª°}+ù\0O$\r§A,Oˆ”ÔK5wªŽCqŒ¿(•ìŒ²\ZŒ)y4À|¦ë+í\ZÖ¢—>d.õåÜQ¾\0(<Ê¸ªù”7Œª‹ŒãŒÄ˜\"yÔ²pÊ\\À5\r*PÙÛçq¨Eö792Tn`i˜à\\SPe9	f¢^.g”Y ±VÌ£qM`¦^˜\"‘]šP3æ×èž ™9 Uó4†ýE8xMåèl±ÐË¡_ Ãj»êp—l¥ŒûáôûÀR\n\roÿ\0R‚ÄØµ¼rå‚òK—Ì8iéâ$(±¼•;—Zç{Š°TæÐ€½ç-A+Ý–ˆÂé ¿Sv\rŠ_jC„ÚÖ«£ÌÕuMó­eº…+ÂèÔ\"Xž^kñÂ¼°•—Ö™X\Z± ¾\"£Cjåc#n‹-š¸…½ž!bÃÔEËÓT~jl“\Z+øBwU“7·žåP•\\œGL‹ÔÀ°8m‰‚†—qSÉ\\Bî(É–.Î,Û6Ä\Zjá5ž\n.i²ƒÜ®|Ru./cˆ†9õ!Ð˜ë-þ2W\\~!›£rÖsÞ5gpµ6¶ò¥ñ^IˆÑ}ÌWK:Ì*Kû•Û˜(Ú™B‹}LÝ5‡>M06õpÀ–Ø\n¨×]ÁfŠÔ¢&}À€¬@*\rs}ÊÇ7Ë-8ª\n`äöãq\Z¶_<GDÙâ3óDúfGÔûlXÆ¢aÆá¾ŒšqP®™uh;ÄDi}Ä&Ax0·ÌÀm\nX»`\Zn¤GKÜ=*æò‚]uu¨\0N$:µ.¹a˜ŒÖKå6_p¬äa\Z¾H6rw\0¨[n»„µø–\n\0ÛÈ×´—³“á@Æ¦aÄJÏèù—®Nu¨ÖØ÷ÜLV‘ãp}(º¡¡6ue\nÍ°¨‘ç‰g§ðòVìæã9øf¡˜TSZ[Ä´9ó4,š¹p«ò\\È.,Â©­	Ž h®…Åj±ñ‚ÓOì¥-¡vë1à)q8‹õ\0,¼Šæ¸}KíÉï´Û ¶ñ@ŒW/û2Í[]JrÂ;8`².{Ž³wÃ™@\0ö¥Â\nÅ½ø˜ðž#¸gÎ\'HPÓÃYüÄ^0F?P-mEc¤¥\'ÔDÁ} (ñ¶,ÙšblL1 (¾s)=À#¨vÖ‰A^6~&EVGp+EÄ¿£‰®ºÃ¾\"¼}˜iQ\0%|M+Ô½F¯ì†f¼4ÆŽh¿­Ã°µ¢]‹ÜÁ(òÉ3:—m9?lÎZ©AËë1DÈL9KùƒT¸#\\#å€Zog× z„[·8‡4-Ò°Î¹ÐU@µ¯£©cjìi.‚Ê+÷	 KVÇ³Äuª§/ú‚<ˆEJ¹p5\'Œ_ ¯Ì6i½Dtßµ‹À¾“<¢¾ê]V\r…UÑ\ZË¬ÑÊC™hVÀµx¹HdÙ»¶µuWâW`l÷ýšœ\Záðãæ\rIóÙã¸€àÌÍJHé¢£ˆóÌ0†Ù`‚ûgêY;! Q|¬=Aábp\\ÀPåª}A×h/€Ë	Ì$P\ZùÞbnìÁ\rÉuæác÷ÝˆÂ—lÏËIÏÉQÜ­†.üKÒ•³ÎùÔiÌ‚…I“¨0TEP^æ£7 yÑÕÅèb˜èM‹£Dº7ûÂkŽ\rt»Æaê<TXðëÑ„#¢ùóE¿9o‚\0GÙŠ2Kpû\"_6JËˆ[`õp‡Ü[6”·kUê:qÔ=³Š\0¾î[ä\'ö: ò+¯Ûâ6õƒT±yÅ×rŸ~l\\°^É¤µ›Ê\0q±Š…VADu.Z¥Ž‘PÙŠ¶Ãñ¥e4\ZÏS*ÄI`/•¢*žSƒP{ePww|uÿ\0°¨Î¢l¬½Óƒæ&³Š·MþßÁÁ©aŒ³ƒQð`-õ3+n\"B+´8—0€Ö/HgÎ}DÄ:ZnVzc(\\…–·qŠSH2Gkˆn®.¦W-ÀüËŒ*)¶yŠnZfåŠh˜wV”K–â\rÕî(º¯PÔbÀºeÇÜ4³H²9üBZœJ¹{06	®~ŠÚa€\n- b·*òVýÌ·bVì!pÅš”´™ˆæ£¥xKJÍzæÇh±oˆ…ÃV6ÿ\0¸6³ÄðU\\¦måu*òN…ÁL‰`ë·¢iMÄçþÇ3w¤‡\0hŠEÀÆ(	Íd¸%75áô \ZŒ(Ý€5xÔ¼Ñª•YIn.&ÃÆPîWM4™Éõ0gÌUÃ¸A<é=8*…W¨ËÇE).kŠÙ!+!y-â\nKî×¤£Þ_1Y ]AÓÖFYÊ€Ìgg÷gâZÆÊš¯|áŠh­B­Pp”×ö9\0zïÄL”¬E0ó@\nç7,êVÌK*€´âs+ÇoW—ê\0ÆËY!Û€÷Rñ%E,rŽÃèó´ÛÂVžŽˆÑA”šjñ”7DÈDy\Zë@ÓeÓ˜ê2Œp­¨cÃ€C\'¸F@a¨Ë¦2¬Wñ.+‰Û@úLw¬£MÚúÆrü„J…Ç[ £K÷.õˆ£6[Š§¯>á½‰‚àfÄ¬ºç‡­\0Y\nðreŽ¢žÐoÈ±‡ÃþÌü6K»ÑÅbŸ»‰ŒÓ§ÈjRÐþGñ0ƒðÿ\09Á÷—âj	äS•åø	ÁÞÁ\'º-ø\"¥#eÿ\0Ýò`V’Ö¸ÓP‡mV…˜7d8ÒBˆj’Ä*Yp§ÚâÉ²\n\n³ì­#@¸VÂ×7PáÒ¢¥©«º½î*`E|@â˜Ýƒ–ÜuÝÀž–ˆ+b_Ü£hå\\ún%Ú à©r0íŠVÐ(4^uæd”N‹ax¾êa—,Ó¦TPÜYt?qõRŒr¢œã÷EÁ©ØÊü2®K­žuwÔ-Ml\'ñ%öKw¾æa½q(îh[(²ÏP›	¶W»øy¨˜Pƒ!1üÆ\\V;\ZµQàÃíË‰mgS	!9\n\ZÚ;¸0Ò†3‹Qsß1,\\r`>m\'¦îâ×V#½F}_Q	‘4äù¾â[!\n¹†Eeqms§}5Yl\\ãÄÏØ¯¨N\rÕ_ò÷1¬Ãr‚t°BÆŠ-ÑÔ´2ˆiÅEßê&|–}2šàmàÁsU-Ü°n(\\KÒ®›^Éj»ÎªãZÿ\0p„¬8a±çÕfò¨Šï“-µj«&îZ·‚‰yeA¤ÍOÎ~æžÈÏÜ~K÷6}Cqšÿ\0¦ŸãÝÿ\0sðäÿ\0ðh†™·ø±ÿ\0_pßÜÑÿÙ',13,13),
(7,1,'iikho','jkj','ÿØÿà\0JFIF\0\0H\0H\0\0ÿÛ\0C\0\n\n\n		\n\Z%\Z# , #&\')*)-0-(0%()(ÿÛ\0C\n\n\n\n(\Z\Z((((((((((((((((((((((((((((((((((((((((((((((((((ÿÂ\0Q\0ì\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÚ\0\0\0\0á=,t(¤m˜âæŠeÆêLù^¾¼IX¿¤¤ÛÒRmé)ëxJÅâH‹À•‹øJzÞ’°cÓ¡Z^,¡£\r­™v6xöSrÏÔWÐã½ÙBÙÈû®äÞW×#\0F’KvŸÅÙ“Ç”õàJúÞ’‘xS²âÛüMÌãîbõxG$Nüt‚DG3ÔòµžÌ¼—ÑinG›êy›–{/¸!½MF:v,Øo1Œíg1í,ƒ2c	ÅbÒEL/#×‚­zó}tõäÍBâéTÙ=F¯§QmÊlµ5ñ»F¶¬-QÁ¢AT¾fsÙ¥’]•\'å{dTñqiÑXàž¿o¤v¿Œ£€6ÙÂŠ\\v¤ÞƒÖ@É. ÈÉÄH{Ïf=_MkÍäš°§³O–f‹(¡=j\n	é’úúG$™$’%™ôñ(V€/OÏôž öd)ÅÙ†Ž¢žÛˆ…\rG4‚Dƒ‚À!ñ<|IRõï7P;Ä\n×G‰¨‚¡h\r\Z7½Ìisõõ|¾¯3M®ç¸Ÿ7(L\nÆ§‰éô+Õš¿‰àtíiz\"oé+âxÁk µ0[?7‹\n;øý3ª·+¿—eohsÛ½Z\0ÐPÚÄ$w9¤-@Ì«B#JÆóT9/àC•e¡ÈRŸ·:]Ì,]n·ªãôóólôÔö¼uÚ9ÜÚ;H=)˜Æ.3˜¨à¦Áy{¹4ºL}Ùô¼y»*Õ`ke$m‡–ÊË †uŽÍž;¾|ÍZy\'yþÁÏ^«„¹~†|Ž‚‘€¶à\Z¼ƒ;VrÉÛe©n^ÌU¨ãéZ•i}îoJ›·¸]ÌÀÍ²¼~[éÔnGk\0üûj›\\µZKöOƒhtrý‡‘æÛ· :Ž\0·±/k1J‹dÒû@ßžÞíLþÿ\03Ú‚ÝwPS¬ÕX°Ê5~B‡|KÏz\rŒ­³G!Ã\\3PÞÂÑš²PÝŸB×^Ž¦¦ÿ\0¥Jt*öúë™AÀŠ«×x^åZBý~>³Ùº9ô°ÈWÏn`á1éž“5s·Ö#Û]_šÅîRés¹ogJ^y]>)nË;Bgw\\ŽÛ§v»+v¸ªÂVTÜLˆ§z\\õ`T®ŽcéqºÐ2%åý>³,\nÏfŠDHK<Ü0–­ìÏ…¦¢i¯|1¡`ê\\_ÀÒyòç[7vHÃbK¡cv\n”¹]#Ï÷t•^¼?FÚµ¹d|cYc!Ñ\'é]¬ÚÓæ¶›ò54ÐÐæ®ÓÐ3S;Ðyòæ/±‚|¸Ùõˆ¿µÕ¨þ¹ë>&ö™ô•½	ÈîRž!4b°ŒøT\"xºÍFr´ë§OÓZñŒÌ]—1ŸK`jàz=$wp­[æYÐ½+LÊú¤cƒØ½Ç1èæ±PóX‚|aœú¼ÛÇ¬u­²/+—Bá! ‹°+—\ZTËô¼ÍYç©ÑÏªžxAÆ%CtØßÀú\"ï›icª!„_ê¢¤\ZYáNžq’¢Ú’¨È©`¬0–‹ç!GªÊ3ÎYÊsÜpWXËPÖð½]ÒÕ»*X›IõT¾‰XWÈ÷dV*^ _Z±%€Dfï^|é9,‚Ög1ªNzÜâæ²[ô<ógëƒ¡—\'Î„‘6ÃµWŒï‡ÕÐžKÒ¦zäôÜ‡{>S³³®yüßY£\rŠY©®h/ƒj”üÇ-ÑÏÒòwzþ¦zþÝò7±Ãg–·½9øpfëf3—GÕg’æxý,°×ÐrË\"¸\"Þhß•$1—4Y¿<÷«:¹â‹‘›%ëQ³fùWRr!õe£%Ã—}œà&m½ê®*þô1>ñ·¼$ûÞ3×÷ˆ›ûÒG½é\"=è+ïxO½«ïK{ÁI>õ–UÏxÿÄ\00\0\0\0\0\0\0!1 \"A#03B$245@DÿÚ\0\0ì+&5l½˜’ò®ì‚SW)bKWƒåT-<$Mk·JþQvˆhJº‡õ&ÄØŸ·ÝZ=üª×SÆ	Í£€›ÙM\0¶O>‡»-ú\\\nèêNöÙÕ®K,ÄÅÎÆíUv\\ùY8Ê »ÛuWtk/«/ò¶Ïð¬•²ÚÞ›~ã1 €N¥b3v$žý\rš-wºÏÒj>§ªY_S¦Cˆ©U¯êÊ:M]#>ôÈ·ºqÇêšN ót¬]äuB÷un¬†þ«ªhÍÌ­vM¸ëƒö)*MÖ‘÷c~_¦fM˜YÝ…UýG4ÕÙ†Æ×ªô»)2sò[3)«²ü‹ò\ZËïµØ³¶Fe÷L¡nÓcU‰‰PÉ¿§gòúVZâ_ÒíÇˆ­kâm\\RO‚·K˜9-…—Ö0×+ì×mJ/|qAo é¸¡s+¡í—ÓgQlÕ©2þýMN~]wõ>­e7\\Ïs®r[NVB=P‰Pú¯Ócã^µ8ÍwéØƒ&ÌÌ–ÈÌn¡—®°÷Ýo+0ÒÐ¦ñüŽŸpÆÏê; dáôsã­Ûu^;u5=¨8B°‰©Æjjyîâ\Z›;«·:ç¨¯òÜ¦ëéÙmÓSS]µ\0Š²´w²ÜW®5N³A”³SRÛï¹u÷jkìÔÔÔÔâ8Å‰ãU)Bú33Ì­WÂ÷ëg·ÄÔÔ×mMMMM}•‰ýÕcÚö}.B¢d:QU^4°C÷þð	¨&¦¦ šš‚kì®-š8¥ÞéKA°Fï¯¿]µ55ÛSS_jÇ±j˜.^2ÜÔWÔ*ŒMË`Û]µ5555ßS]µü€²Æ+-ùéû\\|œ³]uW¹o°GõÛ÷Ôã8Â³S_É\"ÀF\"´å°ÈÌ?NÙþ®Ûçê^&°¤Ç~uØ=ë°qŒ°ŽÚƒ¾¦¦¦¡SRÆW~C[1Tå[Õ(Zñ:fOÓXÖó|L«*oÛùÚ°ˆÀ³Œá¹esŒÔÔÔÔ×mN3SŒã2k/wEu\\[nËëGXX4[m¸¸Élµ«:1[²mÄ+8ÅX¥X•Æ@%ÿ\0\ró®Úší©©¨ÚPùH¶ÔVÅÉ1±ë¦~¡Ëôê1©gØ¹iÓ*­0,Öpœ`Y©RnXxKXñ°ÍMMMCòlàÝ€™ìFCƒbâ9L­E‰:Õœú…Uœ›×1¹&ˆýÖë\nB¤ã8z\rÄ(6Ù’ÚByøŠÜ—°\'»ªÁ$Ð ©VïIFéXm[[“ZKròØ¾FMIMŒs™yÑ„åèêx‚jjºÊ3…gÆ\\x¨Ù§{•.­U›ŒÜäÒ”à(ÉÌ®§É1ªðÔ2ÙiZöÙ­Î3*ï-‡ý©Õó–®›×,Å™½~Û’»HŽW]\',ÛU–W\\»¨c óeZpÙ²)U-hFç8ÍöS` é²$ür-•»ÌÜ³jÙaÿ\0büMêbdx»\rììÊ©J«0ÏBlMaDÖ…¶ý{Ët¡ò+RZÛbã¼òÅ,ÿ\0ç_ƒYÖõ>F.GŽ0G<ã1»\rÎ~ÃÅ1}Áu+>¢ÑëµË¸¸Ë<GŒÄ\ZMÈË>+RçŒ5F£Þˆ˜¶nŠ€±cÎSQe`Ä€L›Åš¼jFâ	NJ‰»ZÐÚs]QiôörÇ¯Ç+EphSYO±Ž&\rŸOföÆÜaõ`C+Øƒæ³¹w¬•Z•AÔ/Æ9?…x²	ÃFµØj_À«r‚:ƒ\r<b,éö	ˆŽD±£´²Š\' @(âWùËþçÄç\ZÈ¯ýrì¨­+@H! „ñOé^ÑÌs½rÜ\r¹S»ÑYnÖŸ R_×9Ê3FöFåÃ¯&æ;£¨hõñoîåÚ©•ÿ\0^Æ;Ë,…ç18‰XÔSÊÿ\0¸°1€0¤U•$³å„\"TÅevmv¦?Á«ÙÚ\ZÛÝfx”¿,{#ÃÛs‘‰dVå2¿£5¡¸>w¨­éŽ¡}“*Ö©‹‰ùRp\0¤Þ¨£þ%–Bw7Û€ÎBS`™>è=È‰Øú¥‡ð\'Þå4ü/Èv±`øÌ><\r2×¢g	Æ6—E}Àñòçºæ»z„ŽúŸØ`âUî)ö£ò‚0€{êºm*b 1‘D²ÅsÍÅh-ˆÜ—i1vgµâ‚¥Ñ­b¬ÛS±=Be­åê]ïêC–cdny{#hÑüK_)mç1ì”÷ø;Xß50yïcÔÒèh@Dk¾CŠ«Åb´ZCœ½¦-í„ÜéÏŒ™8ÿ\0JåÌ}Ùfµ‘®Æ	±\0s–Ìä åúŸÚ§gSàuWÿ\0GaÕlÑ½Â;j~ÐFµÚ±:g#–PVjj©¨?8V|Aî\" š:Žh yµ¹áh`‚jl÷î=/\rüÆ¾1­­YÌ|Â&¡µž1·øp$/(Šaõ:Žjb«;3>-¿R:/P&î™“Q|[j«*“o9ä›ì:à¹V¾,ËÉ²óñ1ïjåÈ¯]‚ûõ­zÖÇM\r?)ÕcÆ;•þcŸª?ì1Çú¦6Äw—´ÓÓØDáBg[Í÷6\'í’(±³ñÖQ•NDÑ‹¹ì\0Úœ‰ŽÉX¿¬R³\'*ü®ÌcFÌTêæ3;/9Í˜ébÛs	®Ø˜ÞC…MuWqEWy-wƒ°>»|¨º.vJÁÕrÄÿ\0ÌÓæd¼ù0MÄp^7UÁH¹v,UÈò”iÜ:vªÂ²¬ãà²÷°ïîÜÜææç)¹¹Êr›€ûì-PÔñfùNP~R$??øÏÛ²|ÿÄ\0+\0\0\0\0\0\0\0\0!1\"A 02Qa#RqÿÚ\0?É=ˆù©Y¹_Û†—,Öä‡ÇÎ·.W¦(Å\r°Kí\"9Ôâjä¥•µÕ‹ÀÄx,²þ…6¸²Ë,Nø/hÚò&H²Ë¤pÇÖË¨Ý%–X®NñM{YfòË,²Ë,±³GJ-û›âÕ2RNNºÙeýlÓÁÇÖ—£¹(Ö4I(ÒE–_Ù\\˜3‹oèÔjVÔOö„þÅB+rÜdÒàxÛÇÁ£K}L†jïÏ±š‡ B0éïò2àp6Š6lLƒŠ”¹³Y¦ùy¤½Å9K†Az‡)AÒ\ZµglØ`Ó7É—$pª÷2ÍävÈÕòB“&Y¦×<pØ¢COórîftdÓaÂª\näÌúnÎÔ‰cÝÁÙxrlÊJ<3	KØÞ¡\ZDçê²W\'b™f,RË-¨Óé£†5uÙlæ¹59{Ê¡–;ro¦|Çöj=8›Ù¸Ü…6ˆNü‰·Â4x8ò9QáðJ¤O«’e‘‰¯6ÿ\0©—¥‰Ál²·NçÂå¾ð…¡\\‘‹2BÑàÍª|”ÑÜ¯&²[2´‡;,ŒZ2BâÀœ\'1*éÀ¥ê*ÌØÚvˆ7‰£F½SLWÓiÏƒà*±Í}(£e>™âR´k×â…ŽÛCð‰mÈáû(]D‰Í41ŠÍ[Ý’¦ÑrcÁù¥(dM\nV…Òq±”LnÄ¸lÝ¹ØŸDºcƒrLY\"•Yp)CÉÏ‘’e¯,Í¨–OL|+¥ôÇ‡&WQFu0KÜ”­šMKÇ-­ðw Ý&JEŽFLñ‰“,§äð9\'ÒÈ4Ÿ\'Í(+D®RÜÊ(GrkÜîÏö97ç«Fº?iôC?ÿÄ\0)\0\0\0\0\0\0\0\0!1\"A Q#02RaÿÚ\0?„71¥éŽõ»¡†Ïe|ˆÞÓsý{»e1¾2Œ¥ïðk‚Æâù4©øù= ²Û,N2ÉZoäYÃMúÜø_HPyË6¿³?±4û8Eò×lv”\\~Q•‹’;¸‰(å`©ñ‡Û	GsÂ1$ù#,?ÅÇ+Ë=dÇlY\n–é²\Zí<ýK¶²xD±ù¾ÝV6_j‚ÿ\0(z[išœ%JQ­){þÝKÝ•\'ëÑ¥UçtÙ\\å,î_Õ“\"äÖÐ¦ùôÍ’Ç/Ñ%·»f{dÉ“q¸”¸à¯Wgùdù¨®§ýå?B‘‘ÈÔëÕm(²GÉ¸ß“$¬de¸Ø£è›ÅiŒ-Iµè’Û,\nfó]Ô#WÄÓie¨žùz*‚®8DÓK‚Yk’¾Öâ?&ËzãZ(¾íLþRÄW³Ë½¶B×”[/5~JþˆØ¤²‹õ0­rÉÕe÷rŠ´éÃk!ˆ-¨q%×[\Z£¹—_+åÉ\Z[\\ŠUÁm‰D·r\"«\\^`ÍU>O~þÑL7ÛÅZ0`h™<.Y¬Ôùgÿ\0‚–d™¹²­CQÚNø×#!©ý‘º\nÕ1	y:£ÛV?dŽEÈ¥¼‹žØfŠ^J“dbm$6u©fQ‰°K‘»‘r!ö‰Ó^SBF;N\'X_É>ÌÚm$°e£\"ŽŒ³½þ=nâV/¯Á±Ø‘»#„‘ÒiÛ§ÞþÍØ7›Î¡¯ÔQ8Æˆç%».¢J~°IsÞk=’0WùICömUÅEížÚ«”*’lÛ9¼¡æ/LlÜ#T›ÛÉ¤ÑÂ…º|ÈódáŒ‹-ÔWBÌ™EsÖj“ôT£µSB®‡’äx-ŒwJ/H²×}a\Z}$4ëd¹+­§–}dqm|HôùÙksbj1Û\"˜ÚcÓÓ.Qÿ\0Oÿ\0DBºáþQ¸rÏe.Ù }ÿ\0wÿÄ\0>\0\n\0\0\0\0\0!1 \"AQa02q#±3@BRb‘¡ÑSr‚’Áá4ðCƒÂÿÚ\0\0?×$[SHuù«ÜHÜ·ŒåN295AWÏ\\Ä¨MÇ\0eÃyGcœðþåE¼<šç8òj¿„0ÝpŸqAÖÔ{£w-^™Ì—H?å7Õ7þP¥òwÉÔéQ§¦è4fÒØ)õþNV]ôø×‚‹÷tz/cz¦±‚\\ã\0\'R©MÛF‰#;\';E¦ÚÀlî‹«ÞïÔ¬\r\Zn˜n7Æ/Dêu…íÌx\n—üPc9g®÷×¤ü¡TNÄCtê•N\'ºä­%ßh4¥6›¯¢eø›Í£k2M•&Ô0Âà	M¡¡0Ö%Î8è›N®:ú3ÎqBÓž8XÝ=fV™ì©²«´svæåµ6$ìÙÐð’šêíspÕcDÚó‚­´<[L#°Zaoþ0=ùÍ\Z1V­n½º*”´^6c†BnŠÝ’ÓíìçvZ`¯9ßÒZÜÙROé¨V¥èGP´m/`gIáÚ7+õUt‹tzM8]»]3Rõ´g}Kyþ‹Òihÿ\0\'´ðìÈ»{\'Õ$ážžAÓqkÆD&º­BK|¼¡5Õ+Ts™å$ä‹œIq3(c-C¬ØÄGTkŠì¡QÞvT>Ê¦’Á´ù¾N\"1¼ÿ\0„ñI¨UPhµ©Wä×qG§ˆæÖ£Õ^±ÐöÚ1¸soS¦Òç›B©òVŸÁŠôÝ÷\\ªbÍÁ§ô[L0úup“Ô©•›–NB¥ô¸™À\r{æcÄ‚ŽÑÅµ+°¸6“n)M\n†•£Ô²ç=Ö,ŽEVÒ›Ll)œ|VNJ†‘V‹hh˜xC¹Ý•Vèÿ\0FÓóá2Ž‰V1˜ÂnÃFÃ¶}L<Ñ}W<ó)´þQ¢kaòÔi‡Ú\Z5-•\0q\\ÉqÖì^mÜ>Uáš=+Ô(Öd³\r©Å°…«¼Úö‚\n¥ PÌ\rÖïè¨ü Ãô¸—Ÿ²Þ¥W¦ièZEf;ÍïßÂ£UþPnªT ÃZ•C‰¥—N«§»bÁÊn°‡\0ÒbJs15Ðs\ZÈÁÌO†Ú{WšCìM–—Z•v¹úC8>z/œÕ£[G­N]T!Me84ÄüÏ…k=ƒ +ÛT{ýO€ÖÓh Ú{§Ô™kHû\\¬Ÿ‹ìær\n[½#5†­joB~¡3~šì.l exï–¦HsÙ9¤\0|Ö3àÀ¹ú‹F<>«Øi;ìÇ/úP8Úçf[×¥Ó\r{\\µqgàÛÃ¾÷•ØAâw ¡¯2ÌLÃðºÇÅq6V¨çC¦z¢€?Z2è&ñÕ\ZÍq¤2Ë/rÃµ‚gÞPibÂÜ!³ˆ;?¬†7<ý­¬ƒ„¬L<‹f,¤¨>Cú}cDž©Ñå<û­ ñ³û4„#³¾$vWXI—2ßV/#$8DR›@s7ôæ©Šm\rk]’®Ü±ar­YÙ½Éá¸Apè³ÎèVpÂØ°ëõg†ç\nhÕ?uÂ\Z~Î£.OÝ^¯j«³f;4ÈS¬ýœØZnN ÃQ¥ês\rŸC¨ø€ËÂ’°Åº©a‘ªÕ?0œi¶ÿ\01ê´z~®ÿ\0\n½O¼øü‚«†Å®ÆÓê©í†£~Øø*[&\"OsàÊ¶ì\0Iè\rª×Ó\',bÇß¹…Ö—	¿5LL;•\"û6µ‘Ôÿ\0Ò©	âii¼Ý|á£Ê!þ‹+”h;1vø—TîŠžg4öT×rPó%¤²zÁ×Áï²ŒÚv[Z‚: KÏF¯e²¢;ñŽ¦™UÝ„	T¥Ä»i.wâXjÁ‘\0û¸KLöF­ìz}Ïôk¡Âò˜*Òs\Zã‡Èvk¬êâi\"&Í”÷Ó>ÎHkF^ºÆa çœLcq—Í{Lº¢Ým*í¥5™Æg®áÙÑc³¡{g‡¾«®–­ž×OÙµÄffê(Oº‡Ý¿Aú7‹þé´«}+G›“ÇUíÆú”vnÚ»£uç§M¿…“ñM{¼ÒAŽÅOˆ\\ã\r’¥“OFë“ª~ÁZ\0ŒÂ™¶t¼œÝ×r{ëì°?Èrì®æ=S‡Ã$r”Ö0C[aâI°XüFžÿ\0õôWRL.%dc¦Aq8Õs>«¦§ÅªÅq\rXääzj¥9ãïþ-ïš0Å&ñWwÿ\0+(è:j‡.»„³²¸ ,!a`’£W\r—X”åÙ:§6Œ zîç¿n*§ÈÁ™X\\q:qÔwWk¾ ¤•Ì¨6÷)\rPDwBÉB¶©‹¬|¹÷R2ð/®¨ûØgòQ’µÕì³WV]Öz¯ªû—Õdi;6eé»ž«îcûî.÷rE£šâ\r×%Í	CUÕ•\'rwíá<ŽA·&ˆßƒ¹_QºçŒØÿ\0-Ü·]îøø¹*uXjº¾ª­ìññTV‡‚}GÇÁë	YB¾º‡ù•ä\'o[XðëŒ)­è#À²#¨ñ-®wYKø¯\rVð½7ì®³×mD²¾{Ÿ†ƒgÞ|6bHÑaËíO«ó²÷NþZ¯}V:¤Ç8ä¢÷:¼n×H‘Ñ²¶ í/hZ2\rê…Zµb•a\0ó)ÁÆÁ“¢%5ŒÍÆÚ27¬w,¹#‹¢á\\ýã]oHMoA½–¶1Î–³Ê:j¦GÙ—þA±Ÿ]ù]ÕÕµe¸\ZÑŠ£²?I~(¸`ò„Uü)ïÄ„zõW˜ÏHì\nZàæöÞ·æ£šƒ«¢ÍwQæªrjsêyÌªz=>:Ïhtz‰_Bõ…†®É§½P‹ÎÁž‡,32Ðà{ùNÙ¾ž8ºí’\nöÅðÕ,ü–&Øó\Z»ïð‰W #OCã7òº.yÄçfãšŒ‡UJÙ4ÜaÏS?—ü­3ú>*ƒ²q¢ÉoKnÃ[*jG¢¼\0ç4qyšó—z\r\'B¬VM ¨À}Ë\'j³ï²Å¤=£ÔÀQA¦«ºäµÜn[”tªpø¦Ñ‡+Ä+Òwô¸~É¯©ó†¼6>ÉUiÑÛTÃçˆ²n!¬kgÐn]Ð¸4I(™·-ù+éjrµcï¼Ôÿ\0±}#£ÿ\0u”›žû‡„ž d&û7Yø³M.a0\0ÿ\0kèÌI´uTê`$BÃ€ÏU\\Gê 1Àúv×dá+‰ÄýU–å¹£:Kg§ûG†Í†áNôúïÿÄ\0\'\0\0\0\0\0\0\0!1AQaq‘¡±Á ÑðáñÿÚ\0\0?!z‡pA,yJ­ÜÌE+±ÑxTÜ®µ+ø×Zþ,WSµuÒ§Ö‹jò´À6ÖrGÈŠÇÏcŒJ•;_\Z•*T©S9ëR¥JÄ¯ã«1Þ$³/Q²“=6*¾3ÚæZP°@½x_.#$-={½ÿ\0Bb[uÑ\r¤.Ù.éæåJ•*T¨KÂµˆŠ\nL#+­JœC\ZÄ©X®ìÕ+Úk õ$Ï®û=èuR‚9ó-»nÊoU*|ì%,c‚an{îß?/ñî$\r­\'—¢áÌÓaxƒ\'Cly®çÔ„O©€ÚÂâ¡;±ÄßJåplƒÿ\0I\'ýŠ8Hö£ŽE\'VT®•hAGçOh’‹ó„6vår¥fb8•ÒŒ»7ûÜ>XÕb=:1á[üt%¤Écïÿ\0f;ÙŠuþñ,Óéq‚\\™q¹–ª\0öÌXêX‹bî‚Ðå4W¢ÆfÅŽ3áqyVçbx%ð\"ÆY‡œGâ°†ˆê~Í°Õ…WÖFéià–ŸÜKðwÎ\")Â‚ƒtÊÄ©R±rÂ;„ 5øÇJ•*TLEÅiøµœV­ëµ«µv0oýPëû\'˜‰„ƒÙ¦Omó÷?õp«.å$Û†Õ’g\'t«;•Ï˜ó’ò/Ä¸¹\rÊ÷–ñ$Ii4Û2ÎZçr²vŒï%ç73JŠ˜ÆßrgPÕ^óÿ\0–2¥Oˆ*T©S\n{yÿ\0wŒÔò<ÿ\0qŒ\r	˜8¼<æ|¿¾ò°Zïƒ÷!L¤æô%Ìtÿ\0p+(»Bö}ïæj\'ÖT®ýÐ!è1RÖH\0øYkùc¤Mƒ>|žáù$—àŽð\rLJÂW»ö‰uäÜÏk¹R¥tçR¥t7‰«ò­Q•¼ïn@Mï–•Æv¾f^><Š²¥Ä¡æËx3øjðgßAé-R¢wƒª9®ÄpÆ–,:¨ö%+Ø‘Y–E6,¥é€ý ÏÈŒ«”ýx™´ŒVnœ!*T©Y•*Uå•8«Ï°•qB•£lÆ¦\0=—P=L±•{„Pj¶ÆmÐUÞ£Ù¡Öxú/(Æq¸ÚgŽ]©n¬:C.˜Ô¢qÅ›‹Ú%b:/}h;J•T©R¥jeb|Uô‹\rn³‡Ä)èös©·50 q£ô¦WÎ…­æ`ãk$Ë`-s.¦W*Uq*R¦)€dN!Á,ÛNŠ•*T‚*T¯à4ÜÉG,S2­—ÎçÄwcpPvb–BÇžóPX/ÌWáQSÎ¥pzs*$©Pd\n`™•*ÐêOâ	+2³2f5GIÚDnûã\\ÁéÙ»4küìMÁÙÕ‡ê«y›å¥ØÑ}¹ûG§mÞ´ûõÌà‚T©R¢qR¡‹X­x‰ÞZqòÍ¦-ÐûêR]@^É.$IÌÚ[jBJiÎ]”}e›øszï{^VßÆXu%µ<P\ZûÊ•ÑQ\"Jœç3×EtztT:„Œ`fÃ»eX¬L£å­L/\'´8äB<‹G8+¸Jî@ÂÎäÝD•ÜŒTÓ¥–X	VÂ N¥T©ÇDí*]EW\'s@Ýím}ËdÉä=ÒcÝHŠ24^ëëd\ZcìJnÊöo?ÜïÌ®ŠPtž£ÑYÄ¥g2§1:é+´¾\"ÏØîË [²˜¶(oW¢˜ÆüwDgæ6þ¾¥V„‹V+aLbn\"í8b˜Fžàt<}6ä¢y¥M Ìž†š„º$¦f·÷˜#c½r»À 0\Z¦ãÛ\nÝUPm¶ù˜YEäã³ó)räxÓ\ZÂð˜mú›&^•5ô³™é\"Ž³-á„T2è¯A0­]Ûº}eÝ³w±¨Yöë‚Xí3AÊ4¢È\Zo¼Â8Ÿ}Ï©G5Égú½L\rÆ,>:@Å\r2Ég®’<Â®elŽ„›FÒ¡ÝÓ·h„Ô­mj|»NÖ‡Ga““¿÷!È¥óý‡å”R¯Ã?k2Ÿ#òÄ})L§åó(\0¹2ò+ÌÙû–±ÊgÒ„Ü…ˆD*a›‹¾€t1o“é€²µ€¸J•ÐXø2u\\|B8—TùþãæÀ­ÿ\0}aX:,z`rf¾ ŠÜîîÊå+ÏÃöYb¨Øñ\rögÕÉ.þ\Z‘oÕÃJ®ìe¥º1Ä\Z3\0’É^ƒA]@´¡d	‹’ùéP}—pt„\0C+*ˆ}éCÉ\Z¾ñT;S÷©Zò¶þ¸‰Ñ£Á¨ÉG­|—†¿ä\' ©\nñÁQÈZ¬Ë=ÿ\0øõ­y‹Ë¼L¤vWóÔ™ÞRdü 	žÄLÅ_\Z†øß!Ð{»ö—¶ˆÎFVd\räÐ¯ú‹b‡D³æ.\0ÒyD^ñÉÊýeÝa =uIã#€oÃ¿¹êb‹¥VV^½¯ÛÏ¿Ô €ÅC8B¶?]°&;\\\Z¯¦%§:ÇæmNç?ñ2Á M×ÔTMAð~ä\nÄñ“ÄCûô]žX_é\0ˆh¨YôŒwKLAYŽNšÅ–A™KÕQ,¶Š(íO°èÁ¨)]ì²3!W‰b“ÿ\0ñ((•vs4ƒ/DÊ\nZ7G¥k³Ðÿ\0¯Ç¨\nêù…QÎ5i5¸*³Ì¥£´‘P{KÜôÀ!ã]6¡ã¬£(«Äjó2å	—›ãDI0ó{¶n_…  ™Az1qNÐÔº÷?nïñ2ü<F›ÎüÄ¨ó>/‰­½0¶á}0ü½£ì‹DLÀ°w§<K´Âa5¸ùJÅJÐoDÖ/bFjõ69–ñs\rTÇXáyóŸ ÄÕÅ—Ü¶¸=¥y/öŽÈjOÊGÒQì6_Ä0F|.ñË3y[ua33J8«Ê_ëÌ©ù‰_ïÄ·	Ö¦,d®kwÌ0ˆNÝa¯´n»¸‹l¥!P}à[Ê‚1¶®S‘*WqiqÙQ¶‹ýa®í>VÁqÿ\0r6{Hh<£ul}¾ðT\06>Rômæ9’ÎÃ´5™ÄDVœË1k®Xp€j¼Ï.Mc;¤žzú§Å”øLÉ—êëöt	LIÜGÄLŒÄá°`TX½üh¯²¢ïc}¥®#ÍîbAWpî±\nó2÷QË»?PY¿ö¨|ÍÑx!ª=ª/,~b…ÅdÔÎou×Éq÷Ž%GžUË¥mc-Ì)wq3\\{Ij(\\º2g=\\¹q™k1YMNV4&ðé\nêç†a}ˆ€åvví6aš¹¨:™j!íê\r(ã¦2é³ö‚0*%yœNQöL\'oq/Ä\'rœÞb`¸5¥Ìé–W’RÍ‘<ä}å\Z7Ò#íÚ{*ÍrŸ²S9ˆ¹Ê¸—3r@ ëó\0nÙ6Žîc„n“|“8ÝÁ¾IiÊLuÅÌNñå.cæj\\Æ;R¬ùšŒËO\0§ù3ÿ\0ç;Œ½Ì·™pmL¸aÐ\nSà¸3¹Xˆjyj\0Ãá(ŠÀ;¦z—Ë´@/pÒìæfó<å^å-ÇIÚOýqTÃÎ?²+íf±)¹i÷-áß™]ŒªÊ_€‚`Ç§µÏ‰Eï©´]¨È,\rçÒæs;\\YoÏO&\ngï)î„vÖõvýˆ»‡ÌB†PºÁçÃ-Lå)˜ Rg‰{œª„z~½É«ä<ÌR³†]ÏÚSÂ¼LÕ-()j]Äáiˆ_©¤8ƒE¥}¿´a„q.rœú6åš3JàLk“R¿Ó‚”÷3Ã[»{—QáE4Lšg!˜\"¹õÅ~b5 ƒ—Ò]C°õSþ1,yÛæú¶}¦ÛÒø„Ê×¯GÁÌX¯Ü7RÛ~!,(¸;M»W$83†ÇË:ƒ¿`‡!Ä¼0Ü£Ô\nÓ; Á¾ƒpÜ¸®Øã!y…¡ˆr¿Y‚ŸAAm¥gýƒÅoÍ@Ê†f\\Œ·³÷™ÅˆhÄ¦Ò­d…ô_VX¹™1–\r<†Ù¤#óÛÈ÷¬TGÂ=‘.b–ÀÌ0¥ÂgÁ,ó¿h1-­ß¹®sî \'q\"kåñ„zTýÀZg¦ÿ\0”0«mr^âÜ”jWR\0Ad‹RU=~`Ž\n¯þËÃï\'âlªÄ+G¢ô9ÙXp`=´Äáþñ˜]öJËîo/bo©ÿ\0Dâ$…úŸ^û%aeú±‡tÅë\0á†af!Hx ËýÄ\\:yN­ÄŒ–Í÷ÌÎÊh ‰VHÛÚÓ*\r7´KÄ-4Ê[}eõ+FáuJ¬ÑÞ;´wpK¥‡ÍlÁqýÈ™\n´eY³PÚÃNÖ?-ôÊÎø»VwùÆSð(?&bm™ê´óÚWTºîeÃ\rÑÇˆç\nUð›ÃÄ6-YÓÃ3‡€ì¿¬fº}w¼ÀÜùfo©ò+÷¦ïÚVŽd(?¹{þÛª½—yª¡\\<’š`\\1>áAm¥hs{Çâmh\"×ÄnÁ¿–†§žúÂÐ¦a¶Àhs9Ë˜e4ÆL1YÆ ÅÂÚƒœÅ‚…‘\ZH¥~|ÝŸTb.ö\"Ö=bêö¤C#ÞVËˆ¼êV\n:P½qøà\rŠ¾áñ/†\\Ÿ“(íl(h}˜%ÂAš*QV±ÍÑ˜ÝK›ßÓ3Š4ae?©‰Q3\n#®q¥âãÊÎËæã Ë—Ò7lJ\0Ìñ¸U²)Ú¼¼¤45Ã¨Ëº°V¿Ñ)à)ïÎ¾¨å°O`í»žóûéþ¾É·Óõ7{‡S©ê\Zèôz0×G£ˆhêæ~yÿÚ\0\0\0\0\0\0q8TÎ(¹AÓ¥ðÁã’`µ·*#_ü‚–¤¼”ñls¥¤Xü¶EçEö–N9FØþDC0hžarß˜®à˜ØXRýÙádð(±ùÏN¨¬A wzÆtÛÞvÃp¶LÞÞÙÛ%ãn6½1}%àiæ›c(Ãû±]‘P”£p+`ž¡õõßI¼èvAÓRÏŠÏ™WîšÚ¸!‰Y\\tA™ÍÐ».óúŽÉcv„­“…„kÚòÓ]ñ}™¬fé°ÖKàÏó÷\ZYvYz‚0çF²irïà9ZwÓSBÆäw~et2Lº¯]I€ÚDH‰ÿ\0/Æ è½ô‹øƒƒÿ\0ÿÄ\0\'\0\0\0\0\0\0\0\0!1AQa q‘¡±ÁÑáðñÿÚ\0?;×d2:eË—.\\¾n\\²´HdŠˆ;ÅÇg©G˜•7Cu2ê\\¹q–^ Äÿ\0(0*j*1¤AˆìCqi*å”ª%“=w7.\rD\0‘\ndZRÜÜNþ”e† \\¾[3an9¶oàêð+¨Ù¸|D‚>úŠ#ˆ¥­Á—Àà¹rù&’©wÂúÜ¾Kæ¿ý¢¨¶³èø‡._\'&Ó<¹Wìÿ\0p¢RåýLûÀbVp*\\©P åâE/å\Z+žn¾ÿ\0¨BØFÿ\01“oo÷øˆØ§ù‚¹UÚlÄG,ÎláOð]u};õÜ$6>©^Õ³nb0Z¼ÿ\0ÈÖZe‚¶!HETI\\v\'ïÉü@\rnë‹Ï»èw¢ÔÏÎå{LuW§¥éý>\"•S²öF+Ë\nrùiÈM\0Ïl7ì†÷y8úD°UEª”oþú=ASø<=çPøŠÂÄse„µ‚û;„éÔ\0A†V¤‚7H§Jôfož§°Oæ¦<JxÄ¡5néù–z}Üùä>Øó¬:ˆi¹fàæ0ä÷æ…&úÜ8(Ü\ZAUjR:Á® vF\ZÒ£.VÔ÷5õ?®f†W˜‚P˜‰V,q‰š„û’Ž²õé÷!FŸ(B˜DÇ\\V} 8ÐÓ	USz#‰ž€p.0mŠ³(Ç‚1h·rˆ%JeÔ¦¸;ºÇ	ÂGHf;–¸#ê×™n’ƒàFž¥à°Tk˜c;ö”#W«ˆn#¦_Üì­ŠÖž ƒ0\nà€SdFÏz<Kß,f±ýcäM‘c™In9‰ÆˆÃ—†upwÃiÿÄ\0\'\0\0\0\0\0\0\0\0!1AQaqð‘±Á Ñ¡áñÿÚ\0?Þj_¢PB¥J•*T©Q%MÀB…“méÞæzü ÃAlcˆBƒ¸€%‘\"DUD&Ò­ù\"v•.MÝO)ê(¢®Øñ¨ççx€áè€\ZÀ>ÉQÚêWEG÷,BŽ;ÜÃ\\ñ”El\Z•`ùCqòOÁÅÇ÷*WJ„Ë™€¨;ó;•(j` ”´ç×öß	d¤¢‡¡D¨¿ˆc‰A÷¹†ÑÅnó¨âØ3Õ\"Jé}.\\¹q@Ö¯Ò¹óþ ‰1¯}î_¨»;øõÕè’åË—`9ðE<\nú“}†¯Þ_¥Ÿ3¨@Ü¯]†nÐ.Á™Ogõ+]€S½Í§5Òf¬Ìð/0…-YMÍä1+f*±S¸îRòÎ<D}%Â\nÍJ´)4‰¶£<ÀÝÆTÂ#™~~çz…c±åƒc\\zã¤ªl®Ç5Éû;êY&<FÍîh9â\0è:F(ÿ\0¬»<p\Z “»/f?}áŽîûÍŽ@¹×Þy?d¨8¿Ÿˆ6ê^”Pá¯žÕ“hÁx‡é^f@¶$Ù£8•=ûÕÌà=t&qµ¦e–Þe¯ ]KB+„w\0±–¼~)R†7nïÿ\0 9‚ #Á\Z`62í®b§0û[”›\')Ôýÿ\0¹å,¯Á…u5-ÔÁs5±Ÿ?r£5\Zc£mO§ý„VTÀ\ZX$LnfÔÈ1ïéÇJ@Å>”î¢Ýl¾×~ÍÀ0œÃ]Ô¬S–ÀFY”CÀ%Ù˜JZ0È\nU{‹\0°ÐièÖ\\ß\ZŠå÷PEåÄ<FÛxõ\0éfhü1Ø¯·0ŒoÇ!ñ ‰p½¹;yñÓ(éŠêPÒg¶ß´ÕyÏõ¿Ä¿[]À¬yÃ¼ëåò‰LÆ¼~ðñPb¤6“¬¢Ùö&Ÿ>’¤Ô”N `A·FÍèk§ÿÄ\0\'\0\0\0\0\0\0!1AQaq‘¡±ÁÑðáñ ÿÚ\0\0?¨Š…°“vjù—pµW%ÂãæüEí{h9q•ÑgÅGLPp\n?é˜ªT+=A_™U+©¦óz–€Õ^7Tâ±‰R¼ËQç8b5\\J½²«$® ò@##ÍZÅ§÷âmžPwWÃÜ*Ð„´¬¼Á-f‹«³ÐiZìÓ¦,q@`«®}Ï¤mPPx7>“Âxÿ\0‹Ú\0¤¦SÔ©·Séþ¢˜qáWÌ/…ÎQ%J«Õˆ‘Hî\r<F”Ž,ƒesÙg¹i¥™¬/žaóÀÜ©Ä3š¨ß#Ä;ŠO…oÐ#h^ÁfË{î-Uº*)@|±4ÉÕ“\Z8Õouãü4ÅMn±/ÑCHüÁ¼JÕ¸8¨©H›†lDè•…63Wu,í*“A‹RWö)\n¸k³©ž}ËèçdG®s²;óYGÞ_p¬@	J·j³ ]!¨b « Æ]h ˆ”,¡j6ùe%EuPÞ‰Á¡Ixå³;pk0í‡ÀzZg†ªt\Z‹\\¼5Xj¨eM2%‘(É7‡Trð\\C/(XéD>jo‡¦€™¦gÚo;9â*ƒuU,Nì1ÍÔ¯8ãô6Ã\r	žÎ®Ct(gj#ò½˜JDMŒ³n2dõ¼_©Žÿ\0Á45‹¦³*XpLž&“4‡‘Õr[ñÜñx=Ãá\r‰ºT&ë\Z®Šœ=J¡R”5\n}á<Bú§Nz:\r|~sRû’FyŠ+€\nžRû­¾´Q}—]& :öa\'â£sw)CÆüîŠYyÞs,†ëÀ†r-%óZ¬F•òÄK;„VªRÐU€@9nÚ…)ÖùH|w\\Æl±ýTÑ–µd G–Ð‰ÐûV4UØOê„|0”A¤5’Ê•£Ê”\"’»h¢CÍAw,ðš‚¨ê°{‡#]y‹7ÉrÔ†NbéLjy7Í_¾ã£I[ «gßøêzÌìDÎŠ3ßWõ.™@k;È¯­XðüÀ1b\ZAkš\\ú–ÀmØf˜^ÔÅÁ4¤9!§n¢:œ\09h¼r’“ÃŒ\Z\"’°Þ­®%ÿ\0ô}*V×,Å¥RO.å„Y	-ÛÄ‘€ßGw3\rö¬]ÝÆv‘V/q”Ä€<Jºiˆÿ\0p˜-Uä¬(\"76\Z¯4jÐ¼5w‚gàÈ0Ó{>¢(­=CER”ÇB\0\n‰ž<žf±ÆN³|  /V^®gx£s$Çâ×!^BÑ¬Òê2>íg M•ÂÇš`0%©>¸öê…‹´ŒU	æÇAY¥<YãR\r0¹p<2Ã7UÄr‘ió8{4òGMi]ñ€ñáº$±Z¤æµÉõÝqM<Ák¼DÞ¦SÖ-%ˆŽ‘Úš`7„&¶Þ´ƒ$Ðµ\r`7Ä±Z1c£ÖH&=n‰•0ŽTôP¾c‘¥,X\nò\0Ö¼?*sË5¸9áŒBÚ-HÀ\rr@\ná¨€\ZÓÑ•ÊÞqÅÄÆÂì½AÀCÎ^Ð;Ï\"æ.ä®°VöÅ;ê¥ëÔ·âÕrR¿àKmeâŽå3²Û\nçØæýDj©me¨Õ]\roù/Šß&æWØ¬è¼Ò/Ò+\n`¦švµÊÄ¼Ó†ñ•ƒnqD„X‚óBžˆ1ÝH2™r…h¨@Ð&z\0R›»¢Ødm©Zm®¼Ã	â„›õRöKÐ«1â•.éü.ý’Â	w…ra*2œ\"C½`ëgÄÖÌF,X¬F€&@Å¸ËQ¶*_;Š…z¡¦¼Ê\n+¬E	¥Í	«”–)O0vQ².‡{ç0F*ÑR®c×tcZñ+ií¼5i˜Û¨´X·1¶µK·î3j´˜ .UXÃj-q9ÃÖ5Sóßø¥ÑÇ˜48\"wæì—öÇâ2XDxÒ(ÌKìçp‹@UÛÞX–«¬DB:Ñyê!r€\\,^nŽX–+¤U€¹`àÎXáulèj„6Yº›nMx÷w,^#œ @_,Mã\'z–+sŠ;–p²ÁÂ&“¸Á¥9|°¨ôBfâe¸\'(¡¹cš¢\"[XI›ª†ø!–F¦¾}Ku‚“,Ã¥Ûz3_r–`—ˆ…hÔÌµãÞ’\r62¨Ðh(bõ¼žÑB¿†[<HP†š³ˆ_¹Øe³`®T{…mÞê9‹ggUákYxêÂs35æ+Â9ê=0¢µz	J“À\'¬‰¯]ØwWF7©‹Oª–åxÑ(ÍTE/œGJ·¿\nÃ¬™½ÏGÌ`£Ã F:\rÅÔ@- Œ6HK˜œ—Wy3\rËÜ2·k ,l®à°µÛÛUG$\"n€°17Õ¤–ºª*²óZQw3êJÍbh­ó,ÝÖcã,NŠÕÒ¸læ%Þ\\ÇdNxÜx/ÍÂ|h,ù!€@åpÖ%‹YÔ¡lB#gæ<©®Òt(äLZ%¸%oÅL¿ÀåøŽ…\rðÞ™~p3‰yÊ<m0-²¡\r¸\Zî–õPikåEAAAOmoU|ó›ª¡ÝãRÕËh…À(mf}G‡ˆ/uWIë<1)4<JÓQ0FÖ2—D%-¨f^@ÍªÔ8TÍÔ´ue¥µÄ2ÍÔzõpÏÔ\"Ufã™IG=Ç0,õ(…´$dÀ¶Ö¥ *86(Ýˆ…æ¡ÝŠ,e[E©È	š!1Šë¯‰[9ñÀÁHV¶Ä+*pÕo9jÄÀ²“\\\\­”5Îw§‘ªfFnØÅb¹˜8Æ\\ÊÔ3\\Ì0HÖú?«Ç‚a<¼E¼k~å‚Å5¸œÑów)÷)Nq×qSF¾â¯=Bž¥ªŒq©sÊ0±Ã•X<[ƒ*­ÌÃWk›ÏêJ:0AØ¡¬CxV½,ª€mj‚5u/BÔ¼¼yŸ¸ìu­RZtXÓÜ©iWÛnc‘u\nZVH÷G	aPSFV\rZÊ†öh¨Ö<@V`˜º§PÜ=C×{üC¶\'¬Îf™”d{ÄßÕãÌJJñ49c¸>Ì±ÏÌ1ÃµÔ_o\0Çó[Ø<`\0êT@°@éAë¨ú`@ìV¾F.tˆÙ§äD[‰Ç” ‡’ðr\rD‘š#•2_&\0ø\n§œòPùÉHô*tšj:_QX\nT>y—új³×PÆ›Ö óUÆóViŽ˜¹B×QZ¢žâ´ÚÌÏFe‡ƒÅeŽJ”Þb[ºªø‹ÜÞ®§ƒæRY‰hõîRóZ±w[Ç‰bµ,ïc˜í]ÊÖ\\Ü¸‡(®+²4òÛjCÞR<£­\"iÅ…:ß¨ÒÙpµWVíX-±+å‡C‹ËGÌ¼+¾c~Ñ[Æ.õC|Æ¤Öu™cùŠµj ®	ÏÜ\n»Ž·)LcŒA\\GY˜Žug›e1\\.¥5\\BL°VsâZ˜Áâaõ¡¤_œbSš[rz\n—ì=À×MtQ-m¼Vœæ®.„÷eŸ’5PÈ.›zŠ~¨( «ÁôÈë“GÀÈò1‹SZ’‚œØÕ»5ÕÉlùŠQbÞGá_ÄµÅ¡ã!5vyˆÚØQ6—_¹{2(pÐQ¸\nµ|ZYóþ¡oEÿ\0=•’éÜÃAˆ²ÕeÄZR¾¥ïG¸SÆ1éJÇúŒ\r˜×Á1ÁÊihÃ¯<ÙÄ¥ë-[Ÿ¹E`r9„]œ*œ–.NB®ê.[q•hÅ¬t˜Ãê„Nò°*ê0  XäÐxÁâClû›€”Ó‡µn-£CfÁYþ¨Œ\\JÂ*cæ9lz›Á™ÜRØC­|Cí9˜d¦óû$<€è³õªÅ»ÜÅ	ì€xÏ3åD:.ã\r\"#w\n«¾ƒÚK	ðÀ-¼(°&Æù²ŸÉn\\Ë	jgò«®nækp¹§›]mÌl.­2\'K\\)šèM(ÂæW¹D©˜¦|°˜…Õ¡ëñž;^Òœîþ£XÛ€U··ç¸rÁ\'”ýÃšéz™eëdÉvÜ¡ª‰•w8¸÷1tÔT•x	õÝMQÐ=ÊàY’sYÒ@îË2¹jãZ\0f÷ÿ\0³6$*¾„ÒpÅVnâÕãêP@9ŠñÓÈðÇðú­¼W”	†*5Ü¼Û¤\'ŒÞÃy<^%‘LŽ5áw«Õ˜ó+/LñVY@çm¼f\Z/ŠH>Z¿ˆ˜S ý þcˆ€{8N_Ä·\\\"É£`”8q†{…êÁTž¶|Eâ66,ìÐ7ÍÝfe“.în¹þðcŒX9øvu|1ðéLh¤Êt¸FdDÌ~£¸¢ Ê¦BÙ`@äèR×]ùŒjð€ÊMlÅªÅ¥Þ¨¹Gû\\v\n”\Z«Ì@†³¸æîâ¡vŠD«;>¢Øqâ\n¨à(WŽw4ÅRéó¨º›˜¥®ª+”T¹W´²Æ9”ÒG·â.‰5ÚÁ;â\rØ°§á}ïSŠR€çç¨Ò\0T4·<K0©pL»ähã-°\nÀëlë”WÓˆ{X]ºõ6âš\n1UÔÓ>¡aà»>\\.Aï]¥2» ß‡uESy0û|ò_‰Bmf1Æ¥YžK>ÿ\0’QcyŽ¥ùy}‰l­\n}!aÝ/ˆ¤m4láÈ<ËŽ¬SçÜ¶#\r‹¹zM­¾æÏ¾ Íu0XÔj\r’‹îvÞXAúflGaZ¡mWDfQŒÀï’ö|D4:n<0%¯kªù1F–+‰•ûHSN-¼úØUµ—µ{‹©”%ÔÃ)av5ôFµï‰ªa%)IJ¸¾G2‚ùezÙ–M®ÕË€y…¿eÉ‹BÍqýaöÄ®ðô0<]ñ\0x!n‡ž^W•`—™kDö p·‚ˆ¢¥LÁwÌ\n¹ º‰bB•×˜D7ëd·Û-@Uà*„ê®éÁ®XSA£Ðù9IuPx÷ârƒðŸïõ…9ß¼Ì½Ñ¥û\Z!Â!èüDšëñ\rùáÙ\\l2l\Z1÷4ãÿ\0§û¨¹48²*ÊÐìçÏg8‚€\0 Ø“º$¬úYìŽŠâu331ÊegÌ¶­ù—s;…¨¬Pz5Þƒ2—vq©õ¾`¶gqð¤5žIïgÅC†Šâüú%p³v÷È]ƒóZ\0ùbp{…†Èó6£ØJiW¶¥Ý_0ó’h¦R¶¬ÜÝ¨\r0y^W’‚®oZ]°­¾?Ô¸¤{¿ñp¯i„ðõßÌvÖê>P¸‘C2ÂÖÙ®Ú‹X·¨«¥WÃR¦Åâ\nh9sÃÔ­QjÎÒ[¸#‰vB\\¹†Qº3¯µ@\\PÜ\\÷êú8è ÙÓx7-–AÜ0êL]ãã\0›‹¾ .	yŽþB\\_¦v¥ÑŸÃŸÔI6¾vy–M´¥[¿2„\nñ.žÂi8c¶ä7Ê(#Y§5ª°}+ù\0O$\r§A,Oˆ”ÔK5wªŽCqŒ¿(•ìŒ²\ZŒ)y4À|¦ë+í\ZÖ¢—>d.õåÜQ¾\0(<Ê¸ªù”7Œª‹ŒãŒÄ˜\"yÔ²pÊ\\À5\r*PÙÛçq¨Eö792Tn`i˜à\\SPe9	f¢^.g”Y ±VÌ£qM`¦^˜\"‘]šP3æ×èž ™9 Uó4†ýE8xMåèl±ÐË¡_ Ãj»êp—l¥ŒûáôûÀR\n\roÿ\0R‚ÄØµ¼rå‚òK—Ì8iéâ$(±¼•;—Zç{Š°TæÐ€½ç-A+Ý–ˆÂé ¿Sv\rŠ_jC„ÚÖ«£ÌÕuMó­eº…+ÂèÔ\"Xž^kñÂ¼°•—Ö™X\Z± ¾\"£Cjåc#n‹-š¸…½ž!bÃÔEËÓT~jl“\Z+øBwU“7·žåP•\\œGL‹ÔÀ°8m‰‚†—qSÉ\\Bî(É–.Î,Û6Ä\Zjá5ž\n.i²ƒÜ®|Ru./cˆ†9õ!Ð˜ë-þ2W\\~!›£rÖsÞ5gpµ6¶ò¥ñ^IˆÑ}ÌWK:Ì*Kû•Û˜(Ú™B‹}LÝ5‡>M06õpÀ–Ø\n¨×]ÁfŠÔ¢&}À€¬@*\rs}ÊÇ7Ë-8ª\n`äöãq\Z¶_<GDÙâ3óDúfGÔûlXÆ¢aÆá¾ŒšqP®™uh;ÄDi}Ä&Ax0·ÌÀm\nX»`\Zn¤GKÜ=*æò‚]uu¨\0N$:µ.¹a˜ŒÖKå6_p¬äa\Z¾H6rw\0¨[n»„µø–\n\0ÛÈ×´—³“á@Æ¦aÄJÏèù—®Nu¨ÖØ÷ÜLV‘ãp}(º¡¡6ue\nÍ°¨‘ç‰g§ðòVìæã9øf¡˜TSZ[Ä´9ó4,š¹p«ò\\È.,Â©­	Ž h®…Åj±ñ‚ÓOì¥-¡vë1à)q8‹õ\0,¼Šæ¸}KíÉï´Û ¶ñ@ŒW/û2Í[]JrÂ;8`².{Ž³wÃ™@\0ö¥Â\nÅ½ø˜ðž#¸gÎ\'HPÓÃYüÄ^0F?P-mEc¤¥\'ÔDÁ} (ñ¶,ÙšblL1 (¾s)=À#¨vÖ‰A^6~&EVGp+EÄ¿£‰®ºÃ¾\"¼}˜iQ\0%|M+Ô½F¯ì†f¼4ÆŽh¿­Ã°µ¢]‹ÜÁ(òÉ3:—m9?lÎZ©AËë1DÈL9KùƒT¸#\\#å€Zog× z„[·8‡4-Ò°Î¹ÐU@µ¯£©cjìi.‚Ê+÷	 KVÇ³Äuª§/ú‚<ˆEJ¹p5\'Œ_ ¯Ì6i½Dtßµ‹À¾“<¢¾ê]V\r…UÑ\ZË¬ÑÊC™hVÀµx¹HdÙ»¶µuWâW`l÷ýšœ\Záðãæ\rIóÙã¸€àÌÍJHé¢£ˆóÌ0†Ù`‚ûgêY;! Q|¬=Aábp\\ÀPåª}A×h/€Ë	Ì$P\ZùÞbnìÁ\rÉuæác÷ÝˆÂ—lÏËIÏÉQÜ­†.üKÒ•³ÎùÔiÌ‚…I“¨0TEP^æ£7 yÑÕÅèb˜èM‹£Dº7ûÂkŽ\rt»Æaê<TXðëÑ„#¢ùóE¿9o‚\0GÙŠ2Kpû\"_6JËˆ[`õp‡Ü[6”·kUê:qÔ=³Š\0¾î[ä\'ö: ò+¯Ûâ6õƒT±yÅ×rŸ~l\\°^É¤µ›Ê\0q±Š…VADu.Z¥Ž‘PÙŠ¶Ãñ¥e4\ZÏS*ÄI`/•¢*žSƒP{ePww|uÿ\0°¨Î¢l¬½Óƒæ&³Š·MþßÁÁ©aŒ³ƒQð`-õ3+n\"B+´8—0€Ö/HgÎ}DÄ:ZnVzc(\\…–·qŠSH2Gkˆn®.¦W-ÀüËŒ*)¶yŠnZfåŠh˜wV”K–â\rÕî(º¯PÔbÀºeÇÜ4³H²9üBZœJ¹{06	®~ŠÚa€\n- b·*òVýÌ·bVì!pÅš”´™ˆæ£¥xKJÍzæÇh±oˆ…ÃV6ÿ\0¸6³ÄðU\\¦måu*òN…ÁL‰`ë·¢iMÄçþÇ3w¤‡\0hŠEÀÆ(	Íd¸%75áô \ZŒ(Ý€5xÔ¼Ñª•YIn.&ÃÆPîWM4™Éõ0gÌUÃ¸A<é=8*…W¨ËÇE).kŠÙ!+!y-â\nKî×¤£Þ_1Y ]AÓÖFYÊ€Ìgg÷gâZÆÊš¯|áŠh­B­Pp”×ö9\0zïÄL”¬E0ó@\nç7,êVÌK*€´âs+ÇoW—ê\0ÆËY!Û€÷Rñ%E,rŽÃèó´ÛÂVžŽˆÑA”šjñ”7DÈDy\Zë@ÓeÓ˜ê2Œp­¨cÃ€C\'¸F@a¨Ë¦2¬Wñ.+‰Û@úLw¬£MÚúÆrü„J…Ç[ £K÷.õˆ£6[Š§¯>á½‰‚àfÄ¬ºç‡­\0Y\nðreŽ¢žÐoÈ±‡ÃþÌü6K»ÑÅbŸ»‰ŒÓ§ÈjRÐþGñ0ƒðÿ\09Á÷—âj	äS•åø	ÁÞÁ\'º-ø\"¥#eÿ\0Ýò`V’Ö¸ÓP‡mV…˜7d8ÒBˆj’Ä*Yp§ÚâÉ²\n\n³ì­#@¸VÂ×7PáÒ¢¥©«º½î*`E|@â˜Ýƒ–ÜuÝÀž–ˆ+b_Ü£hå\\ún%Ú à©r0íŠVÐ(4^uæd”N‹ax¾êa—,Ó¦TPÜYt?qõRŒr¢œã÷EÁ©ØÊü2®K­žuwÔ-Ml\'ñ%öKw¾æa½q(îh[(²ÏP›	¶W»øy¨˜Pƒ!1üÆ\\V;\ZµQàÃíË‰mgS	!9\n\ZÚ;¸0Ò†3‹Qsß1,\\r`>m\'¦îâ×V#½F}_Q	‘4äù¾â[!\n¹†Eeqms§}5Yl\\ãÄÏØ¯¨N\rÕ_ò÷1¬Ãr‚t°BÆŠ-ÑÔ´2ˆiÅEßê&|–}2šàmàÁsU-Ü°n(\\KÒ®›^Éj»ÎªãZÿ\0p„¬8a±çÕfò¨Šï“-µj«&îZ·‚‰yeA¤ÍOÎ~æžÈÏÜ~K÷6}Cqšÿ\0¦ŸãÝÿ\0sðäÿ\0ðh†™·ø±ÿ\0_pßÜÑÿÙ',2,2);

/*Table structure for table `prestamo_cab` */

DROP TABLE IF EXISTS `prestamo_cab`;

CREATE TABLE `prestamo_cab` (
  `presc_numero` int(11) NOT NULL AUTO_INCREMENT,
  `pre_fecha` datetime NOT NULL,
  `pre_fechadev` datetime DEFAULT NULL,
  `presc_usu_codigo` int(11) DEFAULT NULL,
  PRIMARY KEY (`presc_numero`),
  KEY `presc_usu_codigo` (`presc_usu_codigo`),
  CONSTRAINT `prestamo_cab_ibfk_1` FOREIGN KEY (`presc_usu_codigo`) REFERENCES `usuarios` (`usu_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

/*Data for the table `prestamo_cab` */

/*Table structure for table `prestamos_detalles` */

DROP TABLE IF EXISTS `prestamos_detalles`;

CREATE TABLE `prestamos_detalles` (
  `presd_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `prest_codigonum` int(11) DEFAULT NULL,
  `presd_arti` varchar(100) DEFAULT NULL,
  `presd_cantidad` int(11) DEFAULT NULL,
  `presd_libros_codigo` int(11) DEFAULT NULL,
  PRIMARY KEY (`presd_codigo`),
  KEY `prest_codigonum` (`prest_codigonum`),
  KEY `presd_libros_codigo` (`presd_libros_codigo`),
  CONSTRAINT `prestamos_detalles_ibfk_1` FOREIGN KEY (`prest_codigonum`) REFERENCES `prestamo_cab` (`presc_numero`),
  CONSTRAINT `prestamos_detalles_ibfk_2` FOREIGN KEY (`presd_libros_codigo`) REFERENCES `libros` (`lib_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

/*Data for the table `prestamos_detalles` */

/*Table structure for table `reserva_cab` */

DROP TABLE IF EXISTS `reserva_cab`;

CREATE TABLE `reserva_cab` (
  `res_numero` int(11) NOT NULL AUTO_INCREMENT,
  `res_fecha` datetime NOT NULL,
  `res_fechadev` datetime DEFAULT NULL,
  `res_usu_codigo` int(11) DEFAULT NULL,
  PRIMARY KEY (`res_numero`),
  KEY `res_usu_codigo` (`res_usu_codigo`),
  CONSTRAINT `reserva_cab_ibfk_1` FOREIGN KEY (`res_usu_codigo`) REFERENCES `usuarios` (`usu_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

/*Data for the table `reserva_cab` */

/*Table structure for table `reserva_det` */

DROP TABLE IF EXISTS `reserva_det`;

CREATE TABLE `reserva_det` (
  `res_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `res_codigo_num` int(11) DEFAULT NULL,
  `res_lib_codigo` int(11) DEFAULT NULL,
  `res_articulos` int(11) DEFAULT NULL,
  `res_cantidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`res_codigo`),
  KEY `res_codigo_num` (`res_codigo_num`),
  KEY `res_lib_codigo` (`res_lib_codigo`),
  CONSTRAINT `reserva_det_ibfk_1` FOREIGN KEY (`res_codigo_num`) REFERENCES `reserva_cab` (`res_numero`),
  CONSTRAINT `reserva_det_ibfk_2` FOREIGN KEY (`res_lib_codigo`) REFERENCES `libros` (`lib_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

/*Data for the table `reserva_det` */

/*Table structure for table `stock` */

DROP TABLE IF EXISTS `stock`;

CREATE TABLE `stock` (
  `stock_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `stock_cant` int(11) DEFAULT NULL,
  `stck_art_codigo` int(11) DEFAULT NULL,
  PRIMARY KEY (`stock_codigo`),
  KEY `stck_art_codigo` (`stck_art_codigo`),
  CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`stck_art_codigo`) REFERENCES `libros` (`lib_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

/*Data for the table `stock` */

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `usu_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `usu_nombre` varchar(100) NOT NULL,
  `usu_apellido` varchar(100) NOT NULL,
  `usu_correo` varchar(100) NOT NULL,
  `usu_telefono` varchar(15) DEFAULT NULL,
  `usu_modalidad` varchar(50) DEFAULT NULL,
  `usu_curso` int(11) DEFAULT NULL,
  `usu_cedula` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`usu_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

/*Data for the table `usuarios` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
