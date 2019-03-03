-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 02, 2019 at 12:44 PM
-- Server version: 5.6.39-cll-lve
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `themoovapp_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `bank_details`
--

CREATE TABLE `bank_details` (
  `bd_id` int(11) NOT NULL,
  `bd_user_id` int(11) NOT NULL,
  `bd_bank_code` varchar(50) DEFAULT NULL,
  `bd_bank_name` varchar(255) DEFAULT NULL,
  `bd_account_number` varchar(20) DEFAULT NULL,
  `bd_account_name` varchar(255) DEFAULT NULL,
  `bd_last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `institution_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bank_details`
--

INSERT INTO `bank_details` (`bd_id`, `bd_user_id`, `bd_bank_code`, `bd_bank_name`, `bd_account_number`, `bd_account_name`, `bd_last_updated`, `institution_id`) VALUES
(1, 25, '221', 'Stanbic IBTC Bank', '0027271600', 'SYMPLE INNOVATIONS COMPANY LTD', '2018-09-25 05:04:32', NULL),
(2, 26, '035A', 'ALAT by WEMA', '', '', '2018-09-25 09:03:19', NULL),
(3, 27, '044', 'abcd', '1234567890', 'nansajnsj', '2018-09-25 11:56:22', NULL),
(4, 28, '221', 'Stanbic IBTC Bank', '0027271600', 'SYMPLE INNOVATIONS COMPANY LTD', '2018-09-25 13:22:39', NULL),
(5, 41, NULL, NULL, NULL, NULL, '2018-09-26 12:07:02', NULL),
(6, 42, NULL, NULL, NULL, NULL, '2018-09-26 12:08:09', NULL),
(7, 45, '232', 'Sterling Bank', '', '', '2018-09-26 14:48:41', NULL),
(8, 49, '232', 'Sterling Bank', '0060912825', 'CHINEDU PAUL OFOR', '2018-09-26 15:21:49', NULL),
(9, 50, '221', 'Stanbic IBTC Bank', '', '', '2018-09-27 04:27:49', NULL),
(10, 51, '221', 'Stanbic IBTC Bank', '', '', '2018-09-27 06:32:35', NULL),
(11, 52, '221', 'Stanbic IBTC Bank', '0027271600', 'SYMPLE INNOVATIONS COMPANY LTD', '2018-09-27 08:21:12', NULL),
(12, 54, '221', 'Stanbic IBTC Bank', '0027271600', 'SYMPLE INNOVATIONS COMPANY LTD', '2018-09-27 13:42:17', NULL),
(13, 55, '221', 'Stanbic IBTC Bank', '0027271600', 'SYMPLE INNOVATIONS COMPANY LTD', '2018-09-27 13:55:22', NULL),
(14, 56, '221', 'Stanbic IBTC Bank', '0027271600', 'SYMPLE INNOVATIONS COMPANY LTD', '2018-09-27 14:09:36', NULL),
(15, 57, '221', 'Stanbic IBTC Bank', '0027271600', 'SYMPLE INNOVATIONS COMPANY LTD', '2018-09-27 14:42:08', NULL),
(16, 58, '232', 'Sterling Bank', '0060912825', 'CHINEDU PAUL OFOR', '2018-09-27 14:48:48', NULL),
(17, 59, '221', 'Stanbic IBTC Bank', '0027271600', 'SYMPLE INNOVATIONS COMPANY LTD', '2018-09-28 04:41:26', NULL),
(18, 60, '221', 'Stanbic IBTC Bank', '0027271600', 'SYMPLE INNOVATIONS COMPANY LTD', '2018-09-28 08:19:01', NULL),
(19, 61, '011', 'First Bank of Nigeria', '3064812288', 'OWONIKOKO OLUWASEUN SHERIFAT', '2018-09-28 08:25:46', NULL),
(20, 62, '221', 'Stanbic IBTC Bank', '0027271600', 'SYMPLE INNOVATIONS COMPANY LTD', '2018-09-28 10:14:26', NULL),
(21, 63, NULL, NULL, NULL, NULL, '2018-10-01 04:42:59', NULL),
(22, 64, '221', 'Stanbic IBTC Bank', '0027271600', 'SYMPLE INNOVATIONS COMPANY LTD', '2018-10-03 13:16:30', NULL),
(23, 65, '044', 'abcd', '1234567890', 'nansajnsj', '2018-10-03 13:18:52', NULL),
(24, 66, '044', 'abcd', '1234567890', 'nansajnsj', '2018-10-03 13:33:43', NULL),
(25, 67, NULL, NULL, NULL, NULL, '2018-10-04 13:15:04', NULL),
(26, 68, NULL, NULL, NULL, NULL, '2018-10-04 13:37:21', NULL),
(27, 69, NULL, NULL, NULL, NULL, '2018-10-05 09:22:29', NULL),
(28, 70, NULL, NULL, NULL, NULL, '2018-10-05 10:14:29', NULL),
(29, 71, NULL, NULL, NULL, NULL, '2018-10-09 04:09:25', NULL),
(30, 72, NULL, NULL, NULL, NULL, '2018-10-09 13:26:43', NULL),
(31, 73, NULL, NULL, NULL, NULL, '2018-10-09 13:40:05', NULL),
(32, 74, NULL, NULL, NULL, NULL, '2018-10-09 21:33:14', NULL),
(33, 75, NULL, NULL, NULL, NULL, '2018-10-12 19:51:38', NULL),
(34, 76, '058', 'Guaranty Trust Bank', '0136965300', 'EVBOGBAI, KING SOLOMON', '2018-10-13 13:36:43', NULL),
(35, 77, '044', 'Access Bank', '782882882828', 'Ezeoke Samuel', '2018-10-14 17:57:27', NULL),
(36, 78, NULL, NULL, NULL, NULL, '2018-10-20 07:57:34', NULL),
(37, 79, NULL, NULL, NULL, NULL, '2018-10-21 13:11:07', NULL),
(38, 159, NULL, NULL, NULL, NULL, '2019-01-10 15:05:26', NULL),
(39, 160, NULL, NULL, NULL, NULL, '2019-01-10 15:49:23', NULL),
(40, 162, NULL, NULL, NULL, NULL, '2019-01-11 14:47:17', NULL),
(41, 163, NULL, NULL, NULL, NULL, '2019-01-14 11:07:26', NULL),
(42, 164, NULL, NULL, NULL, NULL, '2019-01-16 09:34:01', NULL),
(43, 165, NULL, NULL, NULL, NULL, '2019-01-21 00:10:42', NULL),
(44, 166, '058', 'Guaranty Trust Bank', '0136965300', 'EVBOGBAI, KING SOLOMON', '2018-10-13 13:36:43', NULL),
(45, 174, NULL, NULL, NULL, NULL, '2019-01-29 19:36:49', NULL),
(46, 175, NULL, NULL, NULL, NULL, '2019-01-31 10:47:19', NULL),
(47, 176, NULL, NULL, NULL, NULL, '2019-02-09 14:35:18', NULL),
(48, 177, NULL, NULL, NULL, NULL, '2019-02-09 14:39:58', NULL),
(49, 178, NULL, NULL, NULL, NULL, '2019-02-10 01:48:23', NULL),
(50, 179, NULL, NULL, NULL, NULL, '2019-02-12 10:18:17', NULL),
(51, 0, '058', 'Guaranty Trust Bank', '0211391550', 'Alagbe Israel A', '2019-02-14 12:40:07', 1),
(52, 180, NULL, NULL, NULL, NULL, '2019-02-16 04:51:16', NULL),
(53, 185, NULL, NULL, NULL, NULL, '2019-02-21 20:03:51', NULL),
(54, 186, NULL, NULL, NULL, NULL, '2019-02-21 20:06:52', NULL),
(55, 187, NULL, NULL, NULL, NULL, '2019-02-22 15:07:29', NULL),
(56, 189, NULL, NULL, NULL, NULL, '2019-02-24 18:15:37', NULL),
(57, 190, NULL, NULL, NULL, NULL, '2019-02-25 18:49:17', NULL),
(58, 191, NULL, NULL, NULL, NULL, '2019-02-26 13:57:37', NULL),
(59, 192, NULL, NULL, NULL, NULL, '2019-02-26 16:57:07', NULL),
(60, 193, NULL, NULL, NULL, NULL, '2019-02-26 21:54:39', NULL),
(61, 194, NULL, NULL, NULL, NULL, '2019-02-26 23:46:29', NULL),
(62, 195, NULL, NULL, NULL, NULL, '2019-02-27 00:03:30', NULL),
(63, 196, NULL, NULL, NULL, NULL, '2019-02-27 01:05:38', NULL),
(64, 197, NULL, NULL, NULL, NULL, '2019-02-27 10:35:54', NULL),
(65, 198, NULL, NULL, NULL, NULL, '2019-02-27 15:18:06', NULL),
(66, 199, NULL, NULL, NULL, NULL, '2019-02-27 22:24:21', NULL),
(67, 200, NULL, NULL, NULL, NULL, '2019-02-28 12:20:01', NULL),
(68, 201, NULL, NULL, NULL, NULL, '2019-02-28 13:25:20', NULL),
(69, 202, NULL, NULL, NULL, NULL, '2019-03-01 14:36:18', NULL),
(70, 203, NULL, NULL, NULL, NULL, '2019-03-01 17:24:08', NULL),
(71, 204, NULL, NULL, NULL, NULL, '2019-03-02 08:44:05', NULL),
(72, 205, NULL, NULL, NULL, NULL, '2019-03-02 10:27:04', NULL),
(73, 206, NULL, NULL, NULL, NULL, '2019-03-02 10:28:31', NULL),
(74, 207, NULL, NULL, NULL, NULL, '2019-03-02 10:29:38', NULL),
(75, 208, NULL, NULL, NULL, NULL, '2019-03-02 12:31:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cab_rides`
--

CREATE TABLE `cab_rides` (
  `cr_id` int(11) NOT NULL,
  `cr_trip_id` int(11) DEFAULT NULL,
  `cr_user_id` int(11) DEFAULT NULL,
  `cr_booked_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cr_ride_start_time` timestamp NULL DEFAULT NULL,
  `cr_ride_end_time` timestamp NULL DEFAULT NULL,
  `cr_start_lat` varchar(255) DEFAULT NULL,
  `cr_start_long` varchar(50) DEFAULT NULL,
  `cr_stop_lat` varchar(255) DEFAULT NULL,
  `cr_stop_long` varchar(50) DEFAULT NULL,
  `cr_no_passengers` int(11) DEFAULT NULL,
  `cr_amount` varchar(50) DEFAULT NULL,
  `cr_cab_ride_status` varchar(70) DEFAULT NULL,
  `cr_start_name` varchar(255) DEFAULT NULL,
  `cr_stop_name` varchar(255) DEFAULT NULL,
  `cr_polyline` text NOT NULL,
  `cr_all_locations` longtext NOT NULL,
  `cr_payment_status` varchar(50) DEFAULT 'unpaid',
  `cr_payement_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cab_rides`
--

INSERT INTO `cab_rides` (`cr_id`, `cr_trip_id`, `cr_user_id`, `cr_booked_on`, `cr_ride_start_time`, `cr_ride_end_time`, `cr_start_lat`, `cr_start_long`, `cr_stop_lat`, `cr_stop_long`, `cr_no_passengers`, `cr_amount`, `cr_cab_ride_status`, `cr_start_name`, `cr_stop_name`, `cr_polyline`, `cr_all_locations`, `cr_payment_status`, `cr_payement_time`) VALUES
(252, 181, 159, '2019-01-25 13:59:49', '2019-01-25 21:59:06', '2019-01-25 21:59:49', '6.5943216', '3.3377708', '6.5943216', '3.3377708', 1, '241.2', 'cancelled', 'Workbay, Lagos, Nigeria', 'Ikeja City Mall, Obafemi Awolowo Way, Ikeja, Nigeria', 'e}fg@ixjSM@C?C?A?A?AAAAA?ACAA?ECEAOAMGeA??Eq@E}@A[?W??AMy@G]@YBWB]FoBJ??Cg@C_@C[Io@EQEQCMIUM]Uc@Yc@yA_C??BE@ABC@A?C@A@C?C@A?CACAE?CACAECCACACAAC?AAA?A?A?C?A?A?A?GKEGEIa@w@Ua@MSMSc@i@e@k@c@a@g@_@y@g@q@YQGYKSG_AUGAwAc@c@MeA[e@O[I]IOESESIeA]c@M_@OYKi@YWQm@a@USMI}@w@{AwAsAuAGEcF}EIGGGmBqBoB{Bq@u@k@aA??@A?A@A?A?A@A?A@A?K?CACAE?CCCACCAIIUE{@y@]]aA}Bo@sAeAmB}@qA}@gAe@e@kAq@]Uc@Yc@Wo@[_@QgJkEwAy@gAo@YSQM_Au@qAoAcAgAc@g@W[m@o@W_@EGWc@??@G@K?EAGEIi@iAo@}AHYNMLILQLAH?DH??CD??`@d@FHLNNVRZ??n@i@??PXPVRXNN@@?@?@?@KH??LN', '', 'paid', '2019-01-25 21:59:21'),
(253, 182, 159, '2019-01-25 14:13:28', '2019-01-25 22:13:16', '2019-01-25 22:13:28', '6.4343087', '3.4909605', '6.4280555999999995', '3.4219443999999997', 1, '581.8', 'cancelled', 'Lagos-Epe Express Road, Lagos, Nigeria', 'Victoria Island, Lagos, Nigeria', 'mugf@oyhTJdAT|CV|CHdARzCr@xI@XBVXfDNfBf@tHHbAB\\Dh@B^Fb@J|@j@pHVdDfCb\\HdAzBpYPzB?N?H?FAFAHEN??EDCDCBAFCBAL?J?L?N@NJhAD^BN@HFHBFFDBBFBDBDFBBBFBHBNL|AZrDVzCf@pGNhBLjBDdA@V?\\AX?TCPAREZEZIh@I^M^K\\M\\Sb@Ub@KPKLa@f@ONEFGFSPc@^{FxEuDzCa@\\_@\\[XURk@p@yAxASTkCrCIHKHIHMH??CAAAC?CAC?C?C@C@E@EBEBCDCBCDCBADABAB?B?B@B?B@B@BWd@MNIJML[ZuB~BY\\SXQVIRQ`@I\\I`@CPCRA`@@b@@V@TDPBPBNDLDLHRN`@Zr@b@~@\\t@b@bATj@HRHXHVNp@RpAXrBp@tETfBXbBbAbFPdAJ~@Bb@@X?t@Aj@Ep@E`@EXOt@Ql@O`@oC~F{AvCcDfFIPEH]r@}CrH_AtBIPS\\A@e@p@a@j@W\\[^m@t@SZQZEJKVIRGNABGVGXANABAPAXAT@d@@^@RBZFX^bBLn@Lh@Hb@\\rATbALr@Hr@Hp@Jz@BTBZB^@`@Df@Dl@DdAFlBB|@@VD^F`BDx@Bb@@NBXDf@D\\BN@HPbA^zBNh@`@tA\\dA|@hCp@nB??HTTM`@Q`@O^QVSTWRYNQFIFINId@MbAPpAL|@HbBFbA@fDCdPGhF?L?~BA??BjCAfAAh@Ef@I~@E`@Ij@ShA??PBRuAJo@??\\?b@@r@?v@?', '', 'unpaid', NULL),
(254, 183, 159, '2019-01-25 14:16:20', '2019-01-25 22:16:14', '2019-01-25 22:16:20', '6.4343087', '3.4909605', '6.4280555999999995', '3.4219443999999997', 1, '581.8', 'cancelled', 'Lagos-Epe Express Road, Lagos, Nigeria', 'Victoria Island, Lagos, Nigeria', 'mugf@oyhTJdAT|CV|CHdARzCr@xI@XBVXfDNfBf@tHHbAB\\Dh@B^Fb@J|@j@pHVdDfCb\\HdAzBpYPzB?N?H?FAFAHEN??EDCDCBAFCBAL?J?L?N@NJhAD^BN@HFHBFFDBBFBDBDFBBBFBHBNL|AZrDVzCf@pGNhBLjBDdA@V?\\AX?TCPAREZEZIh@I^M^K\\M\\Sb@Ub@KPKLa@f@ONEFGFSPc@^{FxEuDzCa@\\_@\\[XURk@p@yAxASTkCrCIHKHIHMH??CAAAC?CAC?C?C@C@E@EBEBCDCBCDCBADABAB?B?B@B?B@B@BWd@MNIJML[ZuB~BY\\SXQVIRQ`@I\\I`@CPCRA`@@b@@V@TDPBPBNDLDLHRN`@Zr@b@~@\\t@b@bATj@HRHXHVNp@RpAXrBp@tETfBXbBbAbFPdAJ~@Bb@@X?t@Aj@Ep@E`@EXOt@Ql@O`@oC~F{AvCcDfFIPEH]r@}CrH_AtBIPS\\A@e@p@a@j@W\\[^m@t@SZQZEJKVIRGNABGVGXANABAPAXAT@d@@^@RBZFX^bBLn@Lh@Hb@\\rATbALr@Hr@Hp@Jz@BTBZB^@`@Df@Dl@DdAFlBB|@@VD^F`BDx@Bb@@NBXDf@D\\BN@HPbA^zBNh@`@tA\\dA|@hCp@nB??HTTM`@Q`@O^QVSTWRYNQFIFINId@MbAPpAL|@HbBFbA@fDCdPGhF?L?~BA??BjCAfAAh@Ef@I~@E`@Ij@ShA??PBRuAJo@??\\?b@@r@?v@?', '', 'unpaid', NULL),
(255, 184, 159, '2019-01-25 14:18:56', '2019-01-25 22:18:52', '2019-01-25 22:18:56', '6.6166009', '3.3492211999999997', '6.6211078', '3.3609343000000003', 1, '339.5', 'cancelled', '2a, Ikeja, Lagos', 'Alausa, Ojodu, Nigeria', 'gikg@kdmSMFe@\\UPgB`AOH_C`B??rAzBlA~B??o@^UNKHEBCBCFCHAJ@LNbA??aCTSFc@PgBdASNWPy@l@o@`@E@C@E?A?CAAACAEIKSs@}Ba@gA??u@NcAVcE|A}PtF??]cASk@oHcU}AkE??FApM}Bf@KXGFADCBABCDGBK@Q?c@?c@F]J]T{@ZkADUDM@UCe@Ei@CYAK@E?GFW??TNTL^LXFZ@f@Cf@EP?lCOL?vBQzD]XA\\E??RCAOMiAa@aEK{@C_@?SLs@P_A\\oBX{ACiH?E??BU[?UA{@C???EMwHIiGCWGaEOiI???YYFBTHdIFbE@V??E@A?', '', 'unpaid', NULL),
(256, 185, 159, '2019-01-25 14:20:49', '2019-01-25 22:20:43', '2019-01-25 22:20:49', '6.5948422', '3.3359125', '6.6211078', '3.3609343000000003', 1, '386.55', 'cancelled', '9 Ikeja Along Overpass, Ikeja, Nigeria', 'Alausa, Ojodu, Nigeria', 'w`gg@mpjSA?g@NkBd@_@Hy@RwCz@u@Tg@LgGlB??YcA??bDaAnBk@jBo@dAUlA_@r@W??BE?E@EAI?CO[OiAGkFAi@AqAASCg@C_@C[Io@EQEQCMIUM]Uc@Yc@yA_C??BE@ABC@A?C@A@C?C@A?CACAE?CACAECCACACAAC?AAA?A?A?C?A?A?A?GKEGEIa@w@Ua@MSMSc@i@e@k@c@a@g@_@y@g@q@YQGYKSG_AUGAwAc@c@MeA[e@O[I]IOESESIeA]c@M_@OYKi@YWQm@a@USMI}@w@{AwAsAuAGEcF}EIGGGmBqBoB{Bq@u@k@aA??@A?A@A?A?A@A?A@A?K?CACAE?CCCACCAIIUE{@y@]]aA}Bo@sAeAmB}@qA}@gAe@e@kAq@]Uc@Yc@Wo@[_@QgJkEwAy@gAo@YSQM_Au@qAoAcAgAc@g@W[m@o@W_@EGWc@IMaBuCk@}@IMa@o@QUeBsCUa@[g@e@y@_@q@_@o@m@mASi@OYQg@CMKc@GYG[Io@Gq@Em@MQG{@OuB?AAYEc@G_ACU?A??A[IBqAZyBb@{B^cCV??YFBTHdIFbE@V??E@A?', '', 'unpaid', NULL),
(257, 186, 159, '2019-01-25 14:30:22', '2019-01-25 22:28:41', '2019-01-25 22:30:22', '6.6211078', '3.3609343000000003', '6.6354375999999995', '3.3859966', 1, '372.75', 'cancelled', 'Alausa, Ikeja, Nigeria', 'Magodo GRA Phase I, Lagos, Nigeria', '}dlg@}loS@?DA??R`Q?D??eBBwCGsA@sAA??@mIAYCICGCEGGECEAMEGAk@?o@CcAAKAIAICIEECY_@q@wACESWW[a@]YOe@MWGa@Eg@CYAYCQCGEEEEGEMCMMsCAQK}B???Y[@UBe@Og@KK?UCYE]Ig@MKEIGSWMSKMICICw@MGAKEKYAO?ID[@ECMCGEEIGw@MeBk@kA_@k@OQAO?MBQDe@L]Fe@F??eBa@kA]kC}@EAcC_AQIqCmAaCmAcB_AmBmAoA{@QMo@e@k@a@_As@aBuA{@u@KKe@c@m@m@IIY[??AWAQCMCQCICCCEYa@WY}AwBkBcCSWMUCEAEAEAE@G?KD[Di@?U?UAEAEIW?QMoAGg@Ey@AGACCE@e@@IB[JiA@O?MFe@|@mF\\yBt@gDF[He@DW?W?]??BQNOFCHCHCLAhDE|AC`AE??GSGOEUE]CQAK?M?O?M?S??DSFOXy@DMFMFKHITWRUb@e@HILQd@o@Xa@j@y@\\q@JUd@iAx@_Cf@yA??La@H[PaAJg@Ha@J]??LBH@J?fDH??NuF??wBKKAKAMC_@[YY??ExA', '', 'unpaid', NULL),
(258, 187, 159, '2019-01-25 14:32:49', '2019-01-25 22:32:43', '2019-01-25 22:32:49', '6.6166009', '3.3492211999999997', '6.6211078', '3.3609343000000003', 1, '289.5', 'cancelled', '2a, Ikeja, Lagos', 'Alausa, Ojodu, Nigeria', 'gikg@kdmSMFe@\\UPgB`AOH_C`B??rAzBlA~B??o@^UNKHEBCBCFCHAJ@LNbA??aCTSFc@PgBdASNWPy@l@o@`@E@C@E?A?CAAACAEIKSs@}Ba@gA??u@NcAVcE|A}PtF??]cASk@oHcU}AkE??FApM}Bf@KXGFADCBABCDGBK@Q?c@?c@F]J]T{@ZkADUDM@UCe@Ei@CYAK@E?GFW??TNTL^LXFZ@f@Cf@EP?lCOL?vBQzD]XA\\E??RCAOMiAa@aEK{@C_@?SLs@P_A\\oBX{ACiH?E??BU[?UA{@C???EMwHIiGCWGaEOiI???YYFBTHdIFbE@V??E@A?', '', 'unpaid', NULL),
(259, 188, 159, '2019-01-25 15:43:32', '2019-01-25 23:39:00', '2019-01-25 23:43:32', '6.614218500000001', '3.3583477999999998', '6.6211078', '3.3609343000000003', 1, '185.35', 'cancelled', 'Ikeja City Mall, Obafemi Awolowo Way, Ikeja, Nigeria', 'Alausa, Ojodu, Nigeria', 'gzjg@cvnSFH??g@\\??W[??YR??GM??wArA??Wc@IMaBuCk@}@IMa@o@QUeBsCUa@[g@e@y@_@q@_@o@m@mASi@OYQg@CMKc@GYG[Io@Gq@Em@MQG{@OuB?AAYEc@G_ACU?A??A[IBqAZyBb@{B^cCV??YFBTHdIFbE@V??E@A?', '', 'unpaid', NULL),
(260, 189, 159, '2019-01-25 16:22:30', '2019-01-26 00:22:27', '2019-01-26 00:22:30', '6.5977955999999995', '3.3405853000000003', '6.6211078', '3.3609343000000003', 2, '742.0', 'cancelled', '2a Ikeja Bridge, Lagos, Nigeria', 'Alausa, Ojodu, Nigeria', 'gsgg@umkSsBbA}Ap@cAX??{HjDeAf@{Ar@_A`@kChAiBt@eA\\iA^qBn@cAR??AEMi@Ss@Sq@M]Sc@]k@[g@SYu@aAqAoBsBeDm@}@i@w@y@sAa@o@MUu@eA}AaCiA_B_AyAe@o@]a@_@a@g@a@g@_@g@[i@_@??JU`@}@bBuCDG@Cj@w@NSb@o@h@s@\\a@tB}BdDsDbAg@???@@?@?@?@?@?@?@?D?BADADCBABCBCBE@A?A@A?A?A@A?A@A?K?CACAE?CCCACCAIIUE{@y@]]aA}Bo@sAeAmB}@qA}@gAe@e@kAq@]Uc@Yc@Wo@[_@QgJkEwAy@gAo@YSQM_Au@qAoAcAgAc@g@W[m@o@W_@EGWc@IMaBuCk@}@IMa@o@QUeBsCUa@[g@e@y@_@q@_@o@m@mASi@OYQg@CMKc@GYG[Io@Gq@Em@MQG{@OuB?AAYEc@G_ACU?A??A[IBqAZyBb@{B^cCV??YFBTHdIFbE@V??E@A?', '', 'unpaid', NULL),
(261, 190, 159, '2019-01-28 13:01:36', '2019-01-26 00:29:08', '2019-01-28 21:01:36', '6.626408199999999', '3.365974', '6.6211078', '3.3609343000000003', 1, '316.4', 'cancelled', 'Magodo Brooks Estate, Lagos, Nigeria', 'Alausa, Ojodu, Nigeria', '}emg@yjpSpCIxDM??PvD??fBIp@Cj@CN?F?H@L@H@L@RFXLTL`@PVLVJRJLFHBH@B?J?NCh@MVGNCr@MRCNCd@GzB]v@KPCf@I`@Gb@Ip@Oh@Mt@QtBe@x@Ux@SVGb@MjA]lAc@??CVANDLJJ??sAd@aBh@eBf@oAZkBd@aB\\cBZmAPcBV_BPcBP}ALiBLo@Bo@DyADcBBqA@gA?qA?iAA{ACwAGkAGkBO_BMo@Gg@Kc@IkAOmAOwAYWEk@Ki@KUG??EMEQ?E?G@C@CBCBADCD?FAZDt@T~@`@VLNJJJFJBFH\\LXDDDBFBF@\\Fd@L??JDF@v@LHBHBJLLRRVHFJDf@L\\HXDTBJ?f@Jd@NTPZ@tCF`F@vB?t@A^AdAKfBSf@Gt@GpFo@??HdIFbE@V??E@A?', '', 'unpaid', NULL),
(262, 191, 159, '2019-01-29 13:39:50', '2019-01-28 21:50:40', '2019-01-29 21:39:50', '6.578531', '3.366224', '6.6137843', '3.3580145', 1, '242.25', 'cancelled', 'Workbay, Lagos, Nigeria', 'Shoprite Ikeja City Mall, Obafemi Awolowo Way, Ikeja, Nigeria', 'e}fg@ixjSM@C?C?A?A?AAAAA?ACAA?ECEAOAMGeA??Eq@E}@A[?W??AMy@G]@YBWB]FoBJ??Cg@C_@C[Io@EQEQCMIUM]Uc@Yc@yA_C??BE@ABC@A?C@A@C?C@A?CACAE?CACAECCACACAAC?AAA?A?A?C?A?A?A?GKEGEIa@w@Ua@MSMSc@i@e@k@c@a@g@_@y@g@q@YQGYKSG_AUGAwAc@c@MeA[e@O[I]IOESESIeA]c@M_@OYKi@YWQm@a@USMI}@w@{AwAsAuAGEcF}EIGGGmBqBoB{Bq@u@k@aA??@A?A@A?A?A@A?A@A?K?CACAE?CCCACCAIIUE{@y@]]aA}Bo@sAeAmB}@qA}@gAe@e@kAq@]Uc@Yc@Wo@[_@QgJkEwAy@gAo@YSQM_Au@qAoAcAgAc@g@W[m@o@W_@EGWc@??@G@K?EAGEIi@iAo@}AHYNMLILQLAH?DH??CD??`@d@FHLNNVRZ??n@i@??PXPVRXNN@@?@?@?@KH??TXNP', '', 'unpaid', NULL),
(263, 192, 159, '2019-02-09 13:07:09', '2019-02-09 20:59:34', '2019-02-09 21:07:09', '6.4445883', '3.4256164', '6.4620204999999995', '3.2948747', 1, '100.0', 'cancelled', '3, Lagos, Lagos', 'FESTAC Police Station, 2nd Avenue, Lagos, Nigeria', 'guif@ca|S?d@?J?`C?P?vBBLAL?J@J?J@J@J@HBLBLDPDRFNFLDJHLPVhAvAlB|BNNFHTV@B`@l@JPP^LZLd@FXFTLjAB\\Bb@BZPjBDp@D`@Bb@Db@Db@D`@Bb@Db@Db@@LFr@HjA@b@?h@Cb@CZE`@Kt@OdAm@jEEb@CHEb@G`@EXKv@EXEZEZADERENADGTADIXW`Ai@dCmA`Fq@~CK`@Y~@CNIJKf@Mh@GXGZMt@EXGn@CZAX?N?RBb@Hj@NxAJl@DVJZP`@LZFRFPDPDV?NJpA?D?@ER??E@CDABAFAD?D?J@L@FBJBD@DF@F@D?D?B?DADCp@FvGhFLLR\\HJBH@H@P??EZAFERELM`@CFIVEJKRADOXOT]b@a@d@c@`@sAnAYXWZ_@h@[j@Ol@GZYd@y@lAm@~@mB~CGJGJiAdBgAhB{AdCsArBsDbG{@zAe@t@MPOXsD|G}@`B}@~Ao@rAwAnCINITcAzBoDjIoCjG{@jBCFEFADOT??}@nBs@bBWj@QXMRSX[\\WPUPYRq@\\SFWJWF]FYDYBa@@q@Ae@Ca@Ec@Gg@K}@Uk@QuA_@_AWa@I]EOCc@Ei@Ci@CoADc@Fs@DeALaDj@o@Nm@Ng@Xu@`@{Ax@QJOHqIvEoItEKFMDsC|Aw@\\aA`@wAd@MDMDc@Js@PcATc@HmAXo@LA?k@LE?]Fe@HYFaCl@??}Bd@wBd@YF_Ch@iAR{@TkBl@sB|@a@Rm@Zq@d@c@Ta@ZeA|@g@`@aAhAWZg@r@cArAsFpHcB`C??CBGBKFmFlGo@x@[Z_@\\QHODUBC?SGQGYO]?a@@i@L??A^AFAJ?HB^bAfA??~@~Cl@zCPx@??`@x@BFNZ\\b@VZ^b@f@^p@ZbDnA~B|@??R@TFNDz@TXJnC~@^N??GPIPsCvHe@pAo@lBk@nBSt@U~@Ol@I`@Q`AQz@O`AQnAK|@I|@IdAIpAEz@ErAk@x\\O`GClB?r@AbA@dA?h@Bn@HnAVfE??@l@Ff@dAnGBPDPJ`@H^BJTr@dA~Cz@tBP^DJd@|@n@jAfAvBHNTb@fAjB`A|AnApB~AdCbBjCDFZh@j@|@^j@`BjCfDhFh@~@nAzB|@|Ab@x@v@nAbAzAHL|@tAV^p@|@v@|@n@v@r@~@T\\x@lAb@n@LTNZTd@JTNZl@hAj@|@xA~BrDxFnAnBJPj@|@lC|DJNl@bANRdC|DXd@Z\\TXp@t@fBlC|GnKpCnF`AzBf@bBPp@??Jd@DTDVFXJx@Jz@B^B^@^Bv@B`CE|A??A|@A|@KpECx@CfBAFC|@@bC?d@?lA?d@?b@?j@@x@EfDGbEA^A\\?f@@bB?rH?r@@`@Bp@DjCBx@?T?R?fCAfH??OLGDG@GBI?I@O?a@@gAAW?K?Q@K?[Bm@FSBMBcAVe@Lq@T??QHFR@h@FfBLzC@TF|AJzBFfAB`@D`@Hj@`@jCBLn@~DN`ABN', '', 'unpaid', NULL),
(264, 192, 2, '2019-02-09 13:16:20', '2019-02-09 21:15:52', '2019-02-09 21:16:20', '6.6354455', '3.3617064', '6.6354455', '3.3617064', 1, '100.0', 'completed', '3, Lagos, Lagos', 'Ikeja City Mall, Obafemi Awolowo Way, Ikeja, Nigeria', 'guif@ca|S?d@?J?`C?P?vBBLAL?J@J?J@J@J@HBLBLDPDRFNFLDJHLPVhAvAlB|BNNFHTV@B`@l@JPP^LZLd@FXFTLjAB\\Bb@BZPjBDp@D`@Bb@Db@Db@D`@Bb@Db@Db@@LFr@HjA@b@?h@Cb@CZE`@Kt@OdAm@jEEb@CHEb@G`@EXKv@EXEZEZADERENADGTADIXW`Ai@dCmA`Fq@~CK`@Y~@CNIJ??Yr@K^K\\GXEXEVCVCTCTCLCJEJMLCBKHKFGBQBG@K?M?QC]KYKmA[_@IKAIAk@B??wASc@Gu@IuEi@eEe@e@Gg@GwAMaEc@qDc@oDc@wBQs@@q@AkABy@Fw@Ho@L{@PqA`@cA^{A|@cAx@WTUTY\\]`@SVSZS\\Wj@Yp@Ob@Of@Kb@Kh@Kp@Eb@E`@KdCMxEElAEjAG|@Ep@It@Mz@Kl@[`BMf@K`@Qf@g@|A[z@Wl@]t@k@bAgAlBs@fA{@rAc@j@OViB|BgArA{@bA{AlBoAjAy@v@}@p@s@j@}@n@_@Vg@ZyAz@yAr@g@Tg@PaA\\gCz@sA`@iAZw@RuBd@u@NyAV}@LcANkAL_AJ}@HcAF_ADgBH}BDiA@iA@uACqBCwBKoDSoDa@aBSk@Kq@Ky@Q}@ScG_B{Bw@iAc@}B}@gBw@kBu@yCyAgB_AoHqDeB{@c@UKGeGsCWOWOqAm@}DqByBeAiKeFsD{A_C{@_Bi@gA]w\\eJqo@sPeIiBiHkAyH}@yGe@_J]uIG_GHoJb@wJz@qHfAeKrByInBaKxBsFlAyCr@kJtB}HbBkHtAoFx@sD`@mHl@qL`AuEh@gDn@{Cp@_Dx@{CdAwCx@qA^mBf@UHm@PcAReARiBXcALs@H{ANq@DoCL}@BoA@cD?gGAq@?cA@{AFsAFaAHcBP_C\\yB^yCj@qDv@yB^u@Js@Hq@FcAHcAD{@BmA@gBCYAM?i@CUAo@Em@GOA_AKoH}@qH}@uGw@gHy@qJiAiBQ_BSuAK_AGu@CcBC{@?cAB_ADo@DcAJ[DWBs@LyA^sA`@y@XkAf@aAb@y@j@qAz@cBrAoJ`IwBfBwAlA[V{@v@gLrJeAv@[TqAbAw@n@g@`@eCrBcCjB{CbCcD`Cc@\\gAz@kF~D{@p@IF[T[VwNbKQL[TSNGD[T[TqQhMKH[V[TA@[R[ToJxGiBrA]T[T[T[T]T[T[T[TIFy@j@g@`@GD[T[T]T[T[T]T[TmBvAsE`DGD]R[T]RCBYP[R]R]T??HLR\\lBmA\\UZUZUZWZUZUZU\\UZUZWVQZW\\UZUZUZUZWZUZS??TGHCPIPOVOPI\\MZGHAH?F@J@FBFDDDb@l@@BVZVZTZVZTZVXDFFJDH?@FLBF?D?B??GJUTqChBuB|AoBxAkAx@eAt@qBjAiAn@KDEB]P_@R]R]R]PSLyAbAaHnEeG`EuHpEKFQJ]RUL[Rq@^uA~@aCxAkDrBqJpF]PIFcEhCuBlA}BtA??KFHLd@`AJTBLBHAP??HLZWDCTKHEBAPCJ?@@H@??D?LDRLTVb@t@lBtCR\\HNHLR\\R\\T\\R\\R\\R\\FLJNR\\T\\BDHRhCdElAfB??{@v@cCpBeAz@}DbD??e@[UW??TK??JNB@@?@@@A@?^[@C?A?AAAKKQSGI', '', 'paid', '2019-02-09 21:16:20'),
(265, 193, 2, '2019-02-09 14:05:05', '2019-02-09 21:33:18', '2019-02-09 22:05:05', '6.6354455', '3.3617064', '6.4713708', '3.311048', 1, '100.0', 'cancelled', '3, Lagos, Lagos', 'Festac Access Road, Lagos, Nigeria', 'guif@ca|S?d@?J?`C?P?vBBLAL?J@J?J@J@J@HBLBLDPDRFNFLDJHLPVhAvAlB|BNNFHTV@B`@l@JPP^LZLd@FXFTLjAB\\Bb@BZPjBDp@D`@Bb@Db@Db@D`@Bb@Db@Db@@LFr@HjA@b@?h@Cb@CZE`@Kt@OdAm@jEEb@CHEb@G`@EXKv@EXEZEZADERENADGTADIXW`Ai@dCmA`Fq@~CK`@Y~@CNIJKf@Mh@GXGZMt@EXGn@CZAX?N?RBb@Hj@NxAJl@DVJZP`@LZFRFPDPDV?NJpA?D?@ER??E@CDABAFAD?D?J@L@FBJBD@DF@F@D?D?B?DADCp@FvGhFLLR\\HJBH@H@P??EZAFERELM`@CFIVEJKRADOXOT]b@a@d@c@`@sAnAYXWZ_@h@[j@Ol@GZYd@y@lAm@~@mB~CGJGJiAdBgAhB{AdCsArBsDbG{@zAe@t@MPOXsD|G}@`B}@~Ao@rAwAnCINITcAzBoDjIoCjG{@jBCFEFADOT??}@nBs@bBWj@QXMRSX[\\WPUPYRq@\\SFWJWF]FYDYBa@@q@Ae@Ca@Ec@Gg@K}@Uk@QuA_@_AWa@I]EOCc@Ei@Ci@CoADc@Fs@DeALaDj@o@Nm@Ng@Xu@`@{Ax@QJOHqIvEoItEKFMDsC|Aw@\\aA`@wAd@MDMDc@Js@PcATc@HmAXo@LA?k@LE?]Fe@HYFaCl@??}Bd@wBd@YF_Ch@iAR{@TkBl@sB|@a@Rm@Zq@d@c@Ta@ZeA|@g@`@aAhAWZg@r@cArAsFpHcB`C??CBGBKFmFlGo@x@[Z_@\\QHODUBC?SGQGYO]?a@@i@L??A^AFAJ?HB^bAfA??~@~Cl@zCPx@??`@x@BFNZ\\b@VZ^b@f@^p@ZbDnA~B|@??R@TFNDz@TXJnC~@^N??GPIPsCvHe@pAo@lBk@nBSt@U~@Ol@I`@Q`AQz@O`AQnAK|@I|@IdAIpAEz@ErAk@x\\O`GClB?r@AbA@dA?h@Bn@HnAVfE??@l@Ff@dAnGBPDPJ`@H^BJTr@dA~Cz@tBP^DJd@|@n@jAfAvBHNTb@fAjB`A|AnApB~AdCbBjCDFZh@j@|@^j@`BjCfDhFh@~@nAzB|@|Ab@x@v@nAbAzAHL|@tAV^p@|@v@|@n@v@r@~@T\\x@lAb@n@LTNZTd@JTNZl@hAj@|@xA~BrDxFnAnBJPj@|@lC|DJNl@bANRdC|DXd@Z\\TXp@t@fBlC|GnKpCnF`AzBf@bBPp@??Jd@DTDVFXJx@Jz@B^B^@^Bv@B`CE|A??A|@A|@KpECx@CfBAFC|@@bC?d@?lA?d@?b@?j@??}@VIBg@No@P}DhAe@Lk@L[Jk@JSB}@BaA?wA?sA?c@@W?a@Ae@AYAGSI[CSA[AO?g@Ao@?}C?qH???]U@A?aHNyA@qA@mBDsJRqEH[@??A?AA?AA??AAAA??AA?CAA?A?AAA?A?A?A??@A?A?A?A@C@?@A?A@A@?@A@A@?D?@A@?@?@@??B?@?@@@@@?@@??@DBDd@LhD', '', 'unpaid', NULL),
(266, 194, 2, '2019-02-09 14:08:40', '2019-02-09 22:08:22', '2019-02-09 22:08:40', '6.630620599999999', '3.3344842999999997', '6.626188699999999', '3.3535283999999996', 1, '332.5', 'cancelled', 'LSPDC Medium Estate Phase 4 Ogba, Lagos, Nigeria', 'Mega Chicken Agidingbi, Lateef Jakande Road, Ikeja, Nigeria', 'e_ng@qgjSA}@AoB??l@CjBI??fBQtD_@`DIR?X?B?B?D@B@DDFFZX??GXw@dEYxAk@rCQx@oA~G[`Ba@vBAJMt@CLGd@GZ??P@BSFe@TsAd@}Bh@sC~@gFz@oEVuARgAf@aCLu@P{@h@gC??FSWMg@YmCkA??BQJu@Fa@ZkBDm@@Y?]COi@qBeAaDGQc@uAGU}EcO{@kC}E{NeC}H}@oCi@_BEWEY?]B]RaBNeARuAJy@L_AFe@BMN}@H_@Ji@Lw@XeC??pHu@xAQj@MRAVE`@Ep@GN?VCt@C^B\\DRFXJZLh@T|At@??AL@HBFFHHD', '', 'unpaid', NULL),
(267, 195, 2, '2019-02-09 14:13:23', '2019-02-09 22:12:12', '2019-02-09 22:13:23', '6.6376368', '3.3558155999999997', '6.626188699999999', '3.3535283999999996', 1, '187.2', 'cancelled', 'Omole Phase 1, Lagos, Nigeria', 'Mega Chicken Agidingbi, Lateef Jakande Road, Ikeja, Nigeria', 'glog@{lnS`IoKHM??JFvBbBl@f@h@`@j@`@\\TTNlAj@fAf@bA\\ZJ^H\\F\\DN@nALj@D??u@nJ???PzFITApHu@xAQj@MRAVE`@Ep@GN?VCt@C^B\\DRFXJZLh@T|At@??AL@HBFFHHD', '', 'unpaid', NULL),
(268, 196, 2, '2019-02-09 15:35:44', '2019-02-09 23:35:40', '2019-02-09 23:35:44', '6.6354455', '3.3617064', '6.6354455', '3.3617064', 1, '187.2', 'completed', 'Omole Phase 1, Lagos, Nigeria', 'Mega Chicken Agidingbi, Lateef Jakande Road, Ikeja, Nigeria', 'glog@{lnS`IoKHM??JFvBbBl@f@h@`@j@`@\\TTNlAj@fAf@bA\\ZJ^H\\F\\DN@nALj@D??u@nJ???PzFITApHu@xAQj@MRAVE`@Ep@GN?VCt@C^B\\DRFXJZLh@T|At@??AL@HBFFHHD', '', 'paid', '2019-02-09 23:35:44'),
(269, 197, 159, '2019-02-19 12:44:22', '2019-02-19 08:58:36', '2019-02-19 20:44:22', '6.6349393', '3.3617217', '6.6349393', '3.3617217', 1, '200.0', 'cancelled', 'Mega Chicken Agidingbi, Lateef Jakande Road, Ikeja, Nigeria', 'Omole Phase 1, Lagos, Nigeria', 'idmg@e_nSHBLBd@P??GLWhAY|AKnAEp@Gr@AHEJCBC@C@g@Dq@Bi@?_@AaD[??p@aKVmD?G??@My@?W@O?q@Fa@DYFS@i@F_BPgHv@WB{FJ_A@m@Bq@BKBIBIB}AZuD|@??uD}Ce@c@aAy@YS_@YcCaBo@e@oAy@', '', 'paid', '2019-02-19 08:58:17'),
(270, 198, 159, '2019-02-20 15:13:19', '2019-02-19 20:45:45', '2019-02-20 23:13:19', '6.6357227', '3.3608957', '6.626188699999999', '3.3535283999999996', 1, '164.5', 'cancelled', 'LSDPC Estate, Omole Phase 1, Lagos, Nigeria', 'Mega Chicken Agidingbi, Lateef Jakande Road, Ikeja, Nigeria', 'q`og@oloSA??C?A?A@A?AbAcBN[@G?E?CCEEGEE_@U??IRaAhB??sBgA??AHWvA]fBQhASvA??jAd@f@T^Tb@XhCbB??aC`D??LHJFvBbBl@f@h@`@j@`@\\TTNlAj@fAf@bA\\ZJ^H\\F\\DN@nALj@D??u@nJ???PzFITApHu@xAQj@MRAVE`@Ep@GN?VCt@C^B\\DRFXJZLh@T|At@??AL@HBFFHHD', '', 'unpaid', NULL),
(271, 199, 159, '2019-02-20 15:17:50', '2019-02-20 23:17:39', '2019-02-20 23:17:50', '6.6357227', '3.3608957', '6.614218500000001', '3.3583477999999998', 1, '321.35', 'cancelled', 'LSDPC Estate, Omole Phase 1, Lagos, Nigeria', 'Ikeja City Mall, Obafemi Awolowo Way, Ikeja, Nigeria', 'q`og@oloSA??C?A?A@A?AbAcBN[@G?E?CCEEGEE_@U??IRaAhB??sBgA??AHWvA]fBQhASvA??jAd@f@T^Tb@XhCbB??aC`D??LHJFvBbBl@f@h@`@j@`@\\TTNlAj@fAf@bA\\ZJ^H\\F\\DN@nALj@D??u@nJ???PzFITApHu@xAQj@MRAVE`@Ep@GN?VCt@C^B\\DRFXJZLh@T|At@zAt@h@Z|CzAp@\\`Af@TNTL^LXFZ@f@Cf@EP?lCOL?vBQzD]XA\\ERC~AK\\CTK~Hi@ZC`@E@?`@Cb@Eb@E@?RCJCTEJE\\M@A^QXMDC\\Q\\S\\Q^S\\SVMDCz@g@x@a@XOvAo@DC\\Qr@a@??RKqAoAcAgAc@g@W[m@o@W_@EGWc@??@G@K?EAGEIi@iAo@}AHYNMLILQLAH?DH??CD??`@d@FHLNNVRZ??n@i@??PXPVRXNN@@?@?@?@KH??LN', '', 'unpaid', NULL),
(272, 200, 159, '2019-02-20 15:20:25', '2019-02-20 23:19:17', '2019-02-20 23:20:25', '6.6357227', '3.3608957', '6.6137843', '3.3580145', 1, '391.0', 'cancelled', 'LSDPC Estate, Omole Phase 1, Lagos, Nigeria', 'Shoprite Ikeja City Mall, Obafemi Awolowo Way, Ikeja, Nigeria', 'q`og@oloSA??C?A?A@A?AbAcBN[@G?E?CCEEGEE_@U??IRaAhB??sBgA??Bg@NqBZ}ELqBDaAJeA@k@B_@Dg@??iD[_DSK?_CIcAA_BBiABy@D??G[[kBEe@AU?WPiBF]J{@Hq@JoA?CDo@@y@EeG??VGDAFADAB@D?F@FDDBn@r@ZZZVf@f@p@l@h@b@PLLBJBPBr@NZVjA~@~BfBrA`ApAv@~@j@RJ\\PlAp@dAh@lAj@xAp@dBn@~Ah@rA`@bAZ|A`@xBj@rCl@z@N|@PxBX^Dj@FV@n@HfBNjBLjAH|BHlADfB@pC?rCC??PD@?HBR@D@P@N@F?ZDB?XFB@TFJB`@L??HR`@Gb@Eb@E`@Gb@Eb@G\\ETCdCWzB_@xBc@pAYHCvAg@\\K`@K^KDAZI`@Kb@KVEHA??@@@??@@?@??@@?@?@?@A@?FNHNJPT\\TZR\\T\\RZT\\FHHLd@`AJTBLBHAP??HLZWDCTKHEBAPCJ?@@H@??D?LDRLTVb@t@lBtCR\\HNHLR\\R\\T\\R\\R\\R\\FLJNR\\T\\BDHRhCdElAfB??{@v@cCpBeAz@}DbD??e@[UW??TK??JNB@@?@@@A@?^[@C?A?AAAKKAA', '', 'unpaid', NULL),
(273, 201, 159, '2019-02-20 15:29:44', '2019-02-20 23:22:45', '2019-02-20 23:29:44', '6.6285785', '3.3655015', '6.6285785', '3.3655015', 1, '321.35', 'cancelled', 'LSDPC Estate, Omole Phase 1, Lagos, Nigeria', 'Ikeja City Mall, Obafemi Awolowo Way, Ikeja, Nigeria', 'q`og@oloSA??C?A?A@A?AbAcBN[@G?E?CCEEGEE_@U??IRaAhB??sBgA??AHWvA]fBQhASvA??jAd@f@T^Tb@XhCbB??aC`D??LHJFvBbBl@f@h@`@j@`@\\TTNlAj@fAf@bA\\ZJ^H\\F\\DN@nALj@D??u@nJ???PzFITApHu@xAQj@MRAVE`@Ep@GN?VCt@C^B\\DRFXJZLh@T|At@zAt@h@Z|CzAp@\\`Af@TNTL^LXFZ@f@Cf@EP?lCOL?vBQzD]XA\\ERC~AK\\CTK~Hi@ZC`@E@?`@Cb@Eb@E@?RCJCTEJE\\M@A^QXMDC\\Q\\S\\Q^S\\SVMDCz@g@x@a@XOvAo@DC\\Qr@a@??RKqAoAcAgAc@g@W[m@o@W_@EGWc@??@G@K?EAGEIi@iAo@}AHYNMLILQLAH?DH??CD??`@d@FHLNNVRZ??n@i@??PXPVRXNN@@?@?@?@KH??LN', '', 'paid', '2019-02-20 23:27:26'),
(274, 202, 159, '2019-02-20 15:34:58', '2019-02-20 23:34:49', '2019-02-20 23:34:58', '6.6357227', '3.3608957', '6.614218500000001', '3.3583477999999998', 1, '321.35', 'cancelled', 'LSDPC Estate, Omole Phase 1, Lagos, Nigeria', 'Ikeja City Mall, Obafemi Awolowo Way, Ikeja, Nigeria', 'q`og@oloSA??C?A?A@A?AbAcBN[@G?E?CCEEGEE_@U??IRaAhB??sBgA??AHWvA]fBQhASvA??jAd@f@T^Tb@XhCbB??aC`D??LHJFvBbBl@f@h@`@j@`@\\TTNlAj@fAf@bA\\ZJ^H\\F\\DN@nALj@D??u@nJ???PzFITApHu@xAQj@MRAVE`@Ep@GN?VCt@C^B\\DRFXJZLh@T|At@zAt@h@Z|CzAp@\\`Af@TNTL^LXFZ@f@Cf@EP?lCOL?vBQzD]XA\\ERC~AK\\CTK~Hi@ZC`@E@?`@Cb@Eb@E@?RCJCTEJE\\M@A^QXMDC\\Q\\S\\Q^S\\SVMDCz@g@x@a@XOvAo@DC\\Qr@a@??RKqAoAcAgAc@g@W[m@o@W_@EGWc@??@G@K?EAGEIi@iAo@}AHYNMLILQLAH?DH??CD??`@d@FHLNNVRZ??n@i@??PXPVRXNN@@?@?@?@KH??LN', '', 'unpaid', NULL),
(275, 203, 159, '2019-02-20 15:40:05', '2019-02-20 23:39:56', '2019-02-20 23:40:05', '6.6357227', '3.3608957', '6.614218500000001', '3.3583477999999998', 1, '321.35', 'cancelled', 'LSDPC Estate, Omole Phase 1, Lagos, Nigeria', 'Ikeja City Mall, Obafemi Awolowo Way, Ikeja, Nigeria', 'q`og@oloSA??C?A?A@A?AbAcBN[@G?E?CCEEGEE_@U??IRaAhB??sBgA??AHWvA]fBQhASvA??jAd@f@T^Tb@XhCbB??aC`D??LHJFvBbBl@f@h@`@j@`@\\TTNlAj@fAf@bA\\ZJ^H\\F\\DN@nALj@D??u@nJ???PzFITApHu@xAQj@MRAVE`@Ep@GN?VCt@C^B\\DRFXJZLh@T|At@zAt@h@Z|CzAp@\\`Af@TNTL^LXFZ@f@Cf@EP?lCOL?vBQzD]XA\\ERC~AK\\CTK~Hi@ZC`@E@?`@Cb@Eb@E@?RCJCTEJE\\M@A^QXMDC\\Q\\S\\Q^S\\SVMDCz@g@x@a@XOvAo@DC\\Qr@a@??RKqAoAcAgAc@g@W[m@o@W_@EGWc@??@G@K?EAGEIi@iAo@}AHYNMLILQLAH?DH??CD??`@d@FHLNNVRZ??n@i@??PXPVRXNN@@?@?@?@KH??LN', '', 'unpaid', NULL),
(276, 204, 159, '2019-02-20 15:43:19', '2019-02-20 23:43:13', '2019-02-20 23:43:19', '6.6357227', '3.3608957', '6.614218500000001', '3.3583477999999998', 1, '321.35', 'cancelled', 'LSDPC Estate, Omole Phase 1, Lagos, Nigeria', 'Ikeja City Mall, Obafemi Awolowo Way, Ikeja, Nigeria', 'q`og@oloSA??C?A?A@A?AbAcBN[@G?E?CCEEGEE_@U??IRaAhB??sBgA??AHWvA]fBQhASvA??jAd@f@T^Tb@XhCbB??aC`D??LHJFvBbBl@f@h@`@j@`@\\TTNlAj@fAf@bA\\ZJ^H\\F\\DN@nALj@D??u@nJ???PzFITApHu@xAQj@MRAVE`@Ep@GN?VCt@C^B\\DRFXJZLh@T|At@zAt@h@Z|CzAp@\\`Af@TNTL^LXFZ@f@Cf@EP?lCOL?vBQzD]XA\\ERC~AK\\CTK~Hi@ZC`@E@?`@Cb@Eb@E@?RCJCTEJE\\M@A^QXMDC\\Q\\S\\Q^S\\SVMDCz@g@x@a@XOvAo@DC\\Qr@a@??RKqAoAcAgAc@g@W[m@o@W_@EGWc@??@G@K?EAGEIi@iAo@}AHYNMLILQLAH?DH??CD??`@d@FHLNNVRZ??n@i@??PXPVRXNN@@?@?@?@KH??LN', '', 'unpaid', NULL),
(277, 205, 159, '2019-02-20 15:49:12', '2019-02-20 23:49:05', '2019-02-20 23:49:12', '6.5977955999999995', '3.3405853000000003', '6.614218500000001', '3.3583477999999998', 1, '314.8', 'cancelled', '5 Ikeja Bridge, Lagos, Nigeria', 'Ikeja City Mall, Obafemi Awolowo Way, Ikeja, Nigeria', 'gsgg@umkSsBbA}Ap@cAX??{HjDeAf@{Ar@_A`@kChAiBt@eA\\iA^qBn@cAR??AEMi@Ss@Sq@M]Sc@]k@[g@SYu@aAqAoBsBeDm@}@i@w@y@sAa@o@MUu@eA}AaCiA_B_AwAe@q@]a@_@a@g@a@g@_@qA{@??JU`@}@bBuCDG@Cj@w@NSb@o@h@s@\\a@tB}BdDsD\\Q^QDC??D@F?D?BADADCBABCBCBE@A?A@A?A?A@A?A@A?OAEAGCCACCAIIUE{@y@]]Q_@O_@O_@O]o@sAeAmB}@qA}@gAe@e@kAq@]UGC[Uc@Wo@[_@QgJkEm@]qBkAk@a@IGYU[WqAoAcAgAc@g@W[m@o@W_@EGWc@??@G@K?EAGEIi@iAo@}AHYNMLILQLAH?DH??CD??`@d@FHLNNVRZ??n@i@??PXPVRXNN@@?@?@?@KH??LN', '', 'unpaid', NULL),
(278, 206, 159, '2019-02-20 15:51:18', '2019-02-20 23:51:14', '2019-02-20 23:51:18', '6.6357227', '3.3608957', '6.614218500000001', '3.3583477999999998', 1, '321.35', 'cancelled', 'LSDPC Estate, Omole Phase 1, Lagos, Nigeria', 'Ikeja City Mall, Obafemi Awolowo Way, Ikeja, Nigeria', 'q`og@oloSA??C?A?A@A?AbAcBN[@G?E?CCEEGEE_@U??IRaAhB??sBgA??AHWvA]fBQhASvA??jAd@f@T^Tb@XhCbB??aC`D??LHJFvBbBl@f@h@`@j@`@\\TTNlAj@fAf@bA\\ZJ^H\\F\\DN@nALj@D??u@nJ???PzFITApHu@xAQj@MRAVE`@Ep@GN?VCt@C^B\\DRFXJZLh@T|At@zAt@h@Z|CzAp@\\`Af@TNTL^LXFZ@f@Cf@EP?lCOL?vBQzD]XA\\ERC~AK\\CTK~Hi@ZC`@E@?`@Cb@Eb@E@?RCJCTEJE\\M@A^QXMDC\\Q\\S\\Q^S\\SVMDCz@g@x@a@XOvAo@DC\\Qr@a@??RKqAoAcAgAc@g@W[m@o@W_@EGWc@??@G@K?EAGEIi@iAo@}AHYNMLILQLAH?DH??CD??`@d@FHLNNVRZ??n@i@??PXPVRXNN@@?@?@?@KH??LN', '', 'unpaid', NULL),
(279, 207, 159, '2019-02-20 15:51:53', '2019-02-20 23:51:50', '2019-02-20 23:51:53', '6.6357227', '3.3608957', '6.614218500000001', '3.3583477999999998', 1, '321.35', 'cancelled', 'LSDPC Estate, Omole Phase 1, Lagos, Nigeria', 'Ikeja City Mall, Obafemi Awolowo Way, Ikeja, Nigeria', 'q`og@oloSA??C?A?A@A?AbAcBN[@G?E?CCEEGEE_@U??IRaAhB??sBgA??AHWvA]fBQhASvA??jAd@f@T^Tb@XhCbB??aC`D??LHJFvBbBl@f@h@`@j@`@\\TTNlAj@fAf@bA\\ZJ^H\\F\\DN@nALj@D??u@nJ???PzFITApHu@xAQj@MRAVE`@Ep@GN?VCt@C^B\\DRFXJZLh@T|At@zAt@h@Z|CzAp@\\`Af@TNTL^LXFZ@f@Cf@EP?lCOL?vBQzD]XA\\ERC~AK\\CTK~Hi@ZC`@E@?`@Cb@Eb@E@?RCJCTEJE\\M@A^QXMDC\\Q\\S\\Q^S\\SVMDCz@g@x@a@XOvAo@DC\\Qr@a@??RKqAoAcAgAc@g@W[m@o@W_@EGWc@??@G@K?EAGEIi@iAo@}AHYNMLILQLAH?DH??CD??`@d@FHLNNVRZ??n@i@??PXPVRXNN@@?@?@?@KH??LN', '', 'unpaid', NULL),
(280, 208, 159, '2019-02-20 16:00:59', '2019-02-21 00:00:55', '2019-02-21 00:00:59', '6.6357227', '3.3608957', '6.614218500000001', '3.3583477999999998', 1, '321.35', 'cancelled', 'LSDPC Estate, Omole Phase 1, Lagos, Nigeria', 'Ikeja City Mall, Obafemi Awolowo Way, Ikeja, Nigeria', 'q`og@oloSA??C?A?A@A?AbAcBN[@G?E?CCEEGEE_@U??IRaAhB??sBgA??AHWvA]fBQhASvA??jAd@f@T^Tb@XhCbB??aC`D??LHJFvBbBl@f@h@`@j@`@\\TTNlAj@fAf@bA\\ZJ^H\\F\\DN@nALj@D??u@nJ???PzFITApHu@xAQj@MRAVE`@Ep@GN?VCt@C^B\\DRFXJZLh@T|At@zAt@h@Z|CzAp@\\`Af@TNTL^LXFZ@f@Cf@EP?lCOL?vBQzD]XA\\ERC~AK\\CTK~Hi@ZC`@E@?`@Cb@Eb@E@?RCJCTEJE\\M@A^QXMDC\\Q\\S\\Q^S\\SVMDCz@g@x@a@XOvAo@DC\\Qr@a@??RKqAoAcAgAc@g@W[m@o@W_@EGWc@??@G@K?EAGEIi@iAo@}AHYNMLILQLAH?DH??CD??`@d@FHLNNVRZ??n@i@??PXPVRXNN@@?@?@?@KH??LN', '', 'unpaid', NULL),
(281, 209, 159, '2019-02-20 16:01:21', '2019-02-21 00:01:18', '2019-02-21 00:01:21', '6.6357227', '3.3608957', '6.614218500000001', '3.3583477999999998', 1, '321.35', 'cancelled', 'LSDPC Estate, Omole Phase 1, Lagos, Nigeria', 'Ikeja City Mall, Obafemi Awolowo Way, Ikeja, Nigeria', 'q`og@oloSA??C?A?A@A?AbAcBN[@G?E?CCEEGEE_@U??IRaAhB??sBgA??AHWvA]fBQhASvA??jAd@f@T^Tb@XhCbB??aC`D??LHJFvBbBl@f@h@`@j@`@\\TTNlAj@fAf@bA\\ZJ^H\\F\\DN@nALj@D??u@nJ???PzFITApHu@xAQj@MRAVE`@Ep@GN?VCt@C^B\\DRFXJZLh@T|At@zAt@h@Z|CzAp@\\`Af@TNTL^LXFZ@f@Cf@EP?lCOL?vBQzD]XA\\ERC~AK\\CTK~Hi@ZC`@E@?`@Cb@Eb@E@?RCJCTEJE\\M@A^QXMDC\\Q\\S\\Q^S\\SVMDCz@g@x@a@XOvAo@DC\\Qr@a@??RKqAoAcAgAc@g@W[m@o@W_@EGWc@??@G@K?EAGEIi@iAo@}AHYNMLILQLAH?DH??CD??`@d@FHLNNVRZ??n@i@??PXPVRXNN@@?@?@?@KH??LN', '', 'unpaid', NULL),
(282, 210, 159, '2019-02-20 16:14:12', '2019-02-21 00:14:09', '2019-02-21 00:14:12', '6.614218500000001', '3.3583477999999998', '6.6357227', '3.3608957', 1, '341.05', 'cancelled', 'Ikeja City Mall, Obafemi Awolowo Way, Ikeja, Nigeria', 'LSDPC Estate, Omole Phase 1, Lagos, Nigeria', 'gzjg@cvnSMO??i@ZYR??GM??wArA??Wc@IMaBuCk@}@IMGKU]CEQUeBsCUa@[g@e@y@_@q@_@o@m@mASi@OYQg@??CMSHBLRl@d@hAl@hA^j@`@n@d@t@Tb@???HCJCDCBABWRUNGB_@R]PQJA@[P_@POJMF[N]PIDSL[TUFA@W?]DQ@k@?_@?]?E?c@?a@?[?UA{@Ca@@eBBG?c@Ac@Ac@Ac@AsA@sAA??UC?ZOpE??wBIkBK_BMq@Gq@Me@Ia@Ou@[m@YIEw@a@??@xBBfABjAHzBB\\Fh@Bf@ALCLENORWTKNELCHGVI`@??]K]MSE_@Ea@Cy@?W@O?q@Fa@DYFS@i@F_BPgHv@WB{FJ??t@oJ??k@EoAMOA]E]G_@I[KcA]gAg@mAk@UO]Uk@a@i@a@m@g@wBcBKG??`C_D??MKiCcBc@Y_@Ug@UkAe@??RwAPiA\\gBVwA@I??rBfA??`AiBHS??^TDDDFBD?B?DAFOZcAbB?@A@?@?@?B@?', '', 'unpaid', NULL),
(283, 211, 159, '2019-02-20 16:14:27', '2019-02-21 00:14:25', '2019-02-21 00:14:27', '6.614218500000001', '3.3583477999999998', '6.6357227', '3.3608957', 1, '341.05', 'cancelled', 'Ikeja City Mall, Obafemi Awolowo Way, Ikeja, Nigeria', 'LSDPC Estate, Omole Phase 1, Lagos, Nigeria', 'gzjg@cvnSMO??i@ZYR??GM??wArA??Wc@IMaBuCk@}@IMGKU]CEQUeBsCUa@[g@e@y@_@q@_@o@m@mASi@OYQg@??CMSHBLRl@d@hAl@hA^j@`@n@d@t@Tb@???HCJCDCBABWRUNGB_@R]PQJA@[P_@POJMF[N]PIDSL[TUFA@W?]DQ@k@?_@?]?E?c@?a@?[?UA{@Ca@@eBBG?c@Ac@Ac@Ac@AsA@sAA??UC?ZOpE??wBIkBK_BMq@Gq@Me@Ia@Ou@[m@YIEw@a@??@xBBfABjAHzBB\\Fh@Bf@ALCLENORWTKNELCHGVI`@??]K]MSE_@Ea@Cy@?W@O?q@Fa@DYFS@i@F_BPgHv@WB{FJ??t@oJ??k@EoAMOA]E]G_@I[KcA]gAg@mAk@UO]Uk@a@i@a@m@g@wBcBKG??`C_D??MKiCcBc@Y_@Ug@UkAe@??RwAPiA\\gBVwA@I??rBfA??`AiBHS??^TDDDFBD?B?DAFOZcAbB?@A@?@?@?B@?', '', 'unpaid', NULL),
(284, 212, 159, '2019-02-21 01:38:39', NULL, NULL, '6.5977955999999995', '3.3405853000000003', '6.614218500000001', '3.3583477999999998', 1, '314.8', 'booked', '1, Ikeja, Lagos', 'Ikeja City Mall, Obafemi Awolowo Way, Ikeja, Nigeria', 'gsgg@umkSsBbA}Ap@cAX??{HjDeAf@{Ar@_A`@kChAiBt@eA\\iA^qBn@cAR??AEMi@Ss@Sq@M]Sc@]k@[g@SYu@aAqAoBsBeDm@}@i@w@y@sAa@o@MUu@eA}AaCiA_B_AwAe@q@]a@_@a@g@a@g@_@qA{@??JU`@}@bBuCDG@Cj@w@NSb@o@h@s@\\a@tB}BdDsD\\Q^QDC??D@F?D?BADADCBABCBCBE@A?A@A?A?A@A?A@A?OAEAGCCACCAIIUE{@y@]]Q_@O_@O_@O]o@sAeAmB}@qA}@gAe@e@kAq@]UGC[Uc@Wo@[_@QgJkEm@]qBkAk@a@IGYU[WqAoAcAgAc@g@W[m@o@W_@EGWc@??@G@K?EAGEIi@iAo@}AHYNMLILQLAH?DH??CD??`@d@FHLNNVRZ??n@i@??PXPVRXNN@@?@?@?@KH??LN', '', 'unpaid', NULL),
(285, 213, 12, '2019-02-21 12:37:55', '2019-02-21 20:37:54', '2019-02-21 20:37:55', '6.6277631', '3.3569144', '6.6277631', '3.3569144', 1, '266.7', 'completed', '5 Ikeja Bridge, Lagos, Nigeria', 'Ikeja Along Busstop, Lagos, Nigeria', 'gsgg@umkShBy@f@UPGLEt@UTId@MDA@A`@K`@K@?`@EJCHCPCb@Gb@GXGP@P@??`@K`@KHCVG`@KTGbA]jA]|@WrBs@??@?@?@?@@@?@?@?B?D?\\f@HPHR`@tAbAbDJ`@J`@DTb@hB??w@d@mAl@gAh@k@R_@NKBCBC@C@C@C@C@C@C@C@C@C@CBC@C@C@C@E@C@C@C@C@C@UHs@RA@]Fa@Da@BQ@U?]Ca@Cy@G]@YBWB]FoBJ??@R@pA@h@FjFNhANZ?B@HAD?DCD??s@VmA^eATkBn@oBj@cD`A??L`@J`@??a@J_@La@Ja@La@J_@La@La@Ja@LYHE@C@mCz@[J_@La@L_@N??OBKBUFC@[HA?_@La@L_@La@L_@La@N_@La@Li@NsBj@??GFCBA@EBC@C@C@UNC@QVCBGNCJ?DADAJAP?F??L`@N^L`@DN??JPNPNLLJNFVDH?F?HAFAHCJEJEHER]T[R]R]R]LQR]R]@CR_@@Cf@y@T_@NQNSPOVS\\YJGPIXOf@QdA_@PG`@M^M`@M^M`@M`@M~FgBDA`@M`@K^K`@M`@K`@M`@K`@M^K`@K`@M`@K`@M`EcAvCy@', '', 'paid', '2019-02-21 20:37:55'),
(286, 214, 12, '2019-02-21 13:03:08', '2019-02-21 21:03:04', '2019-02-21 21:03:08', '6.6277631', '3.3569144', '6.6277631', '3.3569144', 1, '266.7', 'completed', '1, Ikeja, Lagos', 'Ikeja Along Busstop, Lagos, Nigeria', 'gsgg@umkShBy@f@UPGLEt@UTId@MDA@A`@K`@K@?`@EJCHCPCb@Gb@GXGP@P@??`@K`@KHCVG`@KTGbA]jA]|@WrBs@??@?@?@?@@@?@?@?B?D?\\f@HPHR`@tAbAbDJ`@J`@DTb@hB??w@d@mAl@gAh@k@R_@NKBCBC@C@C@C@C@C@C@C@C@C@CBC@C@C@C@E@C@C@C@C@C@UHs@RA@]Fa@Da@BQ@U?]Ca@Cy@G]@YBWB]FoBJ??@R@pA@h@FjFNhANZ?B@HAD?DCD??s@VmA^eATkBn@oBj@cD`A??L`@J`@??a@J_@La@Ja@La@J_@La@La@Ja@LYHE@C@mCz@[J_@La@L_@N??OBKBUFC@[HA?_@La@L_@La@L_@La@N_@La@Li@NsBj@??GFCBA@EBC@C@C@UNC@QVCBGNCJ?DADAJAP?F??L`@N^L`@DN??JPNPNLLJNFVDH?F?HAFAHCJEJEHER]T[R]R]R]LQR]R]@CR_@@Cf@y@T_@NQNSPOVS\\YJGPIXOf@QdA_@PG`@M^M`@M^M`@M`@M~FgBDA`@M`@K^K`@M`@K`@M`@K`@M^K`@K`@M`@K`@M`EcAvCy@', '', 'paid', '2019-02-21 21:03:08'),
(287, 215, 159, '2019-02-22 15:47:26', '2019-02-22 23:46:34', '2019-02-22 23:47:26', '6.6354455', '3.3617051', '6.6354455', '3.3617051', 1, '209.95', 'completed', 'Mega Chicken Agidingbi, Lateef Jakande Road, Ikeja, Nigeria', 'Ikeja City Mall, Obafemi Awolowo Way, Ikeja, Nigeria', 'idmg@e_nSIEGICGAI@M??zAt@h@Z|CzAp@\\`Af@TNTL^LXFZ@f@Cf@EP?lCOL?vBQzD]XA\\ERC~AK\\CTK~Hi@ZC`@E@?`@Cb@Eb@E@?RCJCTEJE\\M@A^QXMDC\\Q\\S\\Q^S\\SVMDCz@g@x@a@XOvAo@DC\\Qr@a@??RKqAoAcAgAc@g@W[m@o@W_@EGWc@??@G@K?EAGEIi@iAo@}AHYNMLILQLAH?DH??CD??`@d@FHLNNVRZ??n@i@??PXPVRXNN@@?@?@?@KH??LN', '', 'paid', '2019-02-22 23:47:26'),
(288, 215, 12, '2019-03-01 15:40:34', '2019-02-22 23:45:38', '2019-03-01 23:40:34', '6.6354455', '3.3617051', '6.6353556', '3.3619008', 1, '798.2', 'completed', 'Omole Phase 1, Lagos, Nigeria', 'Palmgrove Bus Stop, Shipeolu Street, Lagos, Nigeria', 'glog@{lnSSMaBaAwBmAo@c@i@e@]_@a@g@Ua@G]Ac@?SBUB]Jc@Pm@b@mAp@iBNo@Jg@B[@[?o@EcBI_EAU?EIgASuAIc@AMWaBESY{AQaAG]Ow@CQYgBG[[kBEe@AU?WPiBF]J{@Hq@JoA?CDo@@y@EeG??VGDAFADAB@D?F@FDDBn@r@ZZZVf@f@p@l@h@b@PLLBJBPBr@NZVjA~@~BfBrA`ApAv@~@j@RJ\\PlAp@dAh@lAj@xAp@dBn@~Ah@rA`@bAZ|A`@xBj@rCl@z@N|@PxBX^Dj@FV@n@HfBNjBLjAH|BHlADfB@pC?rCCfCMnBKtAKhAKfBSzAQvAUjASbB[rBc@vA]vA_@vAa@xAg@fAa@nBs@bCeAfCoAxBkAzBuA~@m@h@_@zC{BzAsAvAgAHGXS@AZU\\UZUZU\\UZUZURMZUZUZUp@g@xCsBhH_F~HkFl@c@lBmA\\UZUZUZWZUZUZU\\UZUZWVQZW\\UZUZUZUZWZUZSbAy@xAgAbEqCZUZWBCZUZUNI\\UZS\\UZU\\SZULGNMZUZU\\SZUZU\\UZUZU\\UZUZUZS??HAFANETK\\Qh@QZMx@[|@Un@Or@Mv@Kf@El@Gh@EvAEj@Cv@?P?bA@f@@^@bAHr@Jl@N`B`@??n@`@l@\\`Al@jC`B??pBr@jAt@t@f@~CpBxClBbAp@^VnCfBpKfH|BzArBpAbFbDlOzJTNTNdBjAxCpBfCbBbDrBhBjArA|@h@Zp@`@lAn@zBhAXJ~@^`Bl@`Bh@fBd@pBb@pCf@xAPp@FjALl@BrAHdCJtCF|@?bIEdCAzCEfHErTIR?nIIhC?`B?pACxAAlHEnB?ZA`IEzDCzFCnBAlEEx@AbDA|BAt@?dTOdA?', '', 'paid', '2019-03-01 23:40:34'),
(289, 216, NULL, '2019-03-01 15:40:23', '2019-03-01 23:08:06', '2019-03-01 23:40:23', '6.6353556', '3.3619008', '6.6353556', '3.3619008', 1, '767.35', 'completed', 'Omole Phase 1', 'Ikeja GRA', 'glog@{lnSSMaBaAwBmAo@c@i@e@]_@a@g@Ua@G]Ac@?SBUB]Jc@Pm@b@mAp@iBNo@Jg@B[@[?o@EcBI_EAU?EIgASuAIc@AMWaBESY{AQaAG]Ow@CQYgBG[[kBEe@AU?WPiBF]J{@Hq@JoA?CDo@@y@EeG??VGDAFADAB@D?F@FDDBn@r@ZZZVf@f@p@l@h@b@PLLBJBPBr@NZVjA~@~BfBrA`ApAv@~@j@RJ\\PlAp@dAh@lAj@xAp@dBn@~Ah@rA`@bAZ|A`@xBj@rCl@z@N|@PxBX^Dj@FV@n@HfBNjBLjAH|BHlADfB@pC?rCCfCMnBKtAKhAKfBSzAQvAUjASbB[rBc@vA]vA_@vAa@xAg@fAa@nBs@bCeAfCoAxBkAzBuA~@m@h@_@zC{BzAsAvAgAHGXS@AZU\\UZUZU\\UZUZURMZUZUZUp@g@xCsBhH_F~HkFl@c@lBmA\\UZUZUZWZUZUZU\\UZUZWVQZW\\UZUZUZUZWZUZSbAy@xAgAbEqCZUZWBCZUZUNI\\UZS\\UZU\\SZULGNMZUZU\\SZUZU\\UZUZU\\UZUZUZS??HAFANETK\\Qh@QZMx@[|@Un@Or@Mv@Kf@El@Gh@EvAEj@Cv@?P?bA@f@@^@bAHr@Jl@N`B`@??n@`@l@\\`Al@jC`B??pBr@jAt@t@f@~CpBxClBbAp@^VnCfBpKfH|BzArBpAbFbDlOzJTNTNdBjAxCpBfCbB??dBhB??zCjB^XpBjApBfAfDxAdCx@??NRDHDFDJ@DBJ?B@D?L?HSr@Y`AGXOp@m@fCu@tC]xAWdAi@dB[n@QZ_@b@g@b@[VYLm@Xc@N{Ad@SHsF`B{ExAaAZuBn@oBj@gAZ??HXdApDvAtEfCnIxAbF??A@A??@A@A?A@?@A@?@A@?@A@?@?@?@?@?@?@?@@@?@?@gSpF??AAAAAAAAA??AA?A?AAA?A?A?A?A?A?A?A?A??@A?A?A@C@?@A@A??@A@?@A@?B?@?@?@?@?@?@?@?@@@?@@@?@@@@??@@?@@@??@@?@@@?@?@?@?@?@?@?@?@?@A`@rAdAlD^pAl@vBd@`BvA|EPp@@TAJ?BCL', '', 'unpaid', NULL),
(290, 217, 159, '2019-02-28 23:57:49', NULL, NULL, '4', '3', '95.8484848484', '99', 1, '100', 'booked', 'Simbiat Abiola Way, Ikeja, null ffufhfhfhhfhf', 'Simbiat Abiola Way, Ikeja, nullfffufjjfjfjf', '_yfg@_bkS', '', 'unpaid', NULL),
(291, 218, 145, '2019-03-01 19:49:23', '2019-03-02 03:48:42', '2019-03-02 03:49:23', '6.4348214', '3.4632123', '6.534527199999999', '3.366926', 1, '1479.2', 'cancelled', '1, Lagos, Lagos', 'Onipanu Bus Stop, Lagos, Nigeria', 'qxgf@alcT?vA@rB??aDAgD???ArA?nAA~G@nG?bD@`D??C?C?A?E@E@I?eB???[AANEVCPCNEV??YGSCQCSASCOAUAU?a@Bm@FIBQDKBODMFOHQHMJMHIHMLMP_BbC}@rAi@p@IHKHMJQHQHUHQDMBM@Q@O@a@?iAEkCQ_ACUCQAMCSEKASIUIUMOKQOMMIKKQMUkA{CwAoDWq@m@{A}B{Fk@oAKYM]Mc@YgAYqAQgAIs@??BABC@CBC@C@E?C@E?C?CAE?CAEACCCACCCCACAGCCAA?C?AAC?A?C@A?C?E@C@CBC@CBABCBABABAD?B?D?B?BBHA?}AdASNUPOPc@h@eFdIwBjDSb@Uf@Qh@Oj@Q|@CRE\\Eb@A^Af@?T@`@FvAVzFNfDBb@Bb@Bb@@b@Bb@@F@Z@b@Bb@Bb@@b@Bb@Bb@@b@Bb@@Z@F@b@Bb@Bb@@Z@F?FAHAH?FEL??A@A@C@ABA@A@AB?@YBK?Y?w@?a@@c@@iERY@WBWFMBMFQHMFQJKHGFKLcDjEMLKLQPUPa@VwEdC[R_@V[VUVQRQVKPKRGPGPGTEPGX??CZAV@T?J@LBNDRBJBHFP\\t@Xd@b@dAFJFNZj@FLt@bBR`@L\\Rl@Pn@H`@DXF\\BP@RBTBb@@^?R?TA^Eh@ARCNE^EVEVGTOh@?FAFKZGNKTMTKPKRKNILGJONGFSPg@^s@d@{B~AkAx@kCtBc@XaAv@WRQJMFQHODSDQDM@K?M@KAUAE?C?IBC?CB??AAAAA?A??AA?A?A?A?A??@A?A?A@A@A@?@A??@?@?@?@?@?@?@Md@CLEPCLUx@[dAOh@c@xAa@rAOj@ERCLELOh@??W~@On@[jAq@jCc@jBuAhFq@rCEP_AvDCNM`@K`@K`@K`@M`@K`@K`@GRCLK`@K`@K`@CJGTK`@Kb@K`@K`@K`@CHGV?@GXAFG`@I`@CLET?BG^AHCVADARAHCb@?BC^Ab@?FA\\?DAX@H?\\?D@b@?J@XBb@?LBT?FBZFb@D`@BPBP@FFZH`@H`@BNDRH`@J`@@DRt@^zALd@Rn@L^f@pA\\|@d@dAdA~BxCxFlAnB|ElInCtEhDdGZn@??Rl@Pf@Lh@Hl@Dl@Bl@?p@?~@AfAAfACt@Ch@E`@Gf@GZGVETOf@GTERALAP??Ob@Of@Kb@Kh@Kp@Eb@E`@KdCMxEElAEjAG|@Ep@It@Mz@Kl@[`BMf@K`@Qf@g@|A[z@Wl@]t@k@bAgAlBs@fA{@rAc@j@OViB|BgArA{@bA{AlBoAjAy@v@}@p@s@j@}@n@_@Vg@ZyAz@yAr@g@Tg@PaA\\gCz@sA`@iAZw@RuBd@u@NyAV}@LcANkAL_AJ}@HcAF_ADgBH}BDiA@iA@uACqBCwBKoDSoDa@aBSk@Kq@Ky@Q}@ScG_B{Bw@iAc@}B}@gBw@kBu@yCyAgB_AoHqDeB{@c@UKGeGsCWOWOqAm@}DqByBeAiKeFsD{A_C{@_Bi@gA]w\\eJqo@sPeIiBiHkAyH}@yGe@_J]uIG_GHoJb@wJz@qHfAeKrByInBaKxBsFlAyCr@kJtB}HbBkHtAoFx@sD`@mHl@qL`AuEh@gDn@{Cp@_Dx@{CdAwCx@qA^mBf@??IAG?G@K@OBMBS@U@W?sA@i@BY@a@DYBSD[FYJ]LYLSHYROL_@Z[^W\\]l@Uh@Y`AKp@K`AE^Cf@GjB??@b@?X@H@b@@LBTDb@?@F`@BRBNH`@?BF\\Hb@H`@Hb@H`@F\\Hb@H`@H`@Hb@H`@Hb@@HFVFb@H`@Fb@H`@Hb@F`@Hb@@BF\\H`@Hb@H`@@FFZFVXfB^vBn@nDTfAF\\v@fEPdAJn@LdAFz@F`ABj@?dA?r@?h@E|@ElAUpBKp@Ib@UbAW~@[`AWt@u@|A_@l@i@|@g@n@a@h@qB|B_CzBgEfE{@x@iCjCsBvBcF|EgCfCaA`AmBnBm@j@qAnAcAhA_AnAA@a@n@a@x@Q`@Sd@Sn@c@|AQ|@G`@Kr@Ep@Cf@Ax@Cv@@rA??Y`@MPMJMFMDK@K@K?O?O?OCOEKGKIGIEGEKEMCM?I?K@GDMZe@??jBFhAD??`A]R?nIIhC?`B?pACxAAlHEnB?ZA`IEzDCzFCnBAlEEx@AbDA|BAt@?dTO`UK|ECzCC??\\VtA@rDG', '', 'unpaid', NULL),
(292, 219, 145, '2019-03-01 19:50:39', '2019-03-02 03:50:22', '2019-03-02 03:50:39', '6.4351449999999994', '3.4141611999999997', '6.534527199999999', '3.366926', 1, '1213.95', 'cancelled', '16, Lagos, Lagos', 'Onipanu Bus Stop, Lagos, Nigeria', 'w{gf@yyyS?@CDY\\C@E@A?M???Kp@O|@CREPa@bB?BQt@CVEXEb@Ch@Ar@?d@@^FnABb@??_@Fa@Fc@Da@Bg@@UA]Ag@ASCaAGe@C??QCATCh@?b@?j@Db@D^F^FXHXJXL^Xj@dAfC??A@A@A@A@?@A@?@?@AB?@i@`@q@h@]ZMNGFc@j@_@h@[d@Yf@Q\\EPGNIZ??EH{CzEuAzBUb@w@pAc@x@[f@a@p@k@bA??UZUZQT??YXGFOPGDQRCBSTEDQRYXWXYXUTQPKJUZGHc@p@??@DBJBHJ\\DLFJ@BBBDBD?H?NA??VWh@i@BC^_@X_@V[TYXc@R_@Pc@La@Ha@Hg@D_@Bg@@e@Ac@Ca@Ek@G_@Ka@Me@Qe@Yq@Sa@[m@o@aAa@e@_@e@Y[_@a@g@e@g@a@m@c@u@i@iAs@QKQKqAk@u@W[Mk@Qo@Qi@Os@OQCwASc@Gu@IuEi@eEe@e@Gg@GwAMaEc@qDc@oDc@wBQs@@q@AkABy@Fw@Ho@L{@PqA`@cA^{A|@cAx@WTUTY\\]`@SVSZS\\Wj@Yp@Ob@Of@Kb@Kh@Kp@Eb@E`@KdCMxEElAEjAG|@Ep@It@Mz@Kl@[`BMf@K`@Qf@g@|A[z@Wl@]t@k@bAgAlBs@fA{@rAc@j@OViB|BgArA{@bA{AlBoAjAy@v@}@p@s@j@}@n@_@Vg@ZyAz@yAr@g@Tg@PaA\\gCz@sA`@iAZw@RuBd@u@NyAV}@LcANkAL_AJ}@HcAF_ADgBH}BDiA@iA@uACqBCwBKoDSoDa@aBSk@Kq@Ky@Q}@ScG_B{Bw@iAc@}B}@gBw@kBu@yCyAgB_AoHqDeB{@c@UKGeGsCWOWOqAm@}DqByBeAiKeFsD{A_C{@_Bi@gA]w\\eJqo@sPeIiBiHkAyH}@yGe@_J]uIG_GHoJb@wJz@qHfAeKrByInBaKxBsFlAyCr@kJtB}HbBkHtAoFx@sD`@mHl@qL`AuEh@gDn@{Cp@_Dx@{CdAwCx@qA^mBf@??IAG?G@K@OBMBS@U@W?sA@i@BY@a@DYBSD[FYJ]LYLSHYROL_@Z[^W\\]l@Uh@Y`AKp@K`AE^Cf@GjB??@b@?X@H@b@@LBTDb@?@F`@BRBNH`@?BF\\Hb@H`@Hb@H`@F\\Hb@H`@H`@Hb@H`@Hb@@HFVFb@H`@Fb@H`@Hb@F`@Hb@@BF\\H`@Hb@H`@@FFZFVXfB^vBn@nDTfAF\\v@fEPdAJn@LdAFz@F`ABj@?dA?r@?h@E|@ElAUpBKp@Ib@UbAW~@[`AWt@u@|A_@l@i@|@g@n@a@h@qB|B_CzBgEfE{@x@iCjCsBvBcF|EgCfCaA`AmBnBm@j@qAnAcAhA_AnAA@a@n@a@x@Q`@Sd@Sn@c@|AQ|@G`@Kr@Ep@Cf@Ax@Cv@@rA??Y`@MPMJMFMDK@K@K?O?O?OCOEKGKIGIEGEKEMCM?I?K@GDMZe@??jBFhAD??`A]R?nIIhC?`B?pACxAAlHEnB?ZA`IEzDCzFCnBAlEEx@AbDA|BAt@?dTO`UK|ECzCC??\\VtA@rDG', '', 'unpaid', NULL),
(293, 220, 145, '2019-03-01 19:54:38', '2019-03-02 03:53:03', '2019-03-02 03:54:38', '6.460739299999999', '3.2037359999999997', '6.534527199999999', '3.366926', 1, '1549.15', 'cancelled', '16 Lagos - Badagry Expressway, Lagos, Nigeria', 'Onipanu Bus Stop, Lagos, Nigeria', 'sulf@u}uRARAb@?JAj@?fA??lAK@K?E?E?W@[@[AS?Y?e@?o@@a@Bc@Bc@?KBWBa@?A@]@EBW@K?KBM@I?K??Fa@BY@IFc@Ha@Fc@Hc@Fa@@Ct@qDLs@n@}Bp@_Df@wCp@wC\\aBnBsK|AaItAyG??F?T?L?V?J?D?J@JBD?D@ZFv@NbAR??N_@P_@@GP_@N_@N_@N_@P_@N_@N_@@AL_@N_@N_@N_@@EL[DKAG?CAGEIQYGKKUEOAM?E?E?GBc@JoAJ{A?q@AY?UQ_CG{@MkAQiBI}@i@yFKoAMuACe@AKASC}@Ak@C{BWkMCkA?c@Cq@MwAGu@E]E[My@QiAMy@?GEU_@wCm@uDAKg@eEO}A]oCKkAGiAC_AQaZE{BCeEGyCEeCOgG??eCZiAl@??Ce@AUAQGc@I_@G_@Kw@Ci@Ek@UkEIgAEq@MsBG{@GeAGcAIkAG{@Gw@OoCQoCWqDEm@GcAIuAIwAIgAEs@K{AUsDQmCSoCG}@AKAIc@oHOkCMiBEiACs@Ai@Aa@?a@?i@BaDAwL?yB?oDA_G@oI?kE@{G?{G?kBAmF@{D@_B?_@A[As@EwDCcC?}@@uB?wFDgG?I?wE@Q?yA?}AAwCEgBCiAA[??C_AEeCAi@AkA@cACoDAs@??\\[JETIHATARDF@DBHBDDLJFLHNBN@TATGTINCDGFEBKFSJODm@Ga@Ee@E?Au@IoB_@_@Iy@U}@W{@YoAg@_@M_CqAmAu@YS??UDSOsAcAeByA_CqB{@w@sDaD}@w@y@s@eDwCiLeK{AqAmAiAs@k@{AmAgBqAeAq@uAy@k@Yw@_@gDwAcCy@kBk@kBe@_Ey@iBYg@Gs@GmBOyBM{@AcAAoBAW?sADuBH_BFcBJw@Fy@HWB_@Du@Lo@LiB\\e@J}Bl@m@PoA`@mAb@{@\\uAl@_A^oAh@}@`@OHiBv@_Br@cAd@yGxC_Bp@u@XcCjAeEbB_Bh@}@Zu@Pw@P[J{A\\eANu@Jg@Hq@Du@BaADkC@mBCsBMaAIcBSo@IgGmA_Cg@iFeAcDq@sCq@eDy@{Cu@WEe@MuD}@yA_@sA_@y@Wa@Ms@Wu@[q@[g@Wg@YWO[UcAu@_@[[Yq@s@]]Y][e@W]Wa@SYUc@Sa@{@kBm@aBqCoHm@aB{@mBQ[c@}@g@{@c@s@a@m@e@k@o@q@q@q@WUg@e@WS[Qa@Wi@Ye@YqAk@oAg@cA[a@I[KYGg@Kw@Oq@Ku@Gy@KuBMgCKqEUwJe@UAgAE_AGuBIqEUiGYaCMa@CsDO_ESqEUqEScDSwZ}AoESeCMsCOyBK{F]{FWeEMyAAyJ?eCIyAQ{@Me@Ku@S_AWqAc@e@S_Ai@q@c@}@m@w@s@m@q@UW[c@S[[g@Wi@Ui@O_@a@gAu@uB{@iCmAsDK[sAgEiDmK_FoO]eAmBmHSw@Uw@g@}AeA{CkEsMc@qA??@i@Ma@Qg@Um@q@qBa@uAOu@K{@MyAEeACk@GqEBcD?wA??f@@vCBp@G??MaCAGBw@?G@GDg@BqCG_JCuCE{BAuA??r@AbEGbGEv@AjBC`EE~A@|@?dCAdCAhCE??j@YzFCnBAlEEx@AbDA|BAt@?dTO`UK|ECzCC??\\VtA@rDG', '', 'unpaid', NULL),
(294, 221, 159, '2019-03-02 11:43:41', '2019-03-02 19:43:11', '2019-03-02 19:43:41', '6.614218500000001', '3.3583477999999998', '6.626188699999999', '3.3535283999999996', 1, '197.2', 'cancelled', 'Ikeja City Mall, Obafemi Awolowo Way, Ikeja, Nigeria', 'Mega Chicken Agidingbi, Lateef Jakande Road, Ikeja, Nigeria', 'gzjg@cvnSMO??i@ZYR??GM??wArA??Wc@IMaBuCk@}@IMGKU]CEQUeBsCUa@[g@e@y@_@q@_@o@m@mASi@OYQg@??CMSHBLRl@d@hAl@hA^j@`@n@d@t@Tb@???HCJCDCBABWRUNGB_@R]PQJA@[P_@POJMF[N]PIDSL[TUFA@W?]DQ@k@?_@?]?E?c@?a@?[?UA{@Ca@@eBBG?c@Ac@Ac@Ac@AsA@sAA??UC?ZOpE??wBIkBK_BMq@Gq@Me@Ia@Ou@[m@YIEw@a@??@xBBfABjAHzBB\\Fh@Bf@ALCLENORWTKNELCHGVI`@??]K]MSE_@Ea@C??AL^B\\DRFXJZLh@T|At@??AL@HBFFHHD', '', 'unpaid', NULL),
(295, 222, 159, '2019-03-02 12:08:04', '2019-03-02 20:07:59', '2019-03-02 20:08:04', '6.6018975', '3.3610686', '6.626188699999999', '3.3535283999999996', 1, '296.0', 'cancelled', 'Olaniiji Street,10', 'Mega Chicken Agidingbi, Lateef Jakande Road, Ikeja, Nigeria', '_lhg@ymoSOeBImA??oCXe@DE?[CM???KUWe@SY??PKZS\\U\\S??KKgAkAq@q@a@[_A}@u@w@a@c@yAeB}AmBo@u@KM??cAvAqBrCw@hAmBvCUZU\\SZU\\OTEDS\\S\\S\\IN??TPVV@@XVZVXVXVZVXVZVXXXVZVXVXVZVTTBB??QTGFORWXWZWXWZWXWZEFYXGJONWXIJMNUZUZABQXS\\CDMXILGNO`@GNGNM^ABK\\I\\ABU|@I`@CNQv@Il@Eb@Gb@?@C^Cb@Cb@Eb@EZADCPEPK`@K`@A@K^ABKZM`@KXADMXAFMV??IFGBK@A@K@WBC@c@Wo@[_@QgJkEm@]qBkAk@a@IGYU[W??SJs@`@]PEBwAn@YNy@`@{@f@EBWL]R_@R]P]R]PEBYL_@PA@]LKDUDKBSBA?c@Dc@Da@BA?a@D[B_Ih@WESBc@Ba@Bc@DUB]BU@]Ba@B}BNqALe@DyCTU?g@Bg@?]CYG_@OUOWQw@a@g@Y}CuAw@]iAk@_B{@k@Y]K]MSE_@Ea@C??AL^B\\DRFXJZLh@T|At@??AL@HBFFHHD', '', 'unpaid', NULL),
(296, 223, 159, '2019-03-02 12:19:42', '2019-03-02 20:19:18', '2019-03-02 20:19:42', '6.6018975', '3.3610686', '6.626188699999999', '3.3535283999999996', 1, '296.0', 'cancelled', 'Olaniiji Street,10', 'Mega Chicken Agidingbi, Lateef Jakande Road, Ikeja, Nigeria', '_lhg@ymoSOeBImA??oCXe@DE?[CM???KUWe@SY??PKZS\\U\\S??KKgAkAq@q@a@[_A}@u@w@a@c@yAeB}AmBo@u@KM??cAvAqBrCw@hAmBvCUZU\\SZU\\OTEDS\\S\\S\\IN??TPVV@@XVZVXVXVZVXVZVXXXVZVXVXVZVTTBB??QTGFORWXWZWXWZWXWZEFYXGJONWXIJMNUZUZABQXS\\CDMXILGNO`@GNGNM^ABK\\I\\ABU|@I`@CNQv@Il@Eb@Gb@?@C^Cb@Cb@Eb@EZADCPEPK`@K`@A@K^ABKZM`@KXADMXAFMV??IFGBK@A@K@WBC@c@Wo@[_@QgJkEm@]qBkAk@a@IGYU[W??SJs@`@]PEBwAn@YNy@`@{@f@EBWL]R_@R]P]R]PEBYL_@PA@]LKDUDKBSBA?c@Dc@Da@BA?a@D[B_Ih@WESBc@Ba@Bc@DUB]BU@]Ba@B}BNqALe@DyCTU?g@Bg@?]CYG_@OUOWQw@a@g@Y}CuAw@]iAk@_B{@k@Y]K]MSE_@Ea@C??AL^B\\DRFXJZLh@T|At@??AL@HBFFHHD', '', 'unpaid', NULL),
(297, 224, 159, '2019-03-02 12:20:50', '2019-03-02 20:20:35', '2019-03-02 20:20:50', '6.6018975', '3.3610686', '6.626188699999999', '3.3535283999999996', 1, '296.0', 'cancelled', 'Olaniiji Street,10', 'Mega Chicken Agidingbi, Lateef Jakande Road, Ikeja, Nigeria', '_lhg@ymoSOeBImA??oCXe@DE?[CM???KUWe@SY??PKZS\\U\\S??KKgAkAq@q@a@[_A}@u@w@a@c@yAeB}AmBo@u@KM??cAvAqBrCw@hAmBvCUZU\\SZU\\OTEDS\\S\\S\\IN??TPVV@@XVZVXVXVZVXVZVXXXVZVXVXVZVTTBB??QTGFORWXWZWXWZWXWZEFYXGJONWXIJMNUZUZABQXS\\CDMXILGNO`@GNGNM^ABK\\I\\ABU|@I`@CNQv@Il@Eb@Gb@?@C^Cb@Cb@Eb@EZADCPEPK`@K`@A@K^ABKZM`@KXADMXAFMV??IFGBK@A@K@WBC@c@Wo@[_@QgJkEm@]qBkAk@a@IGYU[W??SJs@`@]PEBwAn@YNy@`@{@f@EBWL]R_@R]P]R]PEBYL_@PA@]LKDUDKBSBA?c@Dc@Da@BA?a@D[B_Ih@WESBc@Ba@Bc@DUB]BU@]Ba@B}BNqALe@DyCTU?g@Bg@?]CYG_@OUOWQw@a@g@Y}CuAw@]iAk@_B{@k@Y]K]MSE_@Ea@C??AL^B\\DRFXJZLh@T|At@??AL@HBFFHHD', '', 'unpaid', NULL),
(298, 225, 159, '2019-03-02 12:23:16', '2019-03-02 20:22:19', '2019-03-02 20:23:16', '6.63532947', '3.36188358', '6.63532947', '3.36188358', 1, '296.0', 'cancelled', 'Olaniiji Street,10', 'Mega Chicken Agidingbi, Lateef Jakande Road, Ikeja, Nigeria', '_lhg@ymoSOeBImA??oCXe@DE?[CM???KUWe@SY??PKZS\\U\\S??KKgAkAq@q@a@[_A}@u@w@a@c@yAeB}AmBo@u@KM??cAvAqBrCw@hAmBvCUZU\\SZU\\OTEDS\\S\\S\\IN??TPVV@@XVZVXVXVZVXVZVXXXVZVXVXVZVTTBB??QTGFORWXWZWXWZWXWZEFYXGJONWXIJMNUZUZABQXS\\CDMXILGNO`@GNGNM^ABK\\I\\ABU|@I`@CNQv@Il@Eb@Gb@?@C^Cb@Cb@Eb@EZADCPEPK`@K`@A@K^ABKZM`@KXADMXAFMV??IFGBK@A@K@WBC@c@Wo@[_@QgJkEm@]qBkAk@a@IGYU[W??SJs@`@]PEBwAn@YNy@`@{@f@EBWL]R_@R]P]R]PEBYL_@PA@]LKDUDKBSBA?c@Dc@Da@BA?a@D[B_Ih@WESBc@Ba@Bc@DUB]BU@]Ba@B}BNqALe@DyCTU?g@Bg@?]CYG_@OUOWQw@a@g@Y}CuAw@]iAk@_B{@k@Y]K]MSE_@Ea@C??AL^B\\DRFXJZLh@T|At@??AL@HBFFHHD', '', 'paid', '2019-03-02 20:22:34'),
(299, 226, 145, '2019-03-02 13:52:05', '2019-03-02 21:51:40', '2019-03-02 21:52:05', '6.516826699999999', '3.3550163', '6.534527199999999', '3.366926', 1, '297.05', 'cancelled', '8, Lagos, Lagos', 'Onipanu Bus Stop, Lagos, Nigeria', '{wwf@wgnSA`@CLAFADCFEHc@h@Yb@??v@JLBJD??JDnByBhAkAXWPS\\a@h@m@jAkA`@_@VULQHMFMFSFQJg@Py@FQFQHSHQNULOJMhA{@n@g@TSJMJM??GGoF{GU[]c@qAaBWMWMe@MiDs@MC}Bi@w@QaH_B[GGAq@MYGMEOGOISKMKKIKMOa@c@oA]mAmAyDCIAG??GMgBz@iD|AqB~@qAn@w@`@QJSLWPWRKH[Z_@\\_@b@QTORY^S\\??QOc@[aBmAsBgBc@a@MMGK_@_A??gA`@s@dA??EDMT{@pAqAfBi@x@_@n@]p@Sl@CFEF??a@^YTQLyDrB??eAkBcAmBEIg@aAg@iAQe@@YOcAKi@??IUAMEIESGMCIKUQ_@GGYY[WYWYWSSGC]S[UQMe@k@U[W[U[CEQ[??EJGFGFEBKFgFd@kBXm@FoBPsBR??Y}BCg@A[AsA?wCEeB??hBAtA@rDG', '', 'unpaid', NULL),
(300, 227, 145, '2019-03-02 13:52:46', '2019-03-02 21:52:38', '2019-03-02 21:52:46', '6.516826699999999', '3.3550163', '6.595539', '3.3990991', 1, '728.9', 'cancelled', '8, Lagos, Lagos', 'Abiola Bus Stop, Demurin Street, Lagos, Nigeria', '{wwf@wgnSA`@CLAFADCFEHc@h@Yb@??v@JLBJD??JDnByBhAkAXWPS\\a@h@m@jAkA`@_@VULQHMFMFSFQJg@Py@FQFQHSHQNULOJMhA{@n@g@TSJMJMj@q@JKFGHEFCHENCF?H?L?H?B@B?D@F@BBNF??JDBQPw@HUHQJUNWZ_@r@k@PONOLMHQJQFQZyB`@{Bb@oDDUBU@G??BOFi@BKQAk@Kc@Im@OaCm@kCm@??iBYE?E?E?GBG@??{GsAwBe@uD}@wCm@[GYGYIe@Kg@Oa@I[Oe@SYO]QYSk@c@u@q@y@y@[YOMQOkA}@YMUM]MSGu@G_AAw@@s@?wEFoC@_D?eIBcDBmHBuMNuPDsH@eKHkA?q]VwB?yGFiB@{HFwCB{G@I?uHDgA@iC@gJFwD?i@?}KJs@@cDDoB?qDFiIAaGDaGD{HD{A@gC@mCBmB?qA?oAAmBG{CS_AIkAKyASu@KiAUuAWcAWs@SiBi@k@Um@Sw@[kAg@qAm@{Ay@wAy@aAq@iAu@_EkCWMiHwEq@e@s@e@WOWQgIiFkD}B{AcA{ByAw@g@y@i@w@i@CAaC}AeJcGa@WqFoDcBeAyBwAqBuAwA_AUQ{BwAqBqAkBkAMI_Ao@sDeCgBkAy@g@kBmAc@Y??Ii@QMiAu@SM[U]S[U]U]S[U]U[S]U[SIGSM]UuA}@WQ]S]U[S]U]S[SUOGE[U]S[UIGQM[WKI[U[WOMIG??JS\\m@b@y@d@aAFMZ_AHc@F[Fo@F}@D{@@IDc@@KDUFc@Fc@DSF_@V}AF]B]@Q?Q?QAIAKEUIYEUEUC[Eq@G{@Cm@@UCu@?YAQ?K@OBa@@S@ODc@@S@O?A@K@K?I?C?I@U?G@G@[@IBOPg@La@N_@N_@La@N_@La@@?DQ@KBITqAAWdA}ELk@Rk@t@iAJW', '', 'unpaid', NULL),
(301, 228, NULL, '2019-03-02 17:47:30', '2019-03-03 01:47:27', '2019-03-03 01:47:30', '6.63532997', '3.36182222', '6.63532997', '3.36182222', 1, '100', 'completed', 'Covenant University Guest House', 'Covenant University Swimming Pool', 'sbvg@kvhRCn@??s@@wBLeIb@uAF', '', 'unpaid', NULL),
(302, 228, NULL, '2019-03-02 17:47:29', '2019-03-03 01:47:25', '2019-03-03 01:47:29', '6.63532997', '3.36182222', '6.63532997', '3.36182222', 3, '200', 'completed', 'Covenant University Guest House', 'Covenant University Swimming Pool', 'sbvg@kvhRCn@??s@@wBLeIb@uAF', '', 'unpaid', NULL),
(303, 229, NULL, '2019-03-02 18:01:27', '2019-03-03 02:01:26', '2019-03-03 02:01:27', '6.6353556', '3.3619008', '6.6353556', '3.3619008', 1, '100', 'completed', 'Covenant University Guest House', 'Covenant University Swimming Pool', 'sbvg@kvhRCn@??s@@wBLeIb@uAF', '', 'unpaid', NULL),
(304, 229, NULL, '2019-03-02 18:01:23', '2019-03-03 02:01:22', '2019-03-03 02:01:23', '6.6353556', '3.3619008', '6.6353556', '3.3619008', 1, '100', 'completed', 'Covenant University Guest House', 'Covenant University Swimming Pool', 'sbvg@kvhRCn@??s@@wBLeIb@uAF', '', 'unpaid', NULL),
(305, 229, NULL, '2019-03-02 18:01:09', '2019-03-03 02:01:08', '2019-03-03 02:01:09', '6.6353556', '3.3619008', '6.6353556', '3.3619008', 1, '100', 'completed', 'Covenant University Swimming Pool', 'Covenant University Guest House', '_uvg@_shRtAGdIc@vBMr@A??Bo@', '', 'unpaid', NULL),
(306, 229, NULL, '2019-03-02 18:01:19', '2019-03-03 02:01:16', '2019-03-03 02:01:19', '6.6353556', '3.3619008', '6.6353556', '3.3619008', 1, '100', 'completed', 'Covenant University Guest House', 'Covenant University Swimming Pool', 'sbvg@kvhRCn@??s@@wBLeIb@uAF', '', 'unpaid', NULL),
(307, 229, NULL, '2019-03-02 18:01:13', '2019-03-03 02:01:12', '2019-03-03 02:01:13', '6.6353556', '3.3619008', '6.6353556', '3.3619008', 1, '100', 'completed', 'Covenant University Guest House', 'Covenant University Swimming Pool', 'sbvg@kvhRCn@??s@@wBLeIb@uAF', '', 'unpaid', NULL),
(308, 230, NULL, '2019-03-02 17:57:21', '2019-03-03 01:57:18', '2019-03-03 01:57:21', '6.63521683', '3.36178006', '6.63521683', '3.36178006', 1, '100', 'completed', 'Ikeja City Mall', 'Shoprite Ikeja City Mall', 'gzjg@cvnSFHNP', '', 'unpaid', NULL),
(309, 230, NULL, '2019-03-02 17:57:17', '2019-03-03 01:57:15', '2019-03-03 01:57:17', '6.63521683', '3.36178006', '6.63521683', '3.36178006', 1, '100', 'completed', 'Ikeja City Mall', 'Shoprite Ikeja City Mall', 'gzjg@cvnSFHNP', '', 'unpaid', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cab_trip`
--

CREATE TABLE `cab_trip` (
  `ct_id` int(11) NOT NULL,
  `ct_driver_id` int(11) DEFAULT '0',
  `ct_date` varchar(20) DEFAULT NULL,
  `ct_time` varchar(100) DEFAULT NULL,
  `ct_trip_start` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ct_trip_end` timestamp NULL DEFAULT NULL,
  `ct_trip_start_from` text,
  `ct_trip_start_to` varchar(50) DEFAULT NULL,
  `ct_trip_end_location` varchar(50) DEFAULT NULL,
  `ct_trip_type` varchar(50) NOT NULL DEFAULT 'live',
  `ct_is_pooling` varchar(11) NOT NULL DEFAULT 'yes' COMMENT '1 = yes , 0 = no',
  `ct_trip_status` varchar(50) NOT NULL DEFAULT 'booked',
  `ct_remarks` varchar(255) DEFAULT NULL,
  `ct_payment_status` varchar(50) DEFAULT NULL,
  `ct_amount` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cab_trip`
--

INSERT INTO `cab_trip` (`ct_id`, `ct_driver_id`, `ct_date`, `ct_time`, `ct_trip_start`, `ct_trip_end`, `ct_trip_start_from`, `ct_trip_start_to`, `ct_trip_end_location`, `ct_trip_type`, `ct_is_pooling`, `ct_trip_status`, `ct_remarks`, `ct_payment_status`, `ct_amount`) VALUES
(181, 49, '2019-01-25', NULL, '2019-01-25 13:59:49', '2019-01-25 21:59:49', 'Workbay, Lagos, Nigeria', 'Ikeja City Mall, Obafemi Awolowo Way, Ikeja, Niger', NULL, 'live', 'yes', 'completed', '', 'pending', '241.2'),
(182, 49, '2019-01-25', NULL, '2019-01-25 14:13:28', '2019-01-25 22:13:28', 'Lagos-Epe Express Road, Lagos, Nigeria', 'Victoria Island, Lagos, Nigeria', NULL, 'live', 'yes', 'completed', '', 'pending', '581.8'),
(183, 49, '2019-01-25', NULL, '2019-01-25 14:16:20', '2019-01-25 22:16:20', 'Lagos-Epe Express Road, Lagos, Nigeria', 'Victoria Island, Lagos, Nigeria', NULL, 'live', 'yes', 'completed', '', 'pending', '581.8'),
(184, 49, '2019-01-25', NULL, '2019-01-25 14:18:56', '2019-01-25 22:18:56', '2a, Ikeja, Lagos', 'Alausa, Ojodu, Nigeria', NULL, 'live', 'yes', 'completed', '', 'pending', '339.5'),
(185, 49, '2019-01-25', NULL, '2019-01-25 14:20:49', '2019-01-25 22:20:49', '9 Ikeja Along Overpass, Ikeja, Nigeria', 'Alausa, Ojodu, Nigeria', NULL, 'live', 'yes', 'completed', '', 'pending', '386.55'),
(186, 49, '2019-01-25', NULL, '2019-01-25 14:30:22', '2019-01-25 22:30:22', 'Alausa, Ikeja, Nigeria', 'Magodo GRA Phase I, Lagos, Nigeria', NULL, 'live', 'yes', 'completed', '', 'pending', '372.75'),
(187, 49, '2019-01-25', NULL, '2019-01-25 14:32:49', '2019-01-25 22:32:49', '2a, Ikeja, Lagos', 'Alausa, Ojodu, Nigeria', NULL, 'live', 'yes', 'completed', '', 'pending', '289.5'),
(188, 49, '2019-01-25', NULL, '2019-01-25 15:43:32', '2019-01-25 23:43:32', 'Ikeja City Mall, Obafemi Awolowo Way, Ikeja, Nigeria', 'Alausa, Ojodu, Nigeria', NULL, 'live', 'yes', 'completed', '', 'pending', '185.35'),
(189, 49, '2019-01-25', NULL, '2019-01-25 16:22:30', '2019-01-26 00:22:30', '2a Ikeja Bridge, Lagos, Nigeria', 'Alausa, Ojodu, Nigeria', NULL, 'live', 'yes', 'completed', '', 'pending', '742.0'),
(190, 49, '2019-01-25', NULL, '2019-01-28 13:01:36', '2019-01-28 21:01:36', 'Magodo Brooks Estate, Lagos, Nigeria', 'Alausa, Ojodu, Nigeria', NULL, 'live', 'yes', 'completed', '', 'pending', '316.4'),
(191, 49, '2019-01-28', NULL, '2019-01-29 13:39:50', '2019-01-29 21:39:50', 'Workbay, Lagos, Nigeria', 'Shoprite Ikeja City Mall, Obafemi Awolowo Way, Ike', NULL, 'live', 'yes', 'completed', '', 'pending', '242.25'),
(192, 49, '2019-02-09', NULL, '2019-02-09 13:16:20', '2019-02-09 21:16:20', '3, Lagos, Lagos', 'FESTAC Police Station, 2nd Avenue, Lagos, Nigeria', NULL, 'live', 'yes', 'completed', '', 'pending', '100.0'),
(193, 49, '2019-02-09', NULL, '2019-02-09 14:05:05', '2019-02-09 22:05:05', '3, Lagos, Lagos', 'Festac Access Road, Lagos, Nigeria', NULL, 'live', 'yes', 'completed', '', 'pending', '100.0'),
(194, 49, '2019-02-09', NULL, '2019-02-09 14:08:40', '2019-02-09 22:08:40', 'LSPDC Medium Estate Phase 4 Ogba, Lagos, Nigeria', 'Mega Chicken Agidingbi, Lateef Jakande Road, Ikeja', NULL, 'live', 'yes', 'completed', '', 'pending', '332.5'),
(195, 49, '2019-02-09', NULL, '2019-02-09 14:13:23', '2019-02-09 22:13:23', 'Omole Phase 1, Lagos, Nigeria', 'Mega Chicken Agidingbi, Lateef Jakande Road, Ikeja', NULL, 'live', 'yes', 'completed', '', 'pending', '187.2'),
(196, 49, '2019-02-09', NULL, '2019-02-09 15:35:44', '2019-02-09 23:35:44', 'Omole Phase 1, Lagos, Nigeria', 'Mega Chicken Agidingbi, Lateef Jakande Road, Ikeja', NULL, 'live', 'yes', 'completed', '', 'pending', '187.2'),
(197, 49, '2019-02-09', NULL, '2019-02-19 12:44:22', '2019-02-19 20:44:22', 'Mega Chicken Agidingbi, Lateef Jakande Road, Ikeja, Nigeria', 'Omole Phase 1, Lagos, Nigeria', NULL, 'live', 'yes', 'completed', '', 'pending', '200.0'),
(198, 49, '2019-02-19', NULL, '2019-02-20 15:13:19', '2019-02-20 23:13:19', 'LSDPC Estate, Omole Phase 1, Lagos, Nigeria', 'Mega Chicken Agidingbi, Lateef Jakande Road, Ikeja', NULL, 'live', 'yes', 'completed', '', 'pending', '164.5'),
(199, 49, '2019-02-20', NULL, '2019-02-20 15:17:50', '2019-02-20 23:17:50', 'LSDPC Estate, Omole Phase 1, Lagos, Nigeria', 'Ikeja City Mall, Obafemi Awolowo Way, Ikeja, Niger', NULL, 'live', 'yes', 'completed', '', 'pending', '321.35'),
(200, 49, '2019-02-20', NULL, '2019-02-20 15:20:25', '2019-02-20 23:20:25', 'LSDPC Estate, Omole Phase 1, Lagos, Nigeria', 'Shoprite Ikeja City Mall, Obafemi Awolowo Way, Ike', NULL, 'live', 'yes', 'completed', '', 'pending', '391.0'),
(201, 49, '2019-02-20', NULL, '2019-02-20 15:29:44', '2019-02-20 23:29:44', 'LSDPC Estate, Omole Phase 1, Lagos, Nigeria', 'Ikeja City Mall, Obafemi Awolowo Way, Ikeja, Niger', NULL, 'live', 'yes', 'completed', '', 'pending', '321.35'),
(202, 49, '2019-02-20', NULL, '2019-02-20 15:34:58', '2019-02-20 23:34:58', 'LSDPC Estate, Omole Phase 1, Lagos, Nigeria', 'Ikeja City Mall, Obafemi Awolowo Way, Ikeja, Niger', NULL, 'live', 'yes', 'completed', '', 'pending', '321.35'),
(203, 49, '2019-02-20', NULL, '2019-02-20 15:40:05', '2019-02-20 23:40:05', 'LSDPC Estate, Omole Phase 1, Lagos, Nigeria', 'Ikeja City Mall, Obafemi Awolowo Way, Ikeja, Niger', NULL, 'live', 'yes', 'completed', '', 'pending', '321.35'),
(204, 49, '2019-02-20', NULL, '2019-02-20 15:43:19', '2019-02-20 23:43:19', 'LSDPC Estate, Omole Phase 1, Lagos, Nigeria', 'Ikeja City Mall, Obafemi Awolowo Way, Ikeja, Niger', NULL, 'live', 'yes', 'completed', '', 'pending', '321.35'),
(205, 49, '2019-02-20', NULL, '2019-02-20 15:49:12', '2019-02-20 23:49:12', '5 Ikeja Bridge, Lagos, Nigeria', 'Ikeja City Mall, Obafemi Awolowo Way, Ikeja, Niger', NULL, 'live', 'yes', 'completed', '', 'pending', '314.8'),
(206, 49, '2019-02-20', NULL, '2019-02-20 15:51:18', '2019-02-20 23:51:18', 'LSDPC Estate, Omole Phase 1, Lagos, Nigeria', 'Ikeja City Mall, Obafemi Awolowo Way, Ikeja, Niger', NULL, 'live', 'yes', 'completed', '', 'pending', '321.35'),
(207, 49, '2019-02-20', NULL, '2019-02-20 15:51:53', '2019-02-20 23:51:53', 'LSDPC Estate, Omole Phase 1, Lagos, Nigeria', 'Ikeja City Mall, Obafemi Awolowo Way, Ikeja, Niger', NULL, 'live', 'yes', 'completed', '', 'pending', '321.35'),
(208, 49, '2019-02-20', NULL, '2019-02-20 16:00:59', '2019-02-21 00:00:59', 'LSDPC Estate, Omole Phase 1, Lagos, Nigeria', 'Ikeja City Mall, Obafemi Awolowo Way, Ikeja, Niger', NULL, 'live', 'yes', 'completed', '', 'pending', '321.35'),
(209, 49, '2019-02-20', NULL, '2019-02-20 16:01:21', '2019-02-21 00:01:21', 'LSDPC Estate, Omole Phase 1, Lagos, Nigeria', 'Ikeja City Mall, Obafemi Awolowo Way, Ikeja, Niger', NULL, 'live', 'yes', 'completed', '', 'pending', '321.35'),
(210, 49, '2019-02-20', NULL, '2019-02-20 16:14:12', '2019-02-21 00:14:12', 'Ikeja City Mall, Obafemi Awolowo Way, Ikeja, Nigeria', 'LSDPC Estate, Omole Phase 1, Lagos, Nigeria', NULL, 'live', 'yes', 'completed', '', 'pending', '341.05'),
(211, 49, '2019-02-20', NULL, '2019-02-20 16:14:27', '2019-02-21 00:14:27', 'Ikeja City Mall, Obafemi Awolowo Way, Ikeja, Nigeria', 'LSDPC Estate, Omole Phase 1, Lagos, Nigeria', NULL, 'live', 'yes', 'completed', '', 'pending', '341.05'),
(212, 0, '2019-02-21', '07:15:00', '2019-02-20 17:38:39', NULL, '1, Ikeja, Lagos', 'Ikeja City Mall, Obafemi Awolowo Way, Ikeja, Niger', NULL, 'upcoming', 'yes', 'reserved', '', 'pending', '314.8'),
(213, 49, '2019-02-21', NULL, '2019-02-21 12:37:55', '2019-02-21 20:37:55', '5 Ikeja Bridge, Lagos, Nigeria', 'Ikeja Along Busstop, Lagos, Nigeria', NULL, 'live', 'yes', 'completed', '', 'pending', '266.7'),
(214, 49, '2019-02-21', NULL, '2019-02-21 13:03:08', '2019-02-21 21:03:08', '1, Ikeja, Lagos', 'Ikeja Along Busstop, Lagos, Nigeria', NULL, 'live', 'yes', 'completed', '', 'pending', '266.7'),
(215, 49, '2019-02-21', NULL, '2019-03-01 15:40:34', '2019-03-01 23:40:34', 'Mega Chicken Agidingbi, Lateef Jakande Road, Ikeja, Nigeria', 'Ikeja City Mall, Obafemi Awolowo Way, Ikeja, Niger', NULL, 'live', 'yes', 'completed', '', 'pending', '209.95'),
(216, 49, '2019-02-22', NULL, '2019-03-01 15:40:23', '2019-03-01 23:40:23', 'Omole Phase 1', 'Ikeja GRA', NULL, 'live', 'no', 'completed', '', 'pending', '767.35'),
(217, 0, '26/1/2018', '04:25', '2019-02-28 15:57:49', NULL, 'Simbiat Abiola Way, Ikeja, null ffufhfhfhhfhf', 'Simbiat Abiola Way, Ikeja, nullfffufjjfjfjf', NULL, 'upcoming', 'no', 'reserved', '', 'pending', '100'),
(218, 49, '2019-03-01', NULL, '2019-03-01 19:49:23', '2019-03-02 03:49:23', '1, Lagos, Lagos', 'Onipanu Bus Stop, Lagos, Nigeria', NULL, 'live', 'yes', 'completed', '', 'pending', '1479.2'),
(219, 49, '2019-03-01', NULL, '2019-03-01 19:50:39', '2019-03-02 03:50:39', '16, Lagos, Lagos', 'Onipanu Bus Stop, Lagos, Nigeria', NULL, 'live', 'yes', 'completed', '', 'pending', '1213.95'),
(220, 49, '2019-03-01', NULL, '2019-03-01 19:54:38', '2019-03-02 03:54:38', '16 Lagos - Badagry Expressway, Lagos, Nigeria', 'Onipanu Bus Stop, Lagos, Nigeria', NULL, 'live', 'yes', 'completed', '', 'pending', '1549.15'),
(221, 49, '2019-03-02', NULL, '2019-03-02 11:43:41', '2019-03-02 19:43:41', 'Ikeja City Mall, Obafemi Awolowo Way, Ikeja, Nigeria', 'Mega Chicken Agidingbi, Lateef Jakande Road, Ikeja', NULL, 'live', 'yes', 'completed', '', 'pending', '197.2'),
(222, 49, '2019-03-02', NULL, '2019-03-02 12:08:04', '2019-03-02 20:08:04', 'Olaniiji Street,10', 'Mega Chicken Agidingbi, Lateef Jakande Road, Ikeja', NULL, 'live', 'yes', 'completed', '', 'pending', '296.0'),
(223, 13, '2019-03-02', NULL, '2019-03-02 12:19:42', '2019-03-02 20:19:42', 'Olaniiji Street,10', 'Mega Chicken Agidingbi, Lateef Jakande Road, Ikeja', NULL, 'live', 'yes', 'completed', '', 'pending', '296.0'),
(224, 13, '2019-03-02', NULL, '2019-03-02 12:20:50', '2019-03-02 20:20:50', 'Olaniiji Street,10', 'Mega Chicken Agidingbi, Lateef Jakande Road, Ikeja', NULL, 'live', 'yes', 'completed', '', 'pending', '296.0'),
(225, 13, '2019-03-02', NULL, '2019-03-02 12:23:16', '2019-03-02 20:23:16', 'Olaniiji Street,10', 'Mega Chicken Agidingbi, Lateef Jakande Road, Ikeja', NULL, 'live', 'yes', 'completed', '', 'pending', '296.0'),
(226, 13, '2019-03-02', NULL, '2019-03-02 13:52:05', '2019-03-02 21:52:05', '8, Lagos, Lagos', 'Onipanu Bus Stop, Lagos, Nigeria', NULL, 'live', 'yes', 'completed', '', 'pending', '297.05'),
(227, 13, '2019-03-02', NULL, '2019-03-02 13:52:46', '2019-03-02 21:52:46', '8, Lagos, Lagos', 'Abiola Bus Stop, Demurin Street, Lagos, Nigeria', NULL, 'live', 'yes', 'completed', '', 'pending', '728.9'),
(228, 13, '2019-03-02', NULL, '2019-03-02 17:47:30', '2019-03-03 01:47:30', 'Covenant University Guest House', 'Covenant University Swimming Pool', NULL, 'live', 'yes', 'completed', '', 'pending', '100'),
(229, 49, '2019-03-02', NULL, '2019-03-02 18:01:27', '2019-03-03 02:01:27', 'Covenant University Guest House', 'Covenant University Swimming Pool', NULL, 'live', 'yes', 'completed', '', 'pending', '100'),
(230, 13, '2019-03-02', NULL, '2019-03-02 17:57:21', '2019-03-03 01:57:21', 'Ikeja City Mall', 'Shoprite Ikeja City Mall', NULL, 'live', 'yes', 'completed', '', 'pending', '100');

-- --------------------------------------------------------

--
-- Table structure for table `car_model`
--

CREATE TABLE `car_model` (
  `cm_id` int(11) NOT NULL,
  `cm_model_name` varchar(255) NOT NULL,
  `cm_model_description` text NOT NULL,
  `cm_model_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `car_model`
--

INSERT INTO `car_model` (`cm_id`, `cm_model_name`, `cm_model_description`, `cm_model_image`) VALUES
(1, 'Hyundai Verna', '', ''),
(2, 'Maruti Suzuki', '', ''),
(3, 'Honda City', '', ''),
(4, 'Ford Aspire', '', ''),
(5, 'Maruti Suzuki Ciaz', '', ''),
(6, 'Hyundai Elantra', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `driver_details`
--

CREATE TABLE `driver_details` (
  `dc_id` int(11) NOT NULL,
  `dd_driver_id` int(11) DEFAULT NULL,
  `dd_colleg_id` varchar(50) DEFAULT NULL,
  `dd_birth_day` varchar(50) DEFAULT NULL,
  `dd_license` varchar(100) DEFAULT NULL,
  `dd_expiery_date` varchar(100) DEFAULT NULL,
  `dd_admin_approved` int(11) NOT NULL DEFAULT '0',
  `dd_car_number` varchar(50) DEFAULT NULL,
  `dd_car_model_id` int(11) DEFAULT NULL,
  `dd_car_manufacture_year` year(4) DEFAULT NULL,
  `dd_car_active` int(11) DEFAULT NULL,
  `dd_car_capacity` int(11) DEFAULT NULL,
  `dd_curent_status` varchar(50) DEFAULT NULL,
  `dd_last_status` varchar(100) DEFAULT NULL,
  `dd_status_date` date DEFAULT NULL,
  `dd_status_time` time DEFAULT NULL,
  `dd_current_lat` varchar(50) DEFAULT NULL,
  `dd_current_long` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `driver_details`
--

INSERT INTO `driver_details` (`dc_id`, `dd_driver_id`, `dd_colleg_id`, `dd_birth_day`, `dd_license`, `dd_expiery_date`, `dd_admin_approved`, `dd_car_number`, `dd_car_model_id`, `dd_car_manufacture_year`, `dd_car_active`, `dd_car_capacity`, `dd_curent_status`, `dd_last_status`, `dd_status_date`, `dd_status_time`, `dd_current_lat`, `dd_current_long`) VALUES
(1, 1, NULL, '2018-09-19', '15/02/2019', '15/02/2019', 0, 'kl 1222', 1, NULL, 1, 10, 'offline', 'offline', '2018-09-25', '15:29:01', '8.571032', '76.866333'),
(2, 3, NULL, '21/07/2012', '31/08/2021', '31/08/2021', 1, '2475926', 0, NULL, 1, 4, 'offline', 'online', '2018-09-20', '13:35:53', '7.6110712', '5.2519224'),
(3, 5, NULL, '20/09/2018', '30/09/2018', '30/09/2018', 0, 'cbnnn', 0, NULL, 1, 8, 'offline', 'offline', '2018-09-27', '18:28:22', '8.5606955745103', '76.8807902908503'),
(4, 7, NULL, '15-05-2018', '15-05-2018', '15-05-2018', 0, 'KL 123456', 1, NULL, 1, 3, 'offline', 'offline', '2018-09-26', '18:12:49', '8.56068471876592', '76.8807646941646'),
(5, 13, NULL, '07/09/1990', '07/09/2021', '07/09/2021', 0, 'ASD 1223 FK', 2, NULL, 1, 4, 'offline', 'offline', '2019-03-02', '19:06:23', '6.63527023', '3.36183569'),
(6, 16, NULL, '22/09/1991', '22/09/2024', '22/09/2024', 0, '46fgahaja', 2, NULL, 1, 4, 'offline', 'offline', '2018-09-22', '20:49:21', '7.6110712', '5.2519224'),
(7, 19, NULL, '10/09/2018', '10/09/2018', '10/09/2018', 0, 'cvvvv', 0, NULL, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 20, NULL, '10/09/2018', '10/09/2018', '10/09/2018', 0, 'cvvvv', 0, NULL, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 21, NULL, '10/09/2018', '10/09/2018', '10/09/2018', 0, 'vvgg', 0, NULL, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 22, NULL, '10/09/2018', '10/09/2018', '10/09/2018', 0, 'vvgg', 0, NULL, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 23, NULL, '10/09/2018', '10/09/2018', '10/09/2018', 0, 'vvgg', 0, NULL, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 24, NULL, '25/09/2018', '25/09/2018', '25/09/2018', 0, 'vvvv', 3, NULL, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 25, NULL, '25/09/2018', '25/09/2018', '25/09/2018', 0, '7878979', 2, NULL, 1, 6, 'offline', 'offline', '2018-11-12', '07:26:28', '8.5606511', '76.880971'),
(14, 26, NULL, '28/09/2018', '28/09/2018', '28/09/2018', 0, 'cvbb', 0, NULL, 1, 6, 'offline', 'offline', '2018-09-25', '15:02:53', '8.5606239', '76.8810276'),
(15, 27, NULL, '15-05-2018', '15-05-2018', '15-05-2018', 0, 'KL 123456', 1, NULL, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 28, NULL, '25/09/1985', '25/09/2026', '25/09/2026', 0, '123', 1, NULL, 1, 2, 'offline', 'offline', '2018-09-26', '14:18:48', '8.571032', '76.866333'),
(17, 45, NULL, '26/09/2018', '26/09/2018', '26/09/2018', 0, 'rey3333', 0, NULL, 1, 4, 'offline', 'offline', '2018-09-26', '20:48:56', '6.4492803', '3.3314428'),
(18, 49, NULL, '26/09/2018', '26/09/2018', '26/09/2018', 0, '3-gshd', 0, NULL, 1, 5, 'online', 'online', '2019-03-02', '18:20:00', '6.6353556', '3.3619008'),
(19, 50, NULL, '27/09/2018', '27/09/2018', '27/09/2018', 0, 'kl 1234', 2, NULL, 1, 10, 'offline', 'offline', '2018-09-27', '10:00:03', '8.5606036', '76.8810145'),
(20, 51, NULL, '03/09/2018', '29/09/2018', '29/09/2018', 0, '77885', 0, NULL, 1, 6, 'offline', 'offline', '2018-09-27', '13:22:56', '8.5606238', '76.8810271'),
(21, 52, NULL, '27/09/2018', '29/09/2018', '29/09/2018', 0, 'ghhb', 4, NULL, 1, 6, 'offline', 'offline', '2018-09-27', '19:09:20', '8.56069672603569', '76.8807991253797'),
(22, 54, NULL, '27/09/2018', '27/09/2018', '27/09/2018', 0, 'kl/021092', 2, NULL, 1, 8, 'offline', 'offline', '2018-09-27', '20:10:51', '8.5845862', '76.9014975'),
(23, 55, NULL, '27/09/2018', '27/09/2018', '27/09/2018', 0, 'bbh', 1, NULL, 1, 8, 'offline', 'offline', '2018-09-27', '19:38:46', '8.5606389', '76.8809873'),
(24, 56, NULL, '27/09/2018', '27/09/2018', '27/09/2018', 0, '   bbbbj', 1, NULL, 1, 8, 'online', 'online', '2018-09-27', '19:54:42', '8.5576032', '76.8827137'),
(25, 57, NULL, '27/09/2018', '27/09/2018', '27/09/2018', 0, 'tghh', 4, NULL, 1, 7, 'offline', 'offline', '2018-09-27', '20:12:46', '8.5845853', '76.9014925'),
(26, 58, NULL, '27/09/2018', '27/09/2018', '27/09/2018', 0, 'gdhdj444', 1, NULL, 1, 4, 'online', 'online', '2018-09-28', '15:44:07', '6.4492803', '3.3314428'),
(27, 59, NULL, '08/12/2016', '08/12/2025', '08/12/2025', 0, 'KL02-1092', 5, NULL, 1, 6, 'offline', 'offline', '2018-09-28', '15:39:52', '8.5606229', '76.8810144'),
(28, 60, NULL, '28/09/2018', '28/09/2018', '28/09/2018', 0, 'bb', 1, NULL, 1, 8, 'offline', 'offline', '2018-09-28', '13:49:58', '8.5606042', '76.8810269'),
(29, 61, NULL, '30/09/1962', '28/09/2020', '28/09/2020', 0, 'ghghhhhh', 2, NULL, 1, 4, 'online', 'online', '2018-09-28', '12:06:22', '6.54389197864983', '3.37018675480392'),
(30, 62, NULL, '28/09/2018', '28/09/2018', '28/09/2018', 0, 'vvb', 1, NULL, 1, 5, 'offline', 'offline', '2018-10-03', '14:13:28', '8.5606432', '76.8810034'),
(31, 64, NULL, '03/10/2018', 'hhhh', '03/10/2018', 0, 'hdjdj', 3, NULL, 1, 15268, 'offline', 'offline', '2018-10-04', '08:59:10', '8.5606227', '76.8810005'),
(32, 65, NULL, '15-05-2018', NULL, '15-05-2018', 0, 'KL 123456', 1, NULL, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL),
(33, 66, NULL, '15-05-2018', NULL, '15-05-2018', 0, 'KL 123456', 1, NULL, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL),
(34, 76, NULL, '13/10/1989', 'tr43erd', '13/10/2021', 0, '34534', 3, NULL, 1, 4, 'online', 'online', '2018-10-13', '14:36:51', '6.6065685', '3.2660637'),
(35, 77, NULL, '14/10/2018', '782828822221', '14/10/2018', 0, '8990w02552g', 1, NULL, 1, 4, NULL, NULL, NULL, NULL, '37.785834', '-122.406417'),
(36, 90, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(37, NULL, NULL, '08/11/2018', 'ejdndbdhs', '08/11/2018', 0, 'dhdbfb', 5, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL),
(38, 166, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(39, 168, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, NULL, NULL, '25/01/2019', '66373838', '25/01/2019', 0, '63738', 1, NULL, 1, 50, NULL, NULL, NULL, NULL, NULL, NULL),
(41, NULL, NULL, '25/01/2019', '66373838', '25/01/2019', 0, '63738', 1, NULL, 1, 50, NULL, NULL, NULL, NULL, NULL, NULL),
(42, 183, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(43, 184, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, NULL, NULL, '22/02/2019', 'sgshdhd', '22/02/2019', 0, 'vsvdv', 1, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL),
(45, NULL, NULL, '02/03/2019', 'gdhdhd', '30/03/2019', 0, 'hdhddb', 1, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL),
(46, NULL, NULL, '02/03/2019', 'jshshdhd', '02/03/2019', 0, 'gsgs', 1, NULL, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `driver_ratings`
--

CREATE TABLE `driver_ratings` (
  `dr_id` int(11) NOT NULL,
  `dr_driver_id` int(11) NOT NULL,
  `dr_trip_id` int(11) NOT NULL,
  `dr_user_id` int(11) NOT NULL,
  `dr_rating_score` varchar(10) NOT NULL,
  `dr_review` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `driver_ratings`
--

INSERT INTO `driver_ratings` (`dr_id`, `dr_driver_id`, `dr_trip_id`, `dr_user_id`, `dr_rating_score`, `dr_review`) VALUES
(1, 7, 37, 4, '1', 'boring'),
(2, 25, 207, 4, '5', 'ttt'),
(3, 0, 212, 159, '5.0', 'Great'),
(4, 7, 37, 4, 'Such an ex', '5');

-- --------------------------------------------------------

--
-- Table structure for table `driver_shift`
--

CREATE TABLE `driver_shift` (
  `ds_id` int(11) NOT NULL,
  `ds_driver_id` int(11) DEFAULT NULL,
  `ds_status` varchar(50) DEFAULT NULL,
  `ds_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ds_lat` varchar(50) DEFAULT NULL,
  `ds_long` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `driver_shift`
--

INSERT INTO `driver_shift` (`ds_id`, `ds_driver_id`, `ds_status`, `ds_time`, `ds_lat`, `ds_long`) VALUES
(1, 2, 'offline', '2018-09-20 12:38:32', '8.5606041', '76.8810284'),
(2, 1, 'online', '2018-09-20 12:48:18', '8.5606047', '76.881046'),
(3, 1, 'offline', '2018-09-20 12:59:59', '8.5606119', '76.8810364'),
(4, 1, 'online', '2018-09-20 13:00:00', '8.5606119', '76.8810364'),
(5, 47, 'offline', '2018-09-20 13:24:18', '7.6110712', '5.2519224'),
(6, 3, 'online', '2018-09-20 13:26:31', '7.6110712', '5.2519224'),
(7, 3, 'offline', '2018-09-20 13:35:19', '7.6110712', '5.2519224'),
(8, 3, 'online', '2018-09-20 13:35:53', '7.6110712', '5.2519224'),
(9, 5, 'offline', '2018-09-20 13:40:44', '8.56069032941473', '76.8807694591372'),
(10, 1, 'offline', '2018-09-20 14:09:04', '8.5606027', '76.881003'),
(11, 1, 'online', '2018-09-20 14:10:16', '8.5606103', '76.8809943'),
(12, 1, 'offline', '2018-09-20 14:48:30', '8.5606045', '76.8810453'),
(13, 1, 'online', '2018-09-20 14:55:02', '8.56068043213877', '76.8807586685571'),
(14, 1, 'online', '2018-09-20 15:00:30', '8.5606042', '76.8810445'),
(15, 1, 'offline', '2018-09-20 15:00:37', '8.5606042', '76.8810445'),
(16, 1, 'online', '2018-09-20 15:03:27', '8.5606114', '76.8810152'),
(17, 1, 'offline', '2018-09-20 15:11:23', '8.56068120555332', '76.8807540636946'),
(18, 1, 'offline', '2018-09-20 15:11:44', '8.5606098', '76.8810754'),
(19, 1, 'online', '2018-09-20 15:12:07', '8.5606132', '76.8810587'),
(20, 1, 'offline', '2018-09-20 15:13:07', '8.560638', '76.8810798'),
(21, 1, 'online', '2018-09-20 15:15:09', '8.5606161', '76.881024'),
(22, 1, 'offline', '2018-09-20 15:15:19', '8.5606161', '76.881024'),
(23, 5, 'online', '2018-09-20 15:20:07', '8.5605969', '76.8810499'),
(24, 5, 'offline', '2018-09-20 15:26:05', '8.5605969', '76.8810499'),
(25, 1, 'online', '2018-09-20 16:47:04', '8.56068558939159', '76.8807603538736'),
(26, 1, 'offline', '2018-09-20 17:11:33', '8.56068946182294', '76.8807650617359'),
(27, 1, 'online', '2018-09-20 17:11:34', '8.56068945758387', '76.880765051932'),
(28, 1, 'offline', '2018-09-20 17:13:54', '8.56069193801962', '76.8807668794856'),
(29, 1, 'online', '2018-09-20 17:13:55', '8.56069193801962', '76.8807668794856'),
(30, 1, 'offline', '2018-09-20 17:15:02', '8.56067806615509', '76.8807517556994'),
(31, 7, 'online', '2018-09-20 17:18:58', '8.5606923740118', '76.8807693398254'),
(32, 5, 'online', '2018-09-20 17:30:33', '8.560604', '76.881027'),
(33, 5, 'offline', '2018-09-20 17:32:27', '8.560604', '76.881027'),
(34, 5, 'online', '2018-09-20 17:32:29', '8.560604', '76.881027'),
(35, 5, 'offline', '2018-09-20 17:32:52', '8.5606118', '76.8810366'),
(36, 1, 'online', '2018-09-20 17:33:11', '8.5606041', '76.8810281'),
(37, 7, 'offline', '2018-09-20 17:48:01', '8.56068242148092', '76.8807571179139'),
(38, 7, 'online', '2018-09-20 17:48:02', '8.56068242148092', '76.8807571179139'),
(39, 7, 'offline', '2018-09-20 18:01:05', '8.5606857994671', '76.8807618170521'),
(40, 7, 'online', '2018-09-20 18:01:06', '8.5606857994671', '76.8807618170521'),
(41, 7, 'offline', '2018-09-20 18:40:08', '8.56069007367319', '76.8807664619247'),
(42, 7, 'online', '2018-09-20 18:40:09', '8.56069007367319', '76.8807664619247'),
(43, 2, 'offline', '2018-09-21 10:26:21', '8.5606118', '76.8810353'),
(44, 2, 'online', '2018-09-21 10:26:22', '8.5606118', '76.8810353'),
(45, 7, 'offline', '2018-09-21 10:38:06', '8.56067235020733', '76.8807459422067'),
(46, 7, 'online', '2018-09-21 10:38:08', '8.56068620788657', '76.8807595100911'),
(47, 5, 'online', '2018-09-21 10:45:28', '8.571032', '76.866333'),
(48, 7, 'offline', '2018-09-21 10:46:38', '8.56068808518445', '76.880758877314'),
(49, 2, 'offline', '2018-09-21 11:28:27', '8.5606043', '76.8810453'),
(50, 2, 'online', '2018-09-21 11:28:37', '8.5606247', '76.8810459'),
(51, 2, 'offline', '2018-09-21 11:28:38', '8.5606247', '76.8810459'),
(52, 2, 'online', '2018-09-21 11:28:39', '8.5606247', '76.8810459'),
(53, 2, 'offline', '2018-09-21 11:32:01', '8.5606247', '76.8810459'),
(54, 2, 'online', '2018-09-21 11:32:02', '8.5606247', '76.8810459'),
(55, 2, 'offline', '2018-09-21 11:32:17', '8.5606247', '76.8810459'),
(56, 2, 'online', '2018-09-21 11:32:18', '8.5606247', '76.8810459'),
(57, 2, 'offline', '2018-09-21 11:33:17', '8.5606055', '76.8810582'),
(58, 1, 'online', '2018-09-21 11:33:56', '8.5606246', '76.8810457'),
(59, 1, 'online', '2018-09-21 11:37:09', '8.5606615', '76.88077420000002'),
(60, 7, 'online', '2018-09-21 11:40:30', '8.56068211562747', '76.8807561512985'),
(61, 7, 'offline', '2018-09-21 11:45:03', '8.56068470823751', '76.8807596108739'),
(62, 7, 'online', '2018-09-21 11:45:05', '8.56068470823751', '76.8807596108739'),
(63, 1, 'offline', '2018-09-21 11:45:52', '8.5606246', '76.8810457'),
(64, 1, 'online', '2018-09-21 11:45:58', '8.5606246', '76.8810457'),
(65, 1, 'offline', '2018-09-21 11:45:59', '8.5606246', '76.8810457'),
(66, 1, 'online', '2018-09-21 11:46:00', '8.5606246', '76.8810457'),
(67, 1, 'offline', '2018-09-21 11:46:02', '8.5606246', '76.8810457'),
(68, 1, 'online', '2018-09-21 11:46:03', '8.5606246', '76.8810457'),
(69, 1, 'offline', '2018-09-21 11:46:04', '8.5606246', '76.8810457'),
(70, 1, 'online', '2018-09-21 11:46:04', '8.5606246', '76.8810457'),
(71, 1, 'offline', '2018-09-21 11:46:05', '8.5606246', '76.8810457'),
(72, 1, 'online', '2018-09-21 11:46:06', '8.5606246', '76.8810457'),
(73, 1, 'offline', '2018-09-21 11:46:12', '8.5606246', '76.8810457'),
(74, 1, 'online', '2018-09-21 11:46:15', '8.5606246', '76.8810457'),
(75, 1, 'offline', '2018-09-21 12:08:58', '8.5606154', '76.8810228'),
(76, 1, 'online', '2018-09-21 12:08:59', '8.5606154', '76.8810228'),
(77, 1, 'offline', '2018-09-21 12:11:35', '8.5606154', '76.8810228'),
(78, 1, 'online', '2018-09-21 12:11:40', '8.5606154', '76.8810228'),
(79, 1, 'offline', '2018-09-21 12:13:19', '8.5606154', '76.8810228'),
(80, 1, 'online', '2018-09-21 12:13:21', '8.5606154', '76.8810228'),
(81, 1, 'offline', '2018-09-21 12:15:25', '8.5606154', '76.8810228'),
(82, 7, 'offline', '2018-09-21 12:15:59', '8.56069102082704', '76.8807667153315'),
(83, 7, 'online', '2018-09-21 12:16:01', '8.56069102082704', '76.8807667153315'),
(84, 7, 'offline', '2018-09-21 12:33:12', '8.56069331775282', '76.8807694651496'),
(85, 7, 'online', '2018-09-21 12:33:14', '8.56069331775282', '76.8807694651496'),
(86, 1, 'online', '2018-09-21 12:38:53', '8.5606045', '76.8810279'),
(87, 7, 'offline', '2018-09-21 12:39:12', '8.56066792994157', '76.8807476597564'),
(88, 7, 'online', '2018-09-21 12:39:14', '8.56066792994157', '76.8807476597564'),
(89, 1, 'offline', '2018-09-21 13:09:23', '8.5606116', '76.8810152'),
(90, 1, 'online', '2018-09-21 13:35:36', '8.5606118', '76.8810151'),
(91, 1, 'offline', '2018-09-21 13:36:08', '8.5606118', '76.8810151'),
(92, 1, 'online', '2018-09-21 13:36:09', '8.5606118', '76.8810151'),
(93, 7, 'offline', '2018-09-21 13:44:55', '8.56069179368952', '76.8807695620685'),
(94, 7, 'online', '2018-09-21 13:44:55', '8.56069179368952', '76.8807695620685'),
(95, 7, 'offline', '2018-09-21 13:46:06', '8.56067581766037', '76.8807522083146'),
(96, 7, 'online', '2018-09-21 13:46:06', '8.5606732033894', '76.8807474176341'),
(97, 1, 'offline', '2018-09-21 13:48:17', '8.5606114', '76.8810153'),
(98, 1, 'online', '2018-09-21 13:48:24', '8.5606114', '76.8810153'),
(99, 1, 'offline', '2018-09-21 13:51:32', '8.5606052', '76.8810272'),
(100, 1, 'online', '2018-09-21 13:51:33', '8.5606052', '76.8810272'),
(101, 1, 'offline', '2018-09-21 13:52:05', '8.5606115', '76.8810154'),
(102, 1, 'online', '2018-09-21 13:52:06', '8.5606115', '76.8810154'),
(103, 1, 'offline', '2018-09-21 13:52:21', '8.5606115', '76.8810154'),
(104, 1, 'online', '2018-09-21 13:52:22', '8.5606115', '76.8810154'),
(105, 1, 'offline', '2018-09-21 13:52:44', '8.5606115', '76.8810154'),
(106, 1, 'online', '2018-09-21 13:52:45', '8.5606115', '76.8810154'),
(107, 1, 'offline', '2018-09-21 13:58:02', '8.5606122', '76.8810363'),
(108, 1, 'online', '2018-09-21 13:58:03', '8.5606122', '76.8810363'),
(109, 1, 'offline', '2018-09-21 13:58:12', '8.5606122', '76.8810363'),
(110, 1, 'online', '2018-09-21 13:58:13', '8.5606122', '76.8810363'),
(111, 7, 'offline', '2018-09-21 14:00:55', '8.56069575432733', '76.8807733195185'),
(112, 7, 'online', '2018-09-21 14:00:56', '8.56069575432733', '76.8807733195185'),
(113, 1, 'offline', '2018-09-21 14:43:39', '8.5606152', '76.8810045'),
(114, 7, 'offline', '2018-09-21 14:43:44', '8.56068886809607', '76.8807635325394'),
(115, 7, 'online', '2018-09-21 14:43:45', '8.56068886809607', '76.8807635325394'),
(116, 7, 'offline', '2018-09-21 14:43:46', '8.56068886809607', '76.8807635325394'),
(117, 7, 'online', '2018-09-21 14:43:47', '8.56068886809607', '76.8807635325394'),
(118, 7, 'offline', '2018-09-21 14:43:48', '8.56068886809607', '76.8807635325394'),
(119, 7, 'online', '2018-09-21 14:43:48', '8.56068886809607', '76.8807635325394'),
(120, 7, 'offline', '2018-09-21 14:43:49', '8.56068886809607', '76.8807635325394'),
(121, 7, 'online', '2018-09-21 14:43:50', '8.56068654013982', '76.8807615857901'),
(122, 2, 'offline', '2018-09-21 14:45:16', '0.0', '0.0'),
(123, 2, 'offline', '2018-09-21 14:45:37', '0.0', '0.0'),
(124, 1, 'online', '2018-09-21 14:46:21', '0.0', '0.0'),
(125, 1, 'offline', '2018-09-21 14:46:27', '0.0', '0.0'),
(126, 7, 'offline', '2018-09-21 14:47:11', '8.56068610231318', '76.8807613229434'),
(127, 7, 'online', '2018-09-21 14:47:12', '8.56068610231318', '76.8807613229434'),
(128, 1, 'offline', '2018-09-21 14:54:08', '8.5606111', '76.8810149'),
(129, 1, 'online', '2018-09-21 14:54:25', '8.5606111', '76.8810149'),
(130, 1, 'offline', '2018-09-21 14:54:42', '8.5606111', '76.8810149'),
(131, 1, 'online', '2018-09-21 14:54:53', '8.5606111', '76.8810149'),
(132, 1, 'offline', '2018-09-21 14:55:04', '8.5606111', '76.8810149'),
(133, 1, 'online', '2018-09-21 14:55:11', '8.5606111', '76.8810149'),
(134, 1, 'offline', '2018-09-21 14:56:09', '8.5606111', '76.8810149'),
(135, 1, 'online', '2018-09-21 14:56:14', '8.5606111', '76.8810149'),
(136, 1, 'offline', '2018-09-21 14:57:17', '8.5606111', '76.8810149'),
(137, 1, 'online', '2018-09-21 14:57:18', '8.5606111', '76.8810149'),
(138, 1, 'online', '2018-09-21 15:14:45', '8.5606152', '76.8810045'),
(139, 1, 'offline', '2018-09-21 15:15:06', '8.5606125', '76.8810377'),
(140, 7, 'offline', '2018-09-21 15:17:11', '8.56067651644817', '76.8807491098366'),
(141, 7, 'online', '2018-09-21 15:17:12', '8.56067651644817', '76.8807491098366'),
(142, 1, 'offline', '2018-09-21 15:18:14', '8.5603313', '76.8803941'),
(143, 1, 'online', '2018-09-21 15:18:20', '8.5603313', '76.8803941'),
(144, 1, 'offline', '2018-09-21 15:18:29', '8.5603313', '76.8803941'),
(145, 1, 'online', '2018-09-21 15:18:31', '8.5603313', '76.8803941'),
(146, 1, 'offline', '2018-09-21 15:18:56', '8.56048', '76.880635'),
(147, 1, 'online', '2018-09-21 15:18:58', '8.56048', '76.880635'),
(148, 1, 'offline', '2018-09-21 15:19:05', '8.56048', '76.880635'),
(149, 1, 'online', '2018-09-21 15:19:07', '8.56048', '76.880635'),
(150, 1, 'offline', '2018-09-21 15:21:37', '8.5608028', '76.8810167'),
(151, 1, 'online', '2018-09-21 15:21:47', '8.5608028', '76.8810167'),
(152, 1, 'offline', '2018-09-21 15:27:58', '8.5606116', '76.8810371'),
(153, 1, 'online', '2018-09-21 15:27:59', '8.5606116', '76.8810371'),
(154, 7, 'offline', '2018-09-21 15:29:12', '8.56066964104305', '76.8807453857889'),
(155, 7, 'online', '2018-09-21 15:29:13', '8.56066964104305', '76.8807453857889'),
(156, 1, 'offline', '2018-09-21 15:29:16', '8.5606116', '76.8810371'),
(157, 1, 'online', '2018-09-21 15:29:18', '8.5606116', '76.8810371'),
(158, 1, 'offline', '2018-09-21 15:34:47', '8.5606114', '76.8810156'),
(159, 1, 'online', '2018-09-21 15:34:48', '8.5606114', '76.8810156'),
(160, 1, 'offline', '2018-09-21 15:36:35', '8.5606114', '76.8810156'),
(161, 1, 'online', '2018-09-21 15:36:36', '8.5606114', '76.8810156'),
(162, 1, 'offline', '2018-09-21 15:40:11', '8.5606114', '76.8810156'),
(163, 1, 'online', '2018-09-21 15:40:12', '8.5606114', '76.8810156'),
(164, 1, 'offline', '2018-09-21 15:43:17', '8.5606114', '76.8810156'),
(165, 1, 'online', '2018-09-21 15:43:18', '8.5606114', '76.8810156'),
(166, 1, 'offline', '2018-09-21 15:47:53', '8.5606118', '76.8810352'),
(167, 1, 'online', '2018-09-21 15:47:54', '8.5606118', '76.8810352'),
(168, 1, 'offline', '2018-09-21 15:48:02', '8.5606118', '76.8810352'),
(169, 1, 'online', '2018-09-21 15:48:03', '8.5606118', '76.8810352'),
(170, 1, 'offline', '2018-09-21 15:48:18', '8.5606118', '76.8810352'),
(171, 1, 'online', '2018-09-21 15:48:19', '8.5606118', '76.8810352'),
(172, 1, 'offline', '2018-09-21 15:50:57', '8.5606118', '76.881036'),
(173, 1, 'online', '2018-09-21 15:50:58', '8.5606118', '76.881036'),
(174, 1, 'offline', '2018-09-21 15:51:04', '8.5606118', '76.881036'),
(175, 1, 'online', '2018-09-21 15:51:05', '8.5606118', '76.881036'),
(176, 1, 'offline', '2018-09-21 15:51:10', '8.5606118', '76.881036'),
(177, 1, 'online', '2018-09-21 15:51:13', '8.5606118', '76.881036'),
(178, 1, 'online', '2018-09-21 17:19:52', '8.5606117', '76.8810157'),
(179, 7, 'offline', '2018-09-21 17:20:39', '8.56068881183323', '76.8807645243788'),
(180, 1, 'offline', '2018-09-21 17:32:51', '8.5606043', '76.8810284'),
(181, 1, 'online', '2018-09-21 17:32:53', '8.5606043', '76.8810284'),
(182, 1, 'offline', '2018-09-21 18:33:29', '8.5606122', '76.8810361'),
(183, 1, 'online', '2018-09-21 18:33:30', '8.5606122', '76.8810361'),
(184, 1, 'offline', '2018-09-21 18:33:36', '8.5606122', '76.8810361'),
(185, 1, 'online', '2018-09-21 18:33:37', '8.5606122', '76.8810361'),
(186, 7, 'online', '2018-09-21 18:45:02', '8.56067860589934', '76.8807639453845'),
(187, 7, 'offline', '2018-09-21 19:01:58', '8.5606737511947', '76.8807556497581'),
(188, 7, 'online', '2018-09-21 19:05:43', '8.56069747699882', '76.8807843232832'),
(189, 5, 'offline', '2018-09-21 19:14:11', '8.571032', '76.866333'),
(190, 7, 'offline', '2018-09-21 19:14:13', '8.56069404460822', '76.8807856556948'),
(191, 7, 'online', '2018-09-21 19:14:55', '8.56068462242749', '76.8807693252803'),
(192, 7, 'offline', '2018-09-21 19:16:01', '8.56069164320271', '76.8807805994267'),
(193, 13, 'online', '2018-09-21 20:26:07', '7.606862', '5.3083609'),
(194, 13, 'offline', '2018-09-21 20:26:31', '7.606862', '5.3083609'),
(195, 13, 'online', '2018-09-21 20:27:26', '7.60696856305712', '5.30877183191973'),
(196, 47, 'offline', '2018-09-21 20:31:18', '7.606862', '5.3083609'),
(197, 47, 'offline', '2018-09-22 13:10:10', '7.6110712', '5.2519224'),
(198, 1, 'offline', '2018-09-22 13:17:57', '8.8247289', '76.7500643'),
(199, 1, 'online', '2018-09-22 13:17:58', '8.8247289', '76.7500643'),
(200, 16, 'offline', '2018-09-22 20:49:21', '7.6110712', '5.2519224'),
(201, 7, 'online', '2018-09-24 09:39:37', '8.56066523916764', '76.8807444983515'),
(202, 7, 'offline', '2018-09-24 09:45:51', '8.56067421405841', '76.8807551215478'),
(203, 1, 'offline', '2018-09-24 09:46:06', '8.56068885592866', '76.8807852584802'),
(204, 1, 'online', '2018-09-24 09:46:07', '8.56068885592866', '76.8807852584802'),
(205, 1, 'offline', '2018-09-24 11:51:14', '8.5606152', '76.8810056'),
(206, 13, 'offline', '2018-09-24 14:51:05', '6.5453009', '3.3691686'),
(207, 1, 'offline', '2018-09-24 18:12:36', '8.5606113', '76.8810142'),
(208, 1, 'offline', '2018-09-25 10:20:07', '8.5606034', '76.8810282'),
(209, 25, 'offline', '2018-09-25 14:22:42', '8.5606221', '76.8809836'),
(210, 26, 'offline', '2018-09-25 15:02:53', '8.5606239', '76.8810276'),
(211, 1, 'online', '2018-09-25 15:28:53', '8.571032', '76.866333'),
(212, 1, 'offline', '2018-09-25 15:29:01', '8.571032', '76.866333'),
(213, 25, 'online', '2018-09-25 16:06:00', '8.5606119', '76.8810146'),
(214, 25, 'online', '2018-09-25 18:09:24', '8.560615', '76.8810046'),
(215, 25, 'offline', '2018-09-25 18:13:38', '8.560615', '76.8810046'),
(216, 25, 'offline', '2018-09-25 18:14:19', '8.5606229', '76.8809928'),
(217, 25, 'online', '2018-09-25 18:14:20', '8.5606229', '76.8809928'),
(218, 25, 'online', '2018-09-25 18:15:54', '8.560615', '76.8810046'),
(219, 25, 'offline', '2018-09-25 19:05:49', '8.5606119', '76.8810165'),
(220, 25, 'offline', '2018-09-25 19:17:47', '8.5606083', '76.8810273'),
(221, 25, 'online', '2018-09-25 19:18:19', '8.5606239', '76.8810439'),
(222, 25, 'offline', '2018-09-26 10:09:53', '8.5606275', '76.8810234'),
(223, 25, 'online', '2018-09-26 10:09:53', '8.5606275', '76.8810234'),
(224, 25, 'offline', '2018-09-26 11:20:23', '8.560615', '76.8810074'),
(225, 25, 'online', '2018-09-26 11:20:24', '8.560615', '76.8810074'),
(226, 28, 'offline', '2018-09-26 11:54:20', '8.571032', '76.866333'),
(227, 25, 'offline', '2018-09-26 13:31:48', '8.560623', '76.8810151'),
(228, 25, 'online', '2018-09-26 13:31:49', '8.560623', '76.8810151'),
(229, 28, 'offline', '2018-09-26 14:18:48', '8.571032', '76.866333'),
(230, 7, 'online', '2018-09-26 18:12:42', '8.56068196962358', '76.8807615123174'),
(231, 7, 'offline', '2018-09-26 18:12:49', '8.56068471876592', '76.8807646941646'),
(232, 25, 'offline', '2018-09-26 18:22:05', '8.56068260920308', '76.8807655690489'),
(233, 25, 'offline', '2018-09-26 18:23:50', '8.5606041', '76.8810465'),
(234, 25, 'online', '2018-09-26 18:24:39', '8.56067874232293', '76.8807583930783'),
(235, 25, 'online', '2018-09-26 18:41:10', '8.5606119', '76.8810239'),
(236, 25, 'offline', '2018-09-26 18:52:37', '8.5606114', '76.8810151'),
(237, 25, 'online', '2018-09-26 18:52:38', '8.5606114', '76.8810151'),
(238, 47, 'online', '2018-09-26 20:08:24', '0.0', '0.0'),
(239, 47, 'offline', '2018-09-26 20:09:28', '6.4492803', '3.3314428'),
(240, 43, 'offline', '2018-09-26 20:16:46', '6.4492803', '3.3314428'),
(241, 44, 'online', '2018-09-26 20:17:02', '6.4492803', '3.3314428'),
(242, 44, 'offline', '2018-09-26 20:17:33', '6.4492803', '3.3314428'),
(243, 45, 'online', '2018-09-26 20:18:49', '6.4492803', '3.3314428'),
(244, 13, 'online', '2018-09-26 20:48:24', '6.8355802', '3.6434424'),
(245, 13, 'offline', '2018-09-26 20:48:26', '6.8355802', '3.6434424'),
(246, 45, 'offline', '2018-09-26 20:48:56', '6.4492803', '3.3314428'),
(247, 13, 'online', '2018-09-26 20:49:42', '6.8355802', '3.6434424'),
(248, 49, 'online', '2018-09-26 20:51:52', '6.4492803', '3.3314428'),
(249, 13, 'online', '2018-09-26 20:55:43', '6.7407113', '3.4208065'),
(250, 13, 'offline', '2018-09-26 20:55:49', '6.7407113', '3.4208065'),
(251, 25, 'offline', '2018-09-27 09:50:43', '8.5606235', '76.8810139'),
(252, 25, 'online', '2018-09-27 09:50:43', '8.5606235', '76.8810139'),
(253, 25, 'offline', '2018-09-27 09:53:53', '8.5606232', '76.8810146'),
(254, 50, 'online', '2018-09-27 09:57:58', '8.5606042', '76.8810276'),
(255, 50, 'offline', '2018-09-27 09:59:35', '8.5606081', '76.8810276'),
(256, 50, 'offline', '2018-09-27 10:00:03', '8.5606036', '76.8810145'),
(257, 25, 'offline', '2018-09-27 10:14:48', '8.5606311', '76.8810227'),
(258, 25, 'offline', '2018-09-27 10:43:15', '8.5606349', '76.8810145'),
(259, 25, 'offline', '2018-09-27 11:00:30', '8.571032', '76.866333'),
(260, 51, 'offline', '2018-09-27 13:22:56', '8.5606238', '76.8810271'),
(261, 25, 'offline', '2018-09-27 13:49:16', '8.5606114', '76.8810151'),
(262, 52, 'offline', '2018-09-27 15:17:46', '8.5606135', '76.8810809'),
(263, 52, 'offline', '2018-09-27 15:20:55', '8.5606142', '76.8810809'),
(264, 25, 'online', '2018-09-27 15:28:48', '8.5606366', '76.8810377'),
(265, 25, 'offline', '2018-09-27 15:45:32', '8.560623', '76.8810151'),
(266, 52, 'offline', '2018-09-27 15:58:50', '8.560612', '76.8810348'),
(267, 52, 'offline', '2018-09-27 15:59:13', '8.5606113', '76.8810148'),
(268, 25, 'online', '2018-09-27 16:01:34', '8.5606113', '76.8810148'),
(269, 25, 'offline', '2018-09-27 16:13:35', '8.5606123', '76.8810231'),
(270, 52, 'online', '2018-09-27 16:13:47', '8.5606123', '76.8810231'),
(271, 52, 'offline', '2018-09-27 16:26:05', '8.5606235', '76.8810272'),
(272, 52, 'offline', '2018-09-27 17:39:31', '8.560612', '76.8810147'),
(273, 52, 'offline', '2018-09-27 17:59:17', '8.5606234', '76.881018'),
(274, 25, 'online', '2018-09-27 18:22:03', '8.5606118', '76.881014'),
(275, 5, 'online', '2018-09-27 18:25:03', '8.56069198902814', '76.8807760973792'),
(276, 5, 'offline', '2018-09-27 18:28:22', '8.56068931469724', '76.880785802778'),
(277, 25, 'offline', '2018-09-27 18:37:54', '8.560612', '76.8810147'),
(278, 52, 'offline', '2018-09-27 18:46:53', '8.56069997847958', '76.8807992662756'),
(279, 52, 'online', '2018-09-27 18:53:02', '8.56063637517606', '76.8806980664425'),
(280, 52, 'offline', '2018-09-27 18:54:15', '8.5606151', '76.8810081'),
(281, 52, 'offline', '2018-09-27 18:59:20', '8.56069334058232', '76.8807698756845'),
(282, 52, 'online', '2018-09-27 18:59:20', '8.56069385079103', '76.8807794384008'),
(283, 25, 'offline', '2018-09-27 18:59:23', '8.571032', '76.866333'),
(284, 52, 'offline', '2018-09-27 19:04:28', '8.56064576968402', '76.8807131513829'),
(285, 52, 'offline', '2018-09-27 19:09:20', '8.5606125', '76.8810147'),
(286, 54, 'online', '2018-09-27 19:12:24', '8.5606352', '76.8810068'),
(287, 54, 'offline', '2018-09-27 19:17:31', '8.5606091', '76.8810274'),
(288, 55, 'offline', '2018-09-27 19:38:46', '8.5606389', '76.8809873'),
(289, 56, 'online', '2018-09-27 19:54:42', '8.5570526', '76.88217'),
(290, 2, 'offline', '2018-09-27 20:08:23', '0.0', '0.0'),
(291, 54, 'online', '2018-09-27 20:10:14', '8.5845862', '76.9014975'),
(292, 54, 'offline', '2018-09-27 20:10:51', '8.5845862', '76.9014975'),
(293, 57, 'online', '2018-09-27 20:12:36', '8.5845844', '76.9014928'),
(294, 57, 'offline', '2018-09-27 20:12:46', '8.5845853', '76.9014925'),
(295, 47, 'online', '2018-09-27 20:15:44', '0.0', '0.0'),
(296, 47, 'offline', '2018-09-27 20:17:12', '6.4492803', '3.3314428'),
(297, 58, 'online', '2018-09-27 20:18:52', '6.4492803', '3.3314428'),
(298, 59, 'online', '2018-09-28 10:13:10', '8.5606118', '76.8810362'),
(299, 59, 'offline', '2018-09-28 13:36:31', '8.5606121', '76.8810357'),
(300, 60, 'offline', '2018-09-28 13:49:58', '8.5606042', '76.8810269'),
(301, 13, 'offline', '2018-09-28 13:50:35', '6.54530089999997', '3.36916859999998'),
(302, 61, 'online', '2018-09-28 13:58:16', '6.5453009', '3.3691686'),
(303, 61, 'offline', '2018-09-28 13:58:22', '6.5453009', '3.3691686'),
(304, 61, 'offline', '2018-09-28 14:12:23', '6.54528704265146', '3.36917563296283'),
(305, 61, 'online', '2018-09-28 14:13:59', '6.54528704265146', '3.36917563296283'),
(306, 61, 'offline', '2018-09-28 14:14:03', '6.54528704265146', '3.36917563296283'),
(307, 59, 'offline', '2018-09-28 15:39:52', '8.5606229', '76.8810144'),
(308, 58, 'offline', '2018-09-28 15:44:05', '6.4492803', '3.3314428'),
(309, 58, 'online', '2018-09-28 15:44:07', '6.4492803', '3.3314428'),
(310, 61, 'online', '2018-09-28 12:06:22', '6.54412827920778', '3.37007325142936'),
(311, 62, 'online', '2018-09-28 12:53:20', '8.5606222', '76.880993'),
(312, 47, 'online', '2018-09-28 13:29:05', '0.0', '0.0'),
(313, 25, 'online', '2018-09-28 14:42:25', '8.56066990654595', '76.8807563280042'),
(314, 62, 'offline', '2018-09-28 14:42:25', '8.5606043', '76.8810272'),
(315, 47, 'online', '2018-09-28 20:29:20', '0.0', '0.0'),
(316, 62, 'online', '2018-10-01 05:42:22', '8.5605739', '76.8810566'),
(317, 62, 'offline', '2018-10-03 11:16:15', '8.5606073', '76.8810266'),
(318, 62, 'online', '2018-10-03 11:16:16', '8.5606073', '76.8810266'),
(319, 62, 'offline', '2018-10-03 12:30:55', '8.5606186', '76.8810541'),
(320, 62, 'online', '2018-10-03 12:30:56', '8.5606186', '76.8810541'),
(321, 62, 'offline', '2018-10-03 12:34:36', '8.5606186', '76.8810541'),
(322, 62, 'online', '2018-10-03 12:34:37', '8.5606186', '76.8810541'),
(323, 62, 'offline', '2018-10-03 13:43:37', '8.5606186', '76.8810541'),
(324, 62, 'online', '2018-10-03 13:43:37', '8.5606186', '76.8810541'),
(325, 62, 'offline', '2018-10-03 13:45:26', '8.5606186', '76.8810541'),
(326, 62, 'online', '2018-10-03 13:45:27', '8.5606186', '76.8810541'),
(327, 62, 'offline', '2018-10-03 14:11:50', '8.5606166', '76.8810073'),
(328, 62, 'online', '2018-10-03 14:12:31', '8.5606243', '76.8809963'),
(329, 62, 'offline', '2018-10-03 14:13:28', '8.5606432', '76.8810034'),
(330, 64, 'online', '2018-10-03 14:16:32', '8.5606433', '76.8810029'),
(331, 64, 'offline', '2018-10-04 08:59:10', '8.5606227', '76.8810005'),
(332, 25, 'online', '2018-10-04 10:08:59', '8.5606338', '76.8809927'),
(333, 25, 'offline', '2018-10-04 10:09:00', '8.5606338', '76.8809927'),
(334, 25, 'offline', '2018-10-04 12:55:37', '0.000', '0.000'),
(335, 25, 'offline', '2018-10-04 12:57:51', '0.000', '0.000'),
(336, 25, 'offline', '2018-10-04 12:59:13', '8.56068140782235', '8.56068140782235'),
(337, 25, 'online', '2018-10-04 12:59:50', '8.56067814245917', '76.8807537551371'),
(338, 25, 'offline', '2018-10-04 12:59:51', '8.56068077817552', '76.8807571707537'),
(339, 25, 'online', '2018-10-04 13:00:02', '8.56069269904125', '76.8807689922034'),
(340, 25, 'offline', '2018-10-04 13:00:04', '8.56069269904125', '76.8807689922034'),
(341, 25, 'online', '2018-10-04 13:00:06', '8.56069269904125', '76.8807689922034'),
(342, 25, 'offline', '2018-10-04 13:01:23', '8.56069269904125', '76.8807689922034'),
(343, 25, 'offline', '2018-10-04 13:01:36', '8.56069269904125', '8.56069269904125'),
(344, 25, 'online', '2018-10-08 12:54:30', '8.5606233', '76.8810013'),
(345, 25, 'offline', '2018-10-08 12:54:39', '8.5606345', '76.8809924'),
(346, 25, 'offline', '2018-10-08 12:54:47', '8.5606345', '76.8809924'),
(347, 25, 'online', '2018-10-08 12:55:29', '8.5606223', '76.8809916'),
(348, 25, 'offline', '2018-10-08 12:55:36', '8.5606224', '76.8809933'),
(349, 13, 'online', '2018-10-09 18:10:26', '6.8355689', '3.6434395'),
(350, 76, 'online', '2018-10-13 14:36:51', '6.442623', '3.5392687'),
(351, 13, 'offline', '2018-10-16 12:12:45', '6.8355516', '3.6434301'),
(352, 13, 'online', '2018-10-16 12:12:49', '6.8355516', '3.6434301'),
(353, 25, 'online', '2018-10-17 13:33:14', '8.5606514', '76.8809937'),
(354, 13, 'offline', '2018-10-21 05:36:44', '0.0', '0.0'),
(355, 13, 'online', '2018-10-21 05:36:48', '0.0', '0.0'),
(356, 13, 'offline', '2018-10-21 05:37:09', '0.0', '0.0'),
(357, 13, 'online', '2018-10-21 05:37:10', '0.0', '0.0'),
(358, 25, 'offline', '2018-11-12 07:26:28', '8.5606511', '76.880971'),
(359, 49, 'online', '2019-01-24 14:54:46', '6.5943868', '3.3376341'),
(360, 49, 'offline', '2019-01-24 15:53:04', '6.5949592', '3.3394099'),
(361, 49, 'online', '2019-01-24 15:53:06', '6.5949592', '3.3394099'),
(362, 49, 'offline', '2019-01-24 18:28:23', '6.5944202', '3.3380871'),
(363, 49, 'offline', '2019-01-24 18:28:48', '6.5944202', '3.3380871'),
(364, 49, 'online', '2019-01-25 14:57:53', '6.5943583', '3.3377258'),
(365, 49, 'offline', '2019-01-25 14:57:56', '6.5943583', '3.3377258'),
(366, 49, 'online', '2019-01-25 14:57:57', '6.5943583', '3.3377258'),
(367, 49, 'offline', '2019-01-28 14:50:33', '6.5943546', '3.3377586'),
(368, 49, 'online', '2019-01-28 14:50:34', '6.5943546', '3.3377586'),
(369, 49, 'offline', '2019-02-05 17:23:52', '6.6291276', '3.3569845'),
(370, 49, 'online', '2019-02-05 17:23:53', '6.6291276', '3.3569845'),
(371, 49, 'offline', '2019-02-09 13:51:23', '6.6354455', '3.3617064'),
(372, 49, 'online', '2019-02-09 13:51:26', '6.6354455', '3.3617064'),
(373, 49, 'offline', '2019-02-09 14:32:57', '6.6354455', '3.3617064'),
(374, 49, 'online', '2019-02-09 14:33:02', '6.6354455', '3.3617064'),
(375, 49, 'offline', '2019-02-09 15:05:13', '6.6354455', '3.3617064'),
(376, 49, 'online', '2019-02-09 15:06:29', '6.6354455', '3.3617064'),
(377, 49, 'offline', '2019-02-09 16:31:39', '6.6354455', '3.3617064'),
(378, 49, 'online', '2019-02-09 16:31:43', '6.6354455', '3.3617064'),
(379, 49, 'offline', '2019-02-09 16:49:15', '6.6354455', '3.3617064'),
(380, 49, 'online', '2019-02-09 16:49:38', '6.6285785', '3.3655015'),
(381, 49, 'online', '2019-02-18 08:57:34', '6.6277631', '3.3569144'),
(382, 49, 'offline', '2019-02-19 13:44:13', '6.6392339', '3.3677065'),
(383, 49, 'online', '2019-02-19 13:44:14', '6.6392339', '3.3677065'),
(384, 49, 'online', '2019-02-19 13:48:13', '6.6277631', '3.3569144'),
(385, 49, 'online', '2019-02-20 15:13:53', '0.0', '0.0'),
(386, 49, 'offline', '2019-02-20 15:13:57', '0.0', '0.0'),
(387, 49, 'online', '2019-02-20 15:13:59', '0.0', '0.0'),
(388, 49, 'offline', '2019-02-20 15:16:45', '6.6399008', '3.3677065'),
(389, 49, 'offline', '2019-02-20 16:16:19', '6.6285785', '3.3655015'),
(390, 49, 'online', '2019-02-20 16:16:20', '6.6285785', '3.3655015'),
(391, 49, 'offline', '2019-02-20 16:20:53', '6.6285785', '3.3655015'),
(392, 49, 'online', '2019-02-20 16:20:55', '6.6285785', '3.3655015'),
(393, 49, 'online', '2019-02-20 16:24:53', '6.6285785', '3.3655015'),
(394, 49, 'offline', '2019-02-20 16:29:20', '6.6285785', '3.3655015'),
(395, 49, 'online', '2019-02-20 16:29:24', '6.6285785', '3.3655015'),
(396, 49, 'offline', '2019-02-21 13:36:02', '6.6277631', '3.3569144'),
(397, 49, 'online', '2019-02-21 13:36:03', '6.6277631', '3.3569144'),
(398, 49, 'offline', '2019-02-21 16:29:17', '6.6068147', '3.3488057'),
(399, 49, 'online', '2019-02-21 16:29:25', '6.6068147', '3.3488057'),
(400, 49, 'offline', '2019-02-22 19:08:25', '6.6354455', '3.3617051'),
(401, 49, 'online', '2019-02-22 19:08:26', '6.6354455', '3.3617051'),
(402, 49, 'offline', '2019-02-22 20:00:56', '0.0', '0.0'),
(403, 13, 'offline', '2019-02-22 20:10:53', '0.0', '0.0'),
(404, 13, 'online', '2019-02-22 20:10:59', '0.0', '0.0'),
(405, 13, 'offline', '2019-02-22 20:12:05', '0.0', '0.0'),
(406, 13, 'online', '2019-02-22 20:12:30', '0.0', '0.0'),
(407, 49, 'online', '2019-03-01 18:06:32', '0.0', '0.0'),
(408, 49, 'offline', '2019-03-01 18:06:54', '0.0', '0.0'),
(409, 49, 'online', '2019-03-01 18:06:56', '0.0', '0.0'),
(410, 49, 'offline', '2019-03-01 18:07:09', '0.0', '0.0'),
(411, 49, 'online', '2019-03-01 18:07:11', '0.0', '0.0'),
(412, 49, 'offline', '2019-03-02 10:41:48', '6.6399008', '3.3677065'),
(413, 49, 'online', '2019-03-02 10:41:49', '6.6399008', '3.3677065'),
(414, 49, 'offline', '2019-03-02 10:41:51', '6.6399008', '3.3677065'),
(415, 49, 'online', '2019-03-02 10:41:52', '6.6399008', '3.3677065'),
(416, 49, 'offline', '2019-03-02 10:57:58', '6.6353556', '3.3619008'),
(417, 49, 'online', '2019-03-02 10:58:06', '6.6353556', '3.3619008'),
(418, 13, 'offline', '2019-03-02 13:08:50', '6.63532947', '3.36188358'),
(419, 13, 'online', '2019-03-02 13:08:56', '6.63532947', '3.36188358'),
(420, 49, 'offline', '2019-03-02 13:19:10', '6.6020002365112305', '3.3610000610351562'),
(421, 49, 'online', '2019-03-02 16:51:39', '6.6353556', '3.3619008'),
(422, 49, 'offline', '2019-03-02 17:08:05', '6.634935', '3.3623516'),
(423, 49, 'online', '2019-03-02 17:08:08', '6.634935', '3.3623516'),
(424, 49, 'offline', '2019-03-02 17:11:02', '6.6353556', '3.3619008'),
(425, 49, 'online', '2019-03-02 17:17:54', '6.6353556', '3.3619008'),
(426, 49, 'offline', '2019-03-02 17:26:31', '6.6353867', '3.3617261'),
(427, 49, 'offline', '2019-03-02 18:16:45', '6.6030055', '3.3513288'),
(428, 49, 'offline', '2019-03-02 18:18:22', '6.6353644', '3.3618946'),
(429, 49, 'offline', '2019-03-02 18:19:04', '6.6030055', '3.3513288'),
(430, 49, 'online', '2019-03-02 18:20:00', '6.6353556', '3.3619008'),
(431, 13, 'online', '2019-03-02 18:48:09', '6.63532997', '3.36182222'),
(432, 13, 'offline', '2019-03-02 19:06:23', '6.63527023', '3.36183569');

-- --------------------------------------------------------

--
-- Table structure for table `edu_institution`
--

CREATE TABLE `edu_institution` (
  `ei_id` int(11) NOT NULL,
  `ei_name` varchar(70) NOT NULL,
  `ei_location` varchar(70) NOT NULL,
  `ei_lat` varchar(20) NOT NULL,
  `ei_long` varchar(20) NOT NULL,
  `ei_plae_id` varchar(20) NOT NULL,
  `ei_phone` varchar(20) NOT NULL,
  `ei_email` varchar(100) NOT NULL,
  `ei_address` text NOT NULL,
  `ei_password` varchar(150) NOT NULL DEFAULT 'schoolpass',
  `ei_token` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `edu_institution`
--

INSERT INTO `edu_institution` (`ei_id`, `ei_name`, `ei_location`, `ei_lat`, `ei_long`, `ei_plae_id`, `ei_phone`, `ei_email`, `ei_address`, `ei_password`, `ei_token`) VALUES
(1, 'Covenant University', 'Covenant University', '', '', '', '', 'school1@test.com', 'Covenant University ', 'schoolpass', 'fa1aa69ce99d09e8e76720c9cab235d09190cc6f149744f46c132e7afd983ad8'),
(2, 'Afe Babalola University', 'Afe babalola university', '', '', '', '', 'school2@test.com', 'sample adress', 'schoolpass', 'a4aa96e5b45055f8ab1487093a9ca0cc4609f1a99ea17ba587fe17987bff22fb'),
(3, 'Babcock University', 'Babcock University', '', '', '', '', 'school3@test.com', 'sample adress', 'schoolpass', '2a87638c04374d7e42cbddc2ba9ea1ede41c41b4d5d71e14e59bc8306263edb1'),
(4, 'University of Ilorin', 'University of Ilorin', '', '', '', '', 'school4@test.com', 'sample adress', 'schoolpass', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `edu_wallet`
--

CREATE TABLE `edu_wallet` (
  `w_id` int(11) NOT NULL,
  `w_edu_id` int(11) NOT NULL,
  `w_amount` int(11) NOT NULL,
  `w_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `w_last_updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `edu_wallet`
--

INSERT INTO `edu_wallet` (`w_id`, `w_edu_id`, `w_amount`, `w_created`, `w_last_updated`) VALUES
(1, 1, 847, '2019-03-02 12:22:34', '2019-03-02 20:22:34'),
(2, 2, 648, '2019-03-01 15:40:34', '2019-03-01 23:40:34'),
(3, 3, 4200, '2018-11-05 07:57:35', '2018-11-05 07:57:35'),
(4, 4, 400, '2018-11-05 07:57:07', '2018-11-05 07:57:07');

-- --------------------------------------------------------

--
-- Table structure for table `moov_logs`
--

CREATE TABLE `moov_logs` (
  `ml_id` int(11) NOT NULL,
  `ml_type` varchar(20) NOT NULL,
  `ml_reason` text NOT NULL,
  `ml_added` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `moov_wallet`
--

CREATE TABLE `moov_wallet` (
  `mw_id` int(11) NOT NULL,
  `mw_user_id` int(11) NOT NULL,
  `mw_transaction_type` varchar(255) NOT NULL,
  `mw_amount` varchar(200) NOT NULL,
  `mw_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mw_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `moov_wallet`
--

INSERT INTO `moov_wallet` (`mw_id`, `mw_user_id`, `mw_transaction_type`, `mw_amount`, `mw_time`, `mw_date`) VALUES
(1, 2, 'ride', '100.0', '2018-09-20 12:36:22', '2018-09-20'),
(2, 8, 'ride', '13160.4', '2018-09-20 18:41:13', '2018-09-20'),
(3, 4, 'ride', '421.75', '2018-09-21 09:41:12', '2018-09-21'),
(4, 4, 'ride', '421.75', '2018-09-21 09:41:21', '2018-09-21'),
(5, 4, 'ride', '425.1', '2018-09-21 09:43:54', '2018-09-21'),
(6, 4, 'ride', '421.75', '2018-09-21 09:56:12', '2018-09-21'),
(7, 4, 'ride', '421.75', '2018-09-21 09:56:13', '2018-09-21'),
(8, 2, 'ride', '250', '2018-09-21 10:45:56', '2018-09-21'),
(9, 4, 'ride', '421.75', '2018-09-21 12:52:43', '2018-09-21'),
(10, 4, 'ride', '421.75', '2018-09-21 12:54:45', '2018-09-21'),
(11, 4, 'ride', '421.75', '2018-09-21 12:54:46', '2018-09-21'),
(12, 1, 'ride', '250', '2018-09-21 13:41:36', '2018-09-21'),
(13, 1, 'ride', '250', '2018-09-21 13:41:37', '2018-09-21'),
(14, 4, 'ride', '421.75', '2018-09-21 14:12:34', '2018-09-21'),
(15, 4, 'ride', '421.75', '2018-09-21 14:12:40', '2018-09-21'),
(16, 4, 'ride', '421.75', '2018-09-21 14:12:40', '2018-09-21'),
(17, 4, 'ride', '421.75', '2018-09-21 14:12:41', '2018-09-21'),
(18, 4, 'ride', '471.75', '2018-09-21 14:28:25', '2018-09-21'),
(19, 4, 'ride', '471.75', '2018-09-21 14:37:37', '2018-09-21'),
(20, 4, 'ride', '471.75', '2018-09-21 14:37:38', '2018-09-21'),
(21, 1, 'ride', '250', '2018-09-21 16:14:23', '2018-09-21'),
(22, 1, 'ride', '250', '2018-09-21 16:14:24', '2018-09-21'),
(23, 1, 'ride', '250', '2018-09-21 16:14:25', '2018-09-21'),
(24, 1, 'ride', '250', '2018-09-21 16:16:13', '2018-09-21'),
(25, 1, 'ride', '250', '2018-09-21 18:06:15', '2018-09-21'),
(26, 8, 'ride', '2869.7', '2018-09-21 18:09:33', '2018-09-21'),
(27, 4, 'ride', '471.75', '2018-09-21 18:13:40', '2018-09-21'),
(28, 4, 'ride', '471.75', '2018-09-21 18:13:41', '2018-09-21'),
(29, 8, 'ride', '13162.25', '2018-09-21 18:14:11', '2018-09-21'),
(30, 11, 'ride', '2869.7', '2018-09-21 18:38:46', '2018-09-21'),
(31, 11, 'ride', '2869.7', '2018-09-21 18:41:31', '2018-09-21'),
(32, 11, 'ride', '2869.7', '2018-09-21 18:44:05', '2018-09-21'),
(33, 1, 'ride', '250', '2018-09-21 18:45:51', '2018-09-21'),
(34, 14, 'ride', '220.4', '2018-09-21 19:58:39', '2018-09-21'),
(35, 4, 'ride', '421.75', '2018-09-24 08:40:50', '2018-09-24'),
(36, 4, 'ride', '421.75', '2018-09-24 09:01:44', '2018-09-24'),
(37, 4, 'ride', '421.75', '2018-09-24 09:01:45', '2018-09-24'),
(38, 4, 'ride', '421.75', '2018-09-24 09:25:41', '2018-09-24'),
(39, 1, 'ride', '250', '2018-09-25 17:12:18', '2018-09-25'),
(40, 1, 'ride', '250', '2018-09-25 17:12:47', '2018-09-25'),
(41, 1, 'ride', '250', '2018-09-25 17:13:58', '2018-09-25'),
(42, 1, 'ride', '250', '2018-09-26 10:20:51', '2018-09-26'),
(43, 1, 'ride', '250', '2018-09-26 10:20:54', '2018-09-26'),
(44, 1, 'ride', '250', '2018-09-26 11:46:16', '2018-09-26'),
(45, 1, 'ride', '250', '2018-09-26 11:47:06', '2018-09-26'),
(46, 1, 'ride', '250', '2018-09-26 11:53:14', '2018-09-26'),
(47, 1, 'ride', '250', '2018-09-26 12:31:35', '2018-09-26'),
(48, 4, 'ride', '471.75', '2018-09-26 17:25:23', '2018-09-26'),
(49, 4, 'ride', '471.75', '2018-09-26 17:27:09', '2018-09-26'),
(50, 4, 'ride', '471.75', '2018-09-26 17:33:54', '2018-09-26'),
(51, 4, 'ride', '471.75', '2018-09-26 17:39:03', '2018-09-26'),
(52, 4, 'ride', '471.75', '2018-09-26 17:47:57', '2018-09-26'),
(53, 11, 'ride', '2725.85', '2018-09-26 17:48:30', '2018-09-26'),
(54, 11, 'ride', '2869.3', '2018-09-26 17:53:09', '2018-09-26'),
(55, 4, 'ride', '28971.2', '2018-09-26 18:05:11', '2018-09-26'),
(56, 14, 'ride', '100.0', '2018-09-26 19:22:46', '2018-09-26'),
(57, 1, 'ride', '250', '2018-09-27 08:51:13', '2018-09-27'),
(58, 1, 'ride', '250', '2018-09-27 08:56:53', '2018-09-27'),
(59, 11, 'ride', '2725.85', '2018-09-27 14:14:34', '2018-09-27'),
(60, 11, 'ride', '2920.8', '2018-09-27 17:53:35', '2018-09-27'),
(61, 11, 'ride', '2920.8', '2018-09-27 17:53:36', '2018-09-27'),
(62, 4, 'ride', '475.1', '2018-09-27 18:00:03', '2018-09-27'),
(63, 4, 'ride', '475.1', '2018-09-27 18:00:04', '2018-09-27'),
(64, 14, 'ride', '100.0', '2018-09-27 19:23:16', '2018-09-27'),
(65, 14, 'ride', '331.25', '2018-09-28 11:59:30', '2018-09-28'),
(66, 4, 'ride', '2870.8', '2018-09-28 12:19:38', '2018-09-28'),
(67, 4, 'ride', '2870.8', '2018-09-28 12:30:41', '2018-09-28'),
(68, 4, 'ride', '421.75', '2018-09-28 13:48:25', '2018-09-28'),
(69, 4, 'ride', '421.75', '2018-09-28 13:51:42', '2018-09-28'),
(70, 4, 'ride', '421.75', '2018-09-28 13:51:43', '2018-09-28'),
(71, 4, 'ride', '421.75', '2018-09-28 13:53:26', '2018-09-28'),
(72, 11, 'ride', '2870.8', '2018-10-01 04:42:20', '2018-10-01'),
(73, 4, 'ride', '2870.8', '2018-10-01 05:34:04', '2018-10-01'),
(74, 63, 'ride', '283.1', '2018-10-03 11:30:40', '2018-10-03'),
(75, 4, 'ride', '421.75', '2018-10-03 13:17:42', '2018-10-03'),
(76, 4, 'FUND_SCHOOL', '200', '2018-11-05 07:57:07', '2018-11-05'),
(77, 3, 'FUND_SCHOOL', '200', '2018-11-05 07:57:35', '2018-11-05'),
(78, 159, 'ride', '0', '2019-01-24 22:51:28', '2019-01-24'),
(79, 159, 'ride', '0', '2019-01-25 21:59:21', '2019-01-25'),
(80, 2, 'ride', '30', '2019-02-09 21:16:20', '2019-02-09'),
(81, 2, 'ride', '56.16', '2019-02-09 23:35:44', '2019-02-09'),
(82, 159, 'ride', '0', '2019-02-19 08:56:26', '2019-02-19'),
(83, 159, 'ride', '0', '2019-02-19 08:58:11', '2019-02-19'),
(84, 159, 'ride', '0', '2019-02-19 08:58:17', '2019-02-19'),
(85, 1, 'FUND_DRIVER', '2000', '2019-02-20 14:12:14', '2019-02-20'),
(86, 3, 'FUND_DRIVER', '4000', '2019-02-20 14:14:07', '2019-02-20'),
(87, 3, 'FUND_DRIVER', '1000', '2019-02-20 14:14:19', '2019-02-20'),
(88, 166, 'FUND_DRIVER', '1000', '2019-02-20 14:24:58', '2019-02-20'),
(89, 1, 'FUND_SCHOOL', '2000', '2019-02-20 14:29:55', '2019-02-20'),
(90, 159, 'ride', '96.405', '2019-02-20 23:25:02', '2019-02-20'),
(91, 159, 'ride', '96.405', '2019-02-20 23:25:10', '2019-02-20'),
(92, 159, 'ride', '96.405', '2019-02-20 23:27:19', '2019-02-20'),
(93, 159, 'ride', '96.405', '2019-02-20 23:27:22', '2019-02-20'),
(94, 159, 'ride', '96.405', '2019-02-20 23:27:26', '2019-02-20'),
(95, 12, 'ride', '80.00999999999999', '2019-02-21 20:37:55', '2019-02-21'),
(96, 12, 'ride', '80.00999999999999', '2019-02-21 21:03:08', '2019-02-21'),
(97, 159, 'ride', '62.98499999999999', '2019-02-22 23:47:26', '2019-02-22'),
(98, 12, 'ride', '239.46', '2019-03-01 23:40:34', '2019-03-01'),
(99, 159, 'ride', '88.8', '2019-03-02 20:22:34', '2019-03-02');

-- --------------------------------------------------------

--
-- Table structure for table `otp_mobile`
--

CREATE TABLE `otp_mobile` (
  `otp_id` int(11) NOT NULL,
  `otp_phone` varchar(20) NOT NULL,
  `opt_county` varchar(20) NOT NULL,
  `otp_code` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `price_share`
--

CREATE TABLE `price_share` (
  `school_id` int(11) NOT NULL,
  `moov` int(11) NOT NULL,
  `driver` int(11) NOT NULL,
  `institution` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `price_share`
--

INSERT INTO `price_share` (`school_id`, `moov`, `driver`, `institution`) VALUES
(1, 30, 30, 40),
(2, 30, 30, 40),
(4, 50, 20, 30);

-- --------------------------------------------------------

--
-- Table structure for table `ride_peak_hours`
--

CREATE TABLE `ride_peak_hours` (
  `rph_id` int(11) NOT NULL,
  `rph_from` varchar(70) NOT NULL,
  `rph_to` varchar(70) NOT NULL,
  `rph_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rph_visibility` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ride_peak_hours`
--

INSERT INTO `ride_peak_hours` (`rph_id`, `rph_from`, `rph_to`, `rph_added`, `rph_visibility`) VALUES
(1, '08:00', '09:00', '2018-07-27 09:08:13', 1),
(2, '12:00', '13:00', '2018-07-27 09:08:13', 1),
(3, '16:00', '20:00', '2018-07-27 09:09:18', 1),
(4, '12:00', '13:00', '2018-07-27 09:09:18', 1),
(5, '15:00', '15:30', '2018-07-27 09:09:18', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ride_rates`
--

CREATE TABLE `ride_rates` (
  `rr_id` int(11) NOT NULL,
  `rr_normal_rate` varchar(70) NOT NULL,
  `rr_peak_hour_rate` varchar(70) NOT NULL,
  `rr_per_kilometer` varchar(20) NOT NULL,
  `rr_per_minutes` varchar(20) NOT NULL,
  `rr_per_hour` varchar(20) NOT NULL,
  `rr_cancellation_rate` varchar(50) NOT NULL,
  `rr_date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ride_rates`
--

INSERT INTO `ride_rates` (`rr_id`, `rr_normal_rate`, `rr_peak_hour_rate`, `rr_per_kilometer`, `rr_per_minutes`, `rr_per_hour`, `rr_cancellation_rate`, `rr_date_added`) VALUES
(1, '50', '100', '50', '5.50', '', '', '2018-07-27 09:00:30'),
(2, '50', '100', '50', '5.50', '', '', '2018-07-27 09:00:30');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `level`, `name`) VALUES
(1, 1, 'SUPERADMIN'),
(2, 2, 'ADMIN'),
(3, 3, 'SCHOOL'),
(4, 4, 'DRIVER'),
(5, 5, 'USER'),
(6, 6, 'TESTER');

-- --------------------------------------------------------

--
-- Table structure for table `salary_release`
--

CREATE TABLE `salary_release` (
  `id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `weekday` varchar(50) NOT NULL,
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `added_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `support_messages`
--

CREATE TABLE `support_messages` (
  `id` int(11) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `message_type` enum('admin','school','user','driver') NOT NULL DEFAULT 'user',
  `school_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `support_messages`
--

INSERT INTO `support_messages` (`id`, `subject`, `message`, `user_id`, `created_at`, `message_type`, `school_id`) VALUES
(1, 'App is not working', 'My app just crashed', 27, '2019-02-05 12:56:14', 'user', NULL),
(2, 'App is not working', 'My app just crashed', 27, '2019-02-05 13:32:29', 'user', NULL),
(3, 'App is not working', 'My app just crashed', 27, '2019-02-05 13:33:30', 'user', NULL),
(4, 'App is not working', 'My app just crashed', 27, '2019-02-05 14:23:18', 'user', NULL),
(5, 'App is not working', 'My app just crashed', 27, '2019-02-05 14:27:09', 'user', NULL),
(6, 'App is not working', 'My app just crashed', 27, '2019-02-05 14:30:03', 'user', NULL),
(7, 'Student are complaning', 'Students are complaining that your app is not working fine as previously specified. Pls help us fix this issue', NULL, '2019-02-05 14:30:03', 'school', 1),
(8, 'Nice work', 'This app is such a success, keep it up. Will you?', NULL, '2019-02-05 14:30:03', 'school', 2),
(9, 'Commendation', 'I\'d like to commend you for your good work, keep it up!', 145, '2019-02-05 12:56:14', 'user', NULL),
(10, 'HEY', 'Your drivers are the best ', 2, '2019-02-19 13:54:10', 'user', NULL),
(11, 'Hello world', 'Hello guys, I\'m a message', 40, '2019-02-20 10:07:37', 'user', NULL),
(12, 'Hey', 'Yo', 159, '2019-02-20 22:08:29', 'user', NULL),
(13, 'Thank you for what you\'ve bee', 'Thank you for what you\'ve been doing for ys, we really appreciate', NULL, '2019-02-23 18:31:53', 'school', 1),
(14, 'hhh', 'vvvv\n', 191, '2019-02-26 22:01:57', 'user', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `t_id` int(11) NOT NULL,
  `t_user_id` int(11) NOT NULL,
  `t_reference` varchar(50) NOT NULL,
  `t_access_code` varchar(20) DEFAULT NULL,
  `t_amount` varchar(100) DEFAULT NULL,
  `t_currency` varchar(10) DEFAULT NULL,
  `t_status` varchar(10) DEFAULT NULL,
  `t_started` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `t_type` varchar(50) DEFAULT 'recharge',
  `t_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `t_response` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`t_id`, `t_user_id`, `t_reference`, `t_access_code`, `t_amount`, `t_currency`, `t_status`, `t_started`, `t_type`, `t_date`, `t_response`) VALUES
(1, 2, '9f28a766cff107a10879', '9f28a766cff107a10879', '1000', 'NGN', 'completed', '2018-09-20 12:25:53', 'recharge', '2018-09-20 07:55:53', 'O:8:\"stdClass\":24:{s:2:\"id\";i:51855807;s:6:\"domain\";s:4:\"live\";s:6:\"status\";s:7:\"success\";s:9:\"reference\";s:20:\"9f28a766cff107a10879\";s:6:\"amount\";i:100000;s:7:\"message\";N;s:16:\"gateway_response\";s:8:\"Approved\";s:7:\"paid_at\";s:24:\"2018-09-20T07:55:52.000Z\";s:10:\"created_at\";s:24:\"2018-09-20T07:55:36.000Z\";s:7:\"channel\";s:4:\"card\";s:8:\"currency\";s:3:\"NGN\";s:10:\"ip_address\";s:30:\"148.66.132.242, 172.69.134.197\";s:8:\"metadata\";O:8:\"stdClass\":1:{s:12:\"site_details\";O:8:\"stdClass\":2:{s:10:\"first_name\";s:16:\"Adedipo Adekanbi\";s:7:\"user_id\";s:1:\"2\";}}s:3:\"log\";N;s:4:\"fees\";i:1500;s:10:\"fees_split\";N;s:13:\"authorization\";O:8:\"stdClass\":12:{s:18:\"authorization_code\";s:15:\"AUTH_lgo15p0m7g\";s:3:\"bin\";s:6:\"539983\";s:5:\"last4\";s:4:\"5041\";s:9:\"exp_month\";s:2:\"11\";s:8:\"exp_year\";s:4:\"2018\";s:7:\"channel\";s:4:\"card\";s:9:\"card_type\";s:16:\"mastercard DEBIT\";s:4:\"bank\";s:19:\"Guaranty Trust Bank\";s:12:\"country_code\";s:2:\"NG\";s:5:\"brand\";s:10:\"mastercard\";s:8:\"reusable\";b:1;s:9:\"signature\";s:24:\"SIG_OmIBOMIIUBaAbAmWhZAP\";}s:8:\"customer\";O:8:\"stdClass\":8:{s:2:\"id\";i:3480154;s:10:\"first_name\";N;s:9:\"last_name\";N;s:5:\"email\";s:25:\"adekanbiadedipo@gmail.com\";s:13:\"customer_code\";s:19:\"CUS_nsy06s8aeqaj7oa\";s:5:\"phone\";N;s:8:\"metadata\";N;s:11:\"risk_action\";s:7:\"default\";}s:4:\"plan\";N;s:6:\"paidAt\";s:24:\"2018-09-20T07:55:52.000Z\";s:9:\"createdAt\";s:24:\"2018-09-20T07:55:36.000Z\";s:16:\"transaction_date\";s:24:\"2018-09-20T07:55:36.000Z\";s:11:\"plan_object\";O:8:\"stdClass\":0:{}s:10:\"subaccount\";O:8:\"stdClass\":0:{}}'),
(2, 2, '000000', '000000', '100.0', 'NGN', 'completed', '2018-09-20 12:36:22', 'ride_pay', '2018-09-20 12:36:22', 'done'),
(3, 8, '000000', '000000', '13160.4', 'NGN', 'completed', '2018-09-20 18:41:13', 'ride_pay', '2018-09-20 18:41:13', 'done'),
(4, 4, '000000', '000000', '421.75', 'NGN', 'completed', '2018-09-21 09:41:12', 'ride_pay', '2018-09-21 09:41:12', 'done'),
(5, 4, '000000', '000000', '421.75', 'NGN', 'completed', '2018-09-21 09:41:21', 'ride_pay', '2018-09-21 09:41:21', 'done'),
(6, 4, '000000', '000000', '425.1', 'NGN', 'completed', '2018-09-21 09:43:54', 'ride_pay', '2018-09-21 09:43:54', 'done'),
(7, 4, '000000', '000000', '421.75', 'NGN', 'completed', '2018-09-21 09:56:12', 'ride_pay', '2018-09-21 09:56:12', 'done'),
(8, 4, '000000', '000000', '421.75', 'NGN', 'completed', '2018-09-21 09:56:13', 'ride_pay', '2018-09-21 09:56:13', 'done'),
(9, 2, '000000', '000000', '250', 'NGN', 'completed', '2018-09-21 10:45:56', 'ride_pay', '2018-09-21 10:45:56', 'done'),
(10, 4, '000000', '000000', '421.75', 'NGN', 'completed', '2018-09-21 12:52:43', 'ride_pay', '2018-09-21 12:52:43', 'done'),
(11, 4, '000000', '000000', '421.75', 'NGN', 'completed', '2018-09-21 12:54:45', 'ride_pay', '2018-09-21 12:54:45', 'done'),
(12, 4, '000000', '000000', '421.75', 'NGN', 'completed', '2018-09-21 12:54:46', 'ride_pay', '2018-09-21 12:54:46', 'done'),
(13, 1, '000000', '000000', '250', 'NGN', 'completed', '2018-09-21 13:41:36', 'ride_pay', '2018-09-21 13:41:36', 'done'),
(14, 1, '000000', '000000', '250', 'NGN', 'completed', '2018-09-21 13:41:37', 'ride_pay', '2018-09-21 13:41:37', 'done'),
(15, 4, '000000', '000000', '421.75', 'NGN', 'completed', '2018-09-21 14:12:34', 'ride_pay', '2018-09-21 14:12:34', 'done'),
(16, 4, '000000', '000000', '421.75', 'NGN', 'completed', '2018-09-21 14:12:40', 'ride_pay', '2018-09-21 14:12:40', 'done'),
(17, 4, '000000', '000000', '421.75', 'NGN', 'completed', '2018-09-21 14:12:40', 'ride_pay', '2018-09-21 14:12:40', 'done'),
(18, 4, '000000', '000000', '421.75', 'NGN', 'completed', '2018-09-21 14:12:41', 'ride_pay', '2018-09-21 14:12:41', 'done'),
(19, 4, '000000', '000000', '471.75', 'NGN', 'completed', '2018-09-21 14:28:25', 'ride_pay', '2018-09-21 14:28:25', 'done'),
(20, 4, '000000', '000000', '471.75', 'NGN', 'completed', '2018-09-21 14:37:37', 'ride_pay', '2018-09-21 14:37:37', 'done'),
(21, 4, '000000', '000000', '471.75', 'NGN', 'completed', '2018-09-21 14:37:38', 'ride_pay', '2018-09-21 14:37:38', 'done'),
(22, 1, '000000', '000000', '250', 'NGN', 'completed', '2018-09-21 16:14:23', 'ride_pay', '2018-09-21 16:14:23', 'done'),
(23, 1, '000000', '000000', '250', 'NGN', 'completed', '2018-09-21 16:14:24', 'ride_pay', '2018-09-21 16:14:24', 'done'),
(24, 1, '000000', '000000', '250', 'NGN', 'completed', '2018-09-21 16:14:25', 'ride_pay', '2018-09-21 16:14:25', 'done'),
(25, 1, '000000', '000000', '250', 'NGN', 'completed', '2018-09-21 16:16:13', 'ride_pay', '2018-09-21 16:16:13', 'done'),
(26, 1, '000000', '000000', '250', 'NGN', 'completed', '2018-09-21 18:06:15', 'ride_pay', '2018-09-21 18:06:15', 'done'),
(27, 8, '000000', '000000', '2869.7', 'NGN', 'completed', '2018-09-21 18:09:33', 'ride_pay', '2018-09-21 18:09:33', 'done'),
(28, 4, '000000', '000000', '471.75', 'NGN', 'completed', '2018-09-21 18:13:40', 'ride_pay', '2018-09-21 18:13:40', 'done'),
(29, 4, '000000', '000000', '471.75', 'NGN', 'completed', '2018-09-21 18:13:41', 'ride_pay', '2018-09-21 18:13:41', 'done'),
(30, 8, '000000', '000000', '13162.25', 'NGN', 'completed', '2018-09-21 18:14:11', 'ride_pay', '2018-09-21 18:14:11', 'done'),
(31, 11, '000000', '000000', '2869.7', 'NGN', 'completed', '2018-09-21 18:38:46', 'ride_pay', '2018-09-21 18:38:46', 'done'),
(32, 11, '000000', '000000', '2869.7', 'NGN', 'completed', '2018-09-21 18:41:31', 'ride_pay', '2018-09-21 18:41:31', 'done'),
(33, 11, '000000', '000000', '2869.7', 'NGN', 'completed', '2018-09-21 18:44:05', 'ride_pay', '2018-09-21 18:44:05', 'done'),
(34, 1, '000000', '000000', '250', 'NGN', 'completed', '2018-09-21 18:45:51', 'ride_pay', '2018-09-21 18:45:51', 'done'),
(35, 14, 'a412e3955d27575e6e44', 'a412e3955d27575e6e44', '1000', 'NGN', 'completed', '2018-09-21 19:37:25', 'recharge', '2018-09-21 15:07:25', 'O:8:\"stdClass\":24:{s:2:\"id\";i:52192508;s:6:\"domain\";s:4:\"live\";s:6:\"status\";s:7:\"success\";s:9:\"reference\";s:20:\"a412e3955d27575e6e44\";s:6:\"amount\";i:100000;s:7:\"message\";N;s:16:\"gateway_response\";s:8:\"Approved\";s:7:\"paid_at\";s:24:\"2018-09-21T15:07:22.000Z\";s:10:\"created_at\";s:24:\"2018-09-21T15:06:42.000Z\";s:7:\"channel\";s:4:\"card\";s:8:\"currency\";s:3:\"NGN\";s:10:\"ip_address\";s:29:\"148.66.132.242, 172.68.146.48\";s:8:\"metadata\";O:8:\"stdClass\":1:{s:12:\"site_details\";O:8:\"stdClass\":2:{s:10:\"first_name\";s:12:\"Chinedu Ofor\";s:7:\"user_id\";s:2:\"14\";}}s:3:\"log\";N;s:4:\"fees\";i:1500;s:10:\"fees_split\";N;s:13:\"authorization\";O:8:\"stdClass\":12:{s:18:\"authorization_code\";s:15:\"AUTH_07ejz1gdbx\";s:3:\"bin\";s:6:\"539983\";s:5:\"last4\";s:4:\"5041\";s:9:\"exp_month\";s:2:\"11\";s:8:\"exp_year\";s:4:\"2018\";s:7:\"channel\";s:4:\"card\";s:9:\"card_type\";s:16:\"mastercard DEBIT\";s:4:\"bank\";s:19:\"Guaranty Trust Bank\";s:12:\"country_code\";s:2:\"NG\";s:5:\"brand\";s:10:\"mastercard\";s:8:\"reusable\";b:1;s:9:\"signature\";s:24:\"SIG_OmIBOMIIUBaAbAmWhZAP\";}s:8:\"customer\";O:8:\"stdClass\":8:{s:2:\"id\";i:3312671;s:10:\"first_name\";N;s:9:\"last_name\";N;s:5:\"email\";s:28:\"oforchinedukelechi@gmail.com\";s:13:\"customer_code\";s:19:\"CUS_p2rje851dz43epx\";s:5:\"phone\";N;s:8:\"metadata\";N;s:11:\"risk_action\";s:7:\"default\";}s:4:\"plan\";N;s:6:\"paidAt\";s:24:\"2018-09-21T15:07:22.000Z\";s:9:\"createdAt\";s:24:\"2018-09-21T15:06:42.000Z\";s:16:\"transaction_date\";s:24:\"2018-09-21T15:06:42.000Z\";s:11:\"plan_object\";O:8:\"stdClass\":0:{}s:10:\"subaccount\";O:8:\"stdClass\":0:{}}'),
(36, 14, '000000', '000000', '220.4', 'NGN', 'completed', '2018-09-21 19:58:39', 'ride_pay', '2018-09-21 19:58:39', 'done'),
(37, 4, '000000', '000000', '421.75', 'NGN', 'completed', '2018-09-24 08:40:50', 'ride_pay', '2018-09-24 08:40:50', 'done'),
(38, 4, '000000', '000000', '421.75', 'NGN', 'completed', '2018-09-24 09:01:44', 'ride_pay', '2018-09-24 09:01:44', 'done'),
(39, 4, '000000', '000000', '421.75', 'NGN', 'completed', '2018-09-24 09:01:45', 'ride_pay', '2018-09-24 09:01:45', 'done'),
(40, 4, '000000', '000000', '421.75', 'NGN', 'completed', '2018-09-24 09:25:41', 'ride_pay', '2018-09-24 09:25:41', 'done'),
(41, 1, '000000', '000000', '250', 'NGN', 'completed', '2018-09-25 17:12:18', 'ride_pay', '2018-09-25 17:12:18', 'done'),
(42, 1, '000000', '000000', '250', 'NGN', 'completed', '2018-09-25 17:12:47', 'ride_pay', '2018-09-25 17:12:47', 'done'),
(43, 1, '000000', '000000', '250', 'NGN', 'completed', '2018-09-25 17:13:58', 'ride_pay', '2018-09-25 17:13:58', 'done'),
(44, 1, '000000', '000000', '250', 'NGN', 'completed', '2018-09-26 10:20:51', 'ride_pay', '2018-09-26 10:20:51', 'done'),
(45, 1, '000000', '000000', '250', 'NGN', 'completed', '2018-09-26 10:20:54', 'ride_pay', '2018-09-26 10:20:54', 'done'),
(46, 1, '000000', '000000', '250', 'NGN', 'completed', '2018-09-26 11:46:16', 'ride_pay', '2018-09-26 11:46:16', 'done'),
(47, 1, '000000', '000000', '250', 'NGN', 'completed', '2018-09-26 11:47:06', 'ride_pay', '2018-09-26 11:47:06', 'done'),
(48, 1, '000000', '000000', '250', 'NGN', 'completed', '2018-09-26 11:53:14', 'ride_pay', '2018-09-26 11:53:14', 'done'),
(49, 1, '000000', '000000', '250', 'NGN', 'completed', '2018-09-26 12:31:35', 'ride_pay', '2018-09-26 12:31:35', 'done'),
(50, 42, 'd6c983f797e3f54db374', 'eaafvpd7k2nefn3', '500000', '', 'started', '2018-09-26 17:23:18', 'recharge', '2018-09-26 12:53:18', 'created'),
(51, 4, '000000', '000000', '471.75', 'NGN', 'completed', '2018-09-26 17:25:23', 'ride_pay', '2018-09-26 17:25:23', 'done'),
(52, 4, '000000', '000000', '471.75', 'NGN', 'completed', '2018-09-26 17:27:09', 'ride_pay', '2018-09-26 17:27:09', 'done'),
(53, 4, '000000', '000000', '471.75', 'NGN', 'completed', '2018-09-26 17:33:54', 'ride_pay', '2018-09-26 17:33:54', 'done'),
(54, 4, '000000', '000000', '471.75', 'NGN', 'completed', '2018-09-26 17:39:03', 'ride_pay', '2018-09-26 17:39:03', 'done'),
(55, 4, '000000', '000000', '471.75', 'NGN', 'completed', '2018-09-26 17:47:57', 'ride_pay', '2018-09-26 17:47:57', 'done'),
(56, 11, '000000', '000000', '2725.85', 'NGN', 'completed', '2018-09-26 17:48:30', 'ride_pay', '2018-09-26 17:48:30', 'done'),
(57, 11, '000000', '000000', '2869.3', 'NGN', 'completed', '2018-09-26 17:53:09', 'ride_pay', '2018-09-26 17:53:09', 'done'),
(58, 4, '000000', '000000', '28971.2', 'NGN', 'completed', '2018-09-26 18:05:11', 'ride_pay', '2018-09-26 18:05:11', 'done'),
(59, 14, '000000', '000000', '100.0', 'NGN', 'completed', '2018-09-26 19:22:46', 'ride_pay', '2018-09-26 19:22:46', 'done'),
(60, 2, '45febbaaa1a8289ee775', 'i3hpiwjrr7vgk6z', '500', '', 'started', '2018-09-26 19:41:03', 'recharge', '2018-09-26 15:11:03', 'created'),
(61, 2, '0988633b58ffb2f821f3', '0988633b58ffb2f821f3', '507.5', 'NGN', 'completed', '2018-09-26 19:44:06', 'recharge', '2018-09-26 15:14:06', 'O:8:\"stdClass\":24:{s:2:\"id\";i:53526116;s:6:\"domain\";s:4:\"live\";s:6:\"status\";s:7:\"success\";s:9:\"reference\";s:20:\"0988633b58ffb2f821f3\";s:6:\"amount\";i:50750;s:7:\"message\";N;s:16:\"gateway_response\";s:8:\"Approved\";s:7:\"paid_at\";s:24:\"2018-09-26T15:14:02.000Z\";s:10:\"created_at\";s:24:\"2018-09-26T15:13:41.000Z\";s:7:\"channel\";s:4:\"card\";s:8:\"currency\";s:3:\"NGN\";s:10:\"ip_address\";s:30:\"148.66.132.242, 162.158.166.15\";s:8:\"metadata\";O:8:\"stdClass\":1:{s:12:\"site_details\";O:8:\"stdClass\":2:{s:10:\"first_name\";s:16:\"Adedipo Adekanbi\";s:7:\"user_id\";s:1:\"2\";}}s:3:\"log\";N;s:4:\"fees\";i:762;s:10:\"fees_split\";N;s:13:\"authorization\";O:8:\"stdClass\":12:{s:18:\"authorization_code\";s:15:\"AUTH_dtyszijjtb\";s:3:\"bin\";s:6:\"539983\";s:5:\"last4\";s:4:\"5041\";s:9:\"exp_month\";s:2:\"11\";s:8:\"exp_year\";s:4:\"2018\";s:7:\"channel\";s:4:\"card\";s:9:\"card_type\";s:16:\"mastercard DEBIT\";s:4:\"bank\";s:19:\"Guaranty Trust Bank\";s:12:\"country_code\";s:2:\"NG\";s:5:\"brand\";s:10:\"mastercard\";s:8:\"reusable\";b:1;s:9:\"signature\";s:24:\"SIG_OmIBOMIIUBaAbAmWhZAP\";}s:8:\"customer\";O:8:\"stdClass\":8:{s:2:\"id\";i:3480154;s:10:\"first_name\";N;s:9:\"last_name\";N;s:5:\"email\";s:25:\"adekanbiadedipo@gmail.com\";s:13:\"customer_code\";s:19:\"CUS_nsy06s8aeqaj7oa\";s:5:\"phone\";N;s:8:\"metadata\";N;s:11:\"risk_action\";s:7:\"default\";}s:4:\"plan\";N;s:6:\"paidAt\";s:24:\"2018-09-26T15:14:02.000Z\";s:9:\"createdAt\";s:24:\"2018-09-26T15:13:41.000Z\";s:16:\"transaction_date\";s:24:\"2018-09-26T15:13:41.000Z\";s:11:\"plan_object\";O:8:\"stdClass\":0:{}s:10:\"subaccount\";O:8:\"stdClass\":0:{}}'),
(62, 14, 'a73122f4f891dd3476d2', 'a73122f4f891dd3476d2', '1015', 'NGN', 'completed', '2018-09-26 21:05:26', 'recharge', '2018-09-26 16:35:26', 'O:8:\"stdClass\":24:{s:2:\"id\";i:53545349;s:6:\"domain\";s:4:\"live\";s:6:\"status\";s:7:\"success\";s:9:\"reference\";s:20:\"a73122f4f891dd3476d2\";s:6:\"amount\";i:101500;s:7:\"message\";N;s:16:\"gateway_response\";s:33:\"Approved by Financial Institution\";s:7:\"paid_at\";s:24:\"2018-09-26T16:35:24.000Z\";s:10:\"created_at\";s:24:\"2018-09-26T16:34:42.000Z\";s:7:\"channel\";s:4:\"card\";s:8:\"currency\";s:3:\"NGN\";s:10:\"ip_address\";s:31:\"148.66.132.242, 162.158.166.251\";s:8:\"metadata\";O:8:\"stdClass\":1:{s:12:\"site_details\";O:8:\"stdClass\":2:{s:10:\"first_name\";s:12:\"Chinedu Ofor\";s:7:\"user_id\";s:2:\"14\";}}s:3:\"log\";N;s:4:\"fees\";i:1523;s:10:\"fees_split\";N;s:13:\"authorization\";O:8:\"stdClass\":12:{s:18:\"authorization_code\";s:15:\"AUTH_xe416c1ipo\";s:3:\"bin\";s:6:\"533477\";s:5:\"last4\";s:4:\"4164\";s:9:\"exp_month\";s:2:\"01\";s:8:\"exp_year\";s:4:\"2022\";s:7:\"channel\";s:4:\"card\";s:9:\"card_type\";s:16:\"mastercard DEBIT\";s:4:\"bank\";s:13:\"Sterling Bank\";s:12:\"country_code\";s:2:\"NG\";s:5:\"brand\";s:10:\"mastercard\";s:8:\"reusable\";b:1;s:9:\"signature\";s:24:\"SIG_vbIMVAbPxsaZWofTCAi7\";}s:8:\"customer\";O:8:\"stdClass\":8:{s:2:\"id\";i:3312671;s:10:\"first_name\";N;s:9:\"last_name\";N;s:5:\"email\";s:28:\"oforchinedukelechi@gmail.com\";s:13:\"customer_code\";s:19:\"CUS_p2rje851dz43epx\";s:5:\"phone\";N;s:8:\"metadata\";N;s:11:\"risk_action\";s:7:\"default\";}s:4:\"plan\";N;s:6:\"paidAt\";s:24:\"2018-09-26T16:35:24.000Z\";s:9:\"createdAt\";s:24:\"2018-09-26T16:34:42.000Z\";s:16:\"transaction_date\";s:24:\"2018-09-26T16:34:42.000Z\";s:11:\"plan_object\";O:8:\"stdClass\":0:{}s:10:\"subaccount\";O:8:\"stdClass\":0:{}}'),
(63, 1, '000000', '000000', '250', 'NGN', 'completed', '2018-09-27 08:51:13', 'ride_pay', '2018-09-27 08:51:13', 'done'),
(64, 1, '000000', '000000', '250', 'NGN', 'completed', '2018-09-27 08:56:53', 'ride_pay', '2018-09-27 08:56:53', 'done'),
(65, 11, '000000', '000000', '2725.85', 'NGN', 'completed', '2018-09-27 14:14:34', 'ride_pay', '2018-09-27 14:14:34', 'done'),
(66, 11, '000000', '000000', '2920.8', 'NGN', 'completed', '2018-09-27 17:53:35', 'ride_pay', '2018-09-27 17:53:35', 'done'),
(67, 11, '000000', '000000', '2920.8', 'NGN', 'completed', '2018-09-27 17:53:36', 'ride_pay', '2018-09-27 17:53:36', 'done'),
(68, 4, '000000', '000000', '475.1', 'NGN', 'completed', '2018-09-27 18:00:03', 'ride_pay', '2018-09-27 18:00:03', 'done'),
(69, 4, '000000', '000000', '475.1', 'NGN', 'completed', '2018-09-27 18:00:04', 'ride_pay', '2018-09-27 18:00:04', 'done'),
(70, 14, '000000', '000000', '100.0', 'NGN', 'completed', '2018-09-27 19:23:16', 'ride_pay', '2018-09-27 19:23:16', 'done'),
(71, 14, '6a4ab955f653160cae88', 'ohaz66l0i6if93v', '1000000', '', 'started', '2018-09-28 14:40:02', 'recharge', '2018-09-28 10:10:02', 'created'),
(72, 14, '7a0d5e2eca4941b304df', '3oelzdz3tnffv4z', '100000', '', 'started', '2018-09-28 14:40:25', 'recharge', '2018-09-28 10:10:25', 'created'),
(73, 14, '250ba35afec924b5c561', 'd4ftaph5y5fdvu8', '10000', '', 'started', '2018-09-28 14:41:15', 'recharge', '2018-09-28 10:11:15', 'created'),
(74, 14, '7df7d8e45206313e5300', 'do0o76w3eogta6g', '1000', '', 'started', '2018-09-28 14:41:27', 'recharge', '2018-09-28 10:11:27', 'created'),
(75, 14, '000000', '000000', '331.25', 'NGN', 'completed', '2018-09-28 11:59:30', 'ride_pay', '2018-09-28 11:59:30', 'done'),
(76, 4, '000000', '000000', '2870.8', 'NGN', 'completed', '2018-09-28 12:19:38', 'ride_pay', '2018-09-28 12:19:38', 'done'),
(77, 4, '000000', '000000', '2870.8', 'NGN', 'completed', '2018-09-28 12:30:41', 'ride_pay', '2018-09-28 12:30:41', 'done'),
(78, 4, '000000', '000000', '421.75', 'NGN', 'completed', '2018-09-28 13:48:25', 'ride_pay', '2018-09-28 13:48:25', 'done'),
(79, 4, '000000', '000000', '421.75', 'NGN', 'completed', '2018-09-28 13:51:42', 'ride_pay', '2018-09-28 13:51:42', 'done'),
(80, 4, '000000', '000000', '421.75', 'NGN', 'completed', '2018-09-28 13:51:43', 'ride_pay', '2018-09-28 13:51:43', 'done'),
(81, 4, '000000', '000000', '421.75', 'NGN', 'completed', '2018-09-28 13:53:26', 'ride_pay', '2018-09-28 13:53:26', 'done'),
(82, 14, 'e1a44b3a529ef14f529e', 'drw688m74n2zmm7', '10000', '', 'started', '2018-09-28 19:31:08', 'recharge', '2018-09-28 19:31:08', 'created'),
(83, 14, '48fbbc964ff2b525ffac', '52xsjgli1u19tv1', '10000', '', 'started', '2018-09-28 19:31:30', 'recharge', '2018-09-28 19:31:30', 'created'),
(84, 14, '86fc4b3f22b2abe9933f', 'aa85zlbp5ya915o', '10000', '', 'started', '2018-09-28 19:31:57', 'recharge', '2018-09-28 19:31:57', 'created'),
(85, 11, '000000', '000000', '2870.8', 'NGN', 'completed', '2018-10-01 04:42:20', 'ride_pay', '2018-10-01 04:42:20', 'done'),
(86, 4, '000000', '000000', '2870.8', 'NGN', 'completed', '2018-10-01 05:34:04', 'ride_pay', '2018-10-01 05:34:04', 'done'),
(87, 63, '000000', '000000', '283.1', 'NGN', 'completed', '2018-10-03 11:30:40', 'ride_pay', '2018-10-03 11:30:40', 'done'),
(88, 4, '000000', '000000', '421.75', 'NGN', 'completed', '2018-10-03 13:17:42', 'ride_pay', '2018-10-03 13:17:42', 'done'),
(89, 14, '136cb5ce6526038dbf0f', 'q5y5s21p4cwomms', '10000', '', 'started', '2018-10-05 09:26:03', 'recharge', '2018-10-05 09:26:03', 'created'),
(90, 73, 'f141369337a55c5138e7', 'l3ms7etgnupogt7', '1000', '', 'started', '2018-10-09 17:12:55', 'recharge', '2018-10-09 17:12:55', 'created'),
(91, 75, 'deec48c7f76c938ece46', 'rn551jl0b73y9td', '4000', '', 'started', '2018-10-12 19:52:25', 'recharge', '2018-10-12 19:52:25', 'created'),
(92, 69, '7e7c6dd7ed9ebe848af5', 'zc60rfudracd5th', '5000', '', 'started', '2018-10-13 10:37:14', 'recharge', '2018-10-13 10:37:14', 'created'),
(93, 69, '602bd08367ecbfa6255e', 'kdy8jxae9vf39sv', '5000', '', 'started', '2018-10-13 10:37:22', 'recharge', '2018-10-13 10:37:22', 'created'),
(94, 69, '596e37b8aa5fc5d9be8d', 'cfjvifmzcgiw10h', '5000', '', 'started', '2018-10-13 10:37:26', 'recharge', '2018-10-13 10:37:26', 'created'),
(95, 69, '3a93c05da36ba8bdb011', 'm749yf8o8mzyoj6', '5000', '', 'started', '2018-10-13 10:38:03', 'recharge', '2018-10-13 10:38:03', 'created'),
(96, 69, 'e8439aac6660bf1a1064', 'eb0cibiit8lyvqz', '5000', '', 'started', '2018-10-13 10:38:18', 'recharge', '2018-10-13 10:38:18', 'created'),
(97, 69, '173e5a5fb715239df0d0', '54s7jv30w3t3kzf', '5000', '', 'started', '2018-10-13 10:38:21', 'recharge', '2018-10-13 10:38:21', 'created'),
(98, 118, 'e825ce28a18213935ea0', '78a1mnp78gmhgz8', '3000', '', 'started', '2018-12-14 11:17:22', 'recharge', '2018-12-14 11:17:22', 'created'),
(99, 159, 'dac34bfa52e215388977', 'x17ytbq2vj6xhua', '20000', '', 'started', '2019-01-11 00:41:51', 'recharge', '2019-01-10 16:41:51', 'created'),
(100, 159, 'a9bcb1c5c5b05e387bff', 'x293f85d3dh9x86', '20000', '', 'started', '2019-01-11 00:50:06', 'recharge', '2019-01-10 16:50:06', 'created'),
(101, 159, '73279220b812b6871ca9', '8gi9oagcdv3oovd', '20000', '', 'started', '2019-01-11 00:50:59', 'recharge', '2019-01-10 16:50:59', 'created'),
(102, 159, 'bec028d0063617df5809', '1ukb2omi663r109', '2000', '', 'started', '2019-01-11 16:44:29', 'recharge', '2019-01-11 08:44:29', 'created'),
(103, 159, '1085207b59c285aa6910', '2sxztlwjvhtruey', '2000', '', 'started', '2019-01-11 16:44:42', 'recharge', '2019-01-11 08:44:42', 'created'),
(104, 159, '8804302b0bd37f76a089', '8804302b0bd37f76a089', '2030', 'NGN', 'completed', '2019-01-11 16:54:41', 'recharge', '2019-01-11 08:54:41', 'O:8:\"stdClass\":24:{s:2:\"id\";i:94574089;s:6:\"domain\";s:4:\"test\";s:6:\"status\";s:7:\"success\";s:9:\"reference\";s:20:\"8804302b0bd37f76a089\";s:6:\"amount\";i:203000;s:7:\"message\";N;s:16:\"gateway_response\";s:8:\"Approved\";s:7:\"paid_at\";s:24:\"2019-01-11T08:54:40.000Z\";s:10:\"created_at\";s:24:\"2019-01-11T08:54:39.000Z\";s:7:\"channel\";s:4:\"card\";s:8:\"currency\";s:3:\"NGN\";s:10:\"ip_address\";s:28:\"160.153.155.25, 172.69.54.37\";s:8:\"metadata\";O:8:\"stdClass\":1:{s:12:\"site_details\";O:8:\"stdClass\":2:{s:10:\"first_name\";s:17:\"Manuel Chris Ogar\";s:7:\"user_id\";s:3:\"159\";}}s:3:\"log\";N;s:4:\"fees\";i:3045;s:10:\"fees_split\";N;s:13:\"authorization\";O:8:\"stdClass\":12:{s:18:\"authorization_code\";s:15:\"AUTH_w5bzitk020\";s:3:\"bin\";s:6:\"408408\";s:5:\"last4\";s:4:\"4081\";s:9:\"exp_month\";s:2:\"01\";s:8:\"exp_year\";s:4:\"2023\";s:7:\"channel\";s:4:\"card\";s:9:\"card_type\";s:5:\"visa \";s:4:\"bank\";s:9:\"TEST BANK\";s:12:\"country_code\";s:2:\"NG\";s:5:\"brand\";s:4:\"visa\";s:8:\"reusable\";b:1;s:9:\"signature\";s:24:\"SIG_sfZqgxfCl9t64UePH9EB\";}s:8:\"customer\";O:8:\"stdClass\":8:{s:2:\"id\";i:5989648;s:10:\"first_name\";N;s:9:\"last_name\";N;s:5:\"email\";s:18:\"mcogar18@gmail.com\";s:13:\"customer_code\";s:19:\"CUS_ghapxrc70cuette\";s:5:\"phone\";N;s:8:\"metadata\";N;s:11:\"risk_action\";s:7:\"default\";}s:4:\"plan\";N;s:6:\"paidAt\";s:24:\"2019-01-11T08:54:40.000Z\";s:9:\"createdAt\";s:24:\"2019-01-11T08:54:39.000Z\";s:16:\"transaction_date\";s:24:\"2019-01-11T08:54:39.000Z\";s:11:\"plan_object\";O:8:\"stdClass\":0:{}s:10:\"subaccount\";O:8:\"stdClass\":0:{}}'),
(105, 49, '00_252', '000000', '0', 'NGN', 'completed', '2019-01-25 21:59:21', 'driver_pay', '2019-01-25 21:59:21', 'done'),
(106, 1, '00_252', '000000', '0', 'NGN', 'completed', '2019-01-25 21:59:21', 'school_pay', '2019-01-25 21:59:21', 'done'),
(107, 159, '00_252', '000000', '241.2', 'NGN', 'completed', '2019-01-25 21:59:21', 'ride_pay', '2019-01-25 21:59:21', 'done'),
(108, 49, '00_264', '000000', '30', 'NGN', 'completed', '2019-02-09 21:16:20', 'driver_pay', '2019-02-09 21:16:20', 'done'),
(109, 2, '00_264', '000000', '40', 'NGN', 'completed', '2019-02-09 21:16:20', 'school_pay', '2019-02-09 21:16:20', 'done'),
(110, 2, '00_264', '000000', '100.0', 'NGN', 'completed', '2019-02-09 21:16:20', 'ride_pay', '2019-02-09 21:16:20', 'done'),
(111, 49, '00_268', '000000', '56.16', 'NGN', 'completed', '2019-02-09 23:35:44', 'driver_pay', '2019-02-09 23:35:44', 'done'),
(112, 2, '00_268', '000000', '74.88', 'NGN', 'completed', '2019-02-09 23:35:44', 'school_pay', '2019-02-09 23:35:44', 'done'),
(113, 2, '00_268', '000000', '187.2', 'NGN', 'completed', '2019-02-09 23:35:44', 'ride_pay', '2019-02-09 23:35:44', 'done'),
(114, 145, '253818397', '253818397', '4', 'NGN', 'completed', '2019-02-14 19:10:06', 'external_recharge', '2019-02-14 11:10:06', 'O:8:\"stdClass\":24:{s:2:\"id\";i:112726813;s:6:\"domain\";s:4:\"test\";s:6:\"status\";s:7:\"success\";s:9:\"reference\";s:9:\"253818397\";s:6:\"amount\";i:400;s:7:\"message\";N;s:16:\"gateway_response\";s:10:\"Successful\";s:7:\"paid_at\";s:24:\"2019-02-14T11:10:02.000Z\";s:10:\"created_at\";s:24:\"2019-02-14T11:09:53.000Z\";s:7:\"channel\";s:4:\"card\";s:8:\"currency\";s:3:\"NGN\";s:10:\"ip_address\";s:13:\"105.112.41.91\";s:8:\"metadata\";O:8:\"stdClass\":2:{s:12:\"site_details\";O:8:\"stdClass\":2:{s:10:\"first_name\";s:13:\"Israel Alagbe\";s:7:\"user_id\";i:145;}s:8:\"referrer\";s:26:\"http://themoovapp.com/pay/\";}s:3:\"log\";O:8:\"stdClass\":8:{s:10:\"start_time\";i:1550142588;s:10:\"time_spent\";i:9;s:8:\"attempts\";i:1;s:6:\"errors\";i:0;s:7:\"success\";b:0;s:6:\"mobile\";b:0;s:5:\"input\";a:0:{}s:7:\"history\";a:1:{i:0;O:8:\"stdClass\":3:{s:4:\"type\";s:6:\"action\";s:7:\"message\";s:26:\"Attempted to pay with card\";s:4:\"time\";i:9;}}}s:4:\"fees\";i:6;s:10:\"fees_split\";N;s:13:\"authorization\";O:8:\"stdClass\":12:{s:18:\"authorization_code\";s:15:\"AUTH_qjwk14tegk\";s:3:\"bin\";s:6:\"408408\";s:5:\"last4\";s:4:\"4081\";s:9:\"exp_month\";s:2:\"12\";s:8:\"exp_year\";s:4:\"2020\";s:7:\"channel\";s:4:\"card\";s:9:\"card_type\";s:10:\"visa DEBIT\";s:4:\"bank\";s:9:\"Test Bank\";s:12:\"country_code\";s:2:\"NG\";s:5:\"brand\";s:4:\"visa\";s:8:\"reusable\";b:1;s:9:\"signature\";s:24:\"SIG_OoLvEygcel8sj8T6JgNz\";}s:8:\"customer\";O:8:\"stdClass\":8:{s:2:\"id\";i:6103169;s:10:\"first_name\";s:6:\"Israel\";s:9:\"last_name\";s:6:\"Alagbe\";s:5:\"email\";s:24:\"israelalagbe53@gmail.com\";s:13:\"customer_code\";s:19:\"CUS_a0iq212ta2lsjak\";s:5:\"phone\";s:0:\"\";s:8:\"metadata\";N;s:11:\"risk_action\";s:7:\"default\";}s:4:\"plan\";N;s:6:\"paidAt\";s:24:\"2019-02-14T11:10:02.000Z\";s:9:\"createdAt\";s:24:\"2019-02-14T11:09:53.000Z\";s:16:\"transaction_date\";s:24:\"2019-02-14T11:09:53.000Z\";s:11:\"plan_object\";O:8:\"stdClass\":0:{}s:10:\"subaccount\";O:8:\"stdClass\":0:{}}'),
(115, 145, '642386180', '642386180', '4', 'NGN', 'completed', '2019-02-14 19:10:23', 'external_recharge', '2019-02-14 11:10:23', 'O:8:\"stdClass\":24:{s:2:\"id\";i:112726960;s:6:\"domain\";s:4:\"test\";s:6:\"status\";s:7:\"success\";s:9:\"reference\";s:9:\"642386180\";s:6:\"amount\";i:400;s:7:\"message\";N;s:16:\"gateway_response\";s:10:\"Successful\";s:7:\"paid_at\";s:24:\"2019-02-14T11:10:20.000Z\";s:10:\"created_at\";s:24:\"2019-02-14T11:10:14.000Z\";s:7:\"channel\";s:4:\"card\";s:8:\"currency\";s:3:\"NGN\";s:10:\"ip_address\";s:13:\"105.112.41.91\";s:8:\"metadata\";O:8:\"stdClass\":2:{s:12:\"site_details\";O:8:\"stdClass\":2:{s:10:\"first_name\";s:13:\"Israel Alagbe\";s:7:\"user_id\";i:145;}s:8:\"referrer\";s:26:\"http://themoovapp.com/pay/\";}s:3:\"log\";O:8:\"stdClass\":8:{s:10:\"start_time\";i:1550142610;s:10:\"time_spent\";i:6;s:8:\"attempts\";i:1;s:6:\"errors\";i:0;s:7:\"success\";b:1;s:6:\"mobile\";b:0;s:5:\"input\";a:0:{}s:7:\"history\";a:2:{i:0;O:8:\"stdClass\":3:{s:4:\"type\";s:6:\"action\";s:7:\"message\";s:26:\"Attempted to pay with card\";s:4:\"time\";i:5;}i:1;O:8:\"stdClass\":3:{s:4:\"type\";s:7:\"success\";s:7:\"message\";s:27:\"Successfully paid with card\";s:4:\"time\";i:6;}}}s:4:\"fees\";i:6;s:10:\"fees_split\";N;s:13:\"authorization\";O:8:\"stdClass\":12:{s:18:\"authorization_code\";s:15:\"AUTH_gy2y6zyxoy\";s:3:\"bin\";s:6:\"408408\";s:5:\"last4\";s:4:\"4081\";s:9:\"exp_month\";s:2:\"12\";s:8:\"exp_year\";s:4:\"2020\";s:7:\"channel\";s:4:\"card\";s:9:\"card_type\";s:10:\"visa DEBIT\";s:4:\"bank\";s:9:\"Test Bank\";s:12:\"country_code\";s:2:\"NG\";s:5:\"brand\";s:4:\"visa\";s:8:\"reusable\";b:1;s:9:\"signature\";s:24:\"SIG_OoLvEygcel8sj8T6JgNz\";}s:8:\"customer\";O:8:\"stdClass\":8:{s:2:\"id\";i:6103169;s:10:\"first_name\";s:6:\"Israel\";s:9:\"last_name\";s:6:\"Alagbe\";s:5:\"email\";s:24:\"israelalagbe53@gmail.com\";s:13:\"customer_code\";s:19:\"CUS_a0iq212ta2lsjak\";s:5:\"phone\";s:0:\"\";s:8:\"metadata\";N;s:11:\"risk_action\";s:7:\"default\";}s:4:\"plan\";N;s:6:\"paidAt\";s:24:\"2019-02-14T11:10:20.000Z\";s:9:\"createdAt\";s:24:\"2019-02-14T11:10:14.000Z\";s:16:\"transaction_date\";s:24:\"2019-02-14T11:10:14.000Z\";s:11:\"plan_object\";O:8:\"stdClass\":0:{}s:10:\"subaccount\";O:8:\"stdClass\":0:{}}'),
(116, 159, '650612426', '650612426', '5000', 'NGN', 'completed', '2019-02-14 19:12:13', 'external_recharge', '2019-02-14 11:12:13', 'O:8:\"stdClass\":24:{s:2:\"id\";i:112727593;s:6:\"domain\";s:4:\"test\";s:6:\"status\";s:7:\"success\";s:9:\"reference\";s:9:\"650612426\";s:6:\"amount\";i:500000;s:7:\"message\";N;s:16:\"gateway_response\";s:10:\"Successful\";s:7:\"paid_at\";s:24:\"2019-02-14T11:12:10.000Z\";s:10:\"created_at\";s:24:\"2019-02-14T11:12:04.000Z\";s:7:\"channel\";s:4:\"card\";s:8:\"currency\";s:3:\"NGN\";s:10:\"ip_address\";s:13:\"105.112.41.91\";s:8:\"metadata\";O:8:\"stdClass\":2:{s:12:\"site_details\";O:8:\"stdClass\":2:{s:10:\"first_name\";s:17:\"Manuel Chris Ogar\";s:7:\"user_id\";i:159;}s:8:\"referrer\";s:26:\"http://themoovapp.com/pay/\";}s:3:\"log\";O:8:\"stdClass\":8:{s:10:\"start_time\";i:1550142719;s:10:\"time_spent\";i:6;s:8:\"attempts\";i:1;s:6:\"errors\";i:0;s:7:\"success\";b:1;s:6:\"mobile\";b:0;s:5:\"input\";a:0:{}s:7:\"history\";a:2:{i:0;O:8:\"stdClass\":3:{s:4:\"type\";s:6:\"action\";s:7:\"message\";s:26:\"Attempted to pay with card\";s:4:\"time\";i:6;}i:1;O:8:\"stdClass\":3:{s:4:\"type\";s:7:\"success\";s:7:\"message\";s:27:\"Successfully paid with card\";s:4:\"time\";i:6;}}}s:4:\"fees\";i:17500;s:10:\"fees_split\";N;s:13:\"authorization\";O:8:\"stdClass\":12:{s:18:\"authorization_code\";s:15:\"AUTH_sungfi5cg8\";s:3:\"bin\";s:6:\"408408\";s:5:\"last4\";s:4:\"4081\";s:9:\"exp_month\";s:2:\"12\";s:8:\"exp_year\";s:4:\"2020\";s:7:\"channel\";s:4:\"card\";s:9:\"card_type\";s:10:\"visa DEBIT\";s:4:\"bank\";s:9:\"Test Bank\";s:12:\"country_code\";s:2:\"NG\";s:5:\"brand\";s:4:\"visa\";s:8:\"reusable\";b:1;s:9:\"signature\";s:24:\"SIG_OoLvEygcel8sj8T6JgNz\";}s:8:\"customer\";O:8:\"stdClass\":8:{s:2:\"id\";i:5979937;s:10:\"first_name\";N;s:9:\"last_name\";N;s:5:\"email\";s:18:\"mcogar18@gmail.com\";s:13:\"customer_code\";s:19:\"CUS_g0zq1q2q1dz7inr\";s:5:\"phone\";N;s:8:\"metadata\";N;s:11:\"risk_action\";s:7:\"default\";}s:4:\"plan\";N;s:6:\"paidAt\";s:24:\"2019-02-14T11:12:10.000Z\";s:9:\"createdAt\";s:24:\"2019-02-14T11:12:04.000Z\";s:16:\"transaction_date\";s:24:\"2019-02-14T11:12:04.000Z\";s:11:\"plan_object\";O:8:\"stdClass\":0:{}s:10:\"subaccount\";O:8:\"stdClass\":0:{}}'),
(117, 159, '82883035', '', '5000', '', 'started', '2019-02-14 19:16:44', 'external_recharge', '2019-02-14 11:16:44', 'created'),
(118, 145, '270986060', '270986060', '5000', 'NGN', 'completed', '2019-02-14 19:33:08', 'external_recharge', '2019-02-14 11:33:08', 'O:8:\"stdClass\":24:{s:2:\"id\";i:112735076;s:6:\"domain\";s:4:\"test\";s:6:\"status\";s:7:\"success\";s:9:\"reference\";s:9:\"270986060\";s:6:\"amount\";i:500000;s:7:\"message\";N;s:16:\"gateway_response\";s:10:\"Successful\";s:7:\"paid_at\";s:24:\"2019-02-14T11:33:05.000Z\";s:10:\"created_at\";s:24:\"2019-02-14T11:32:59.000Z\";s:7:\"channel\";s:4:\"card\";s:8:\"currency\";s:3:\"NGN\";s:10:\"ip_address\";s:13:\"105.112.41.91\";s:8:\"metadata\";O:8:\"stdClass\":2:{s:12:\"site_details\";O:8:\"stdClass\":2:{s:10:\"first_name\";s:13:\"Israel Alagbe\";s:7:\"user_id\";i:145;}s:8:\"referrer\";s:26:\"http://themoovapp.com/pay/\";}s:3:\"log\";O:8:\"stdClass\":8:{s:10:\"start_time\";i:1550143974;s:10:\"time_spent\";i:6;s:8:\"attempts\";i:1;s:6:\"errors\";i:0;s:7:\"success\";b:1;s:6:\"mobile\";b:0;s:5:\"input\";a:0:{}s:7:\"history\";a:2:{i:0;O:8:\"stdClass\":3:{s:4:\"type\";s:6:\"action\";s:7:\"message\";s:26:\"Attempted to pay with card\";s:4:\"time\";i:6;}i:1;O:8:\"stdClass\":3:{s:4:\"type\";s:7:\"success\";s:7:\"message\";s:27:\"Successfully paid with card\";s:4:\"time\";i:6;}}}s:4:\"fees\";i:17500;s:10:\"fees_split\";N;s:13:\"authorization\";O:8:\"stdClass\":12:{s:18:\"authorization_code\";s:15:\"AUTH_kwnonw4qdl\";s:3:\"bin\";s:6:\"408408\";s:5:\"last4\";s:4:\"4081\";s:9:\"exp_month\";s:2:\"12\";s:8:\"exp_year\";s:4:\"2020\";s:7:\"channel\";s:4:\"card\";s:9:\"card_type\";s:10:\"visa DEBIT\";s:4:\"bank\";s:9:\"Test Bank\";s:12:\"country_code\";s:2:\"NG\";s:5:\"brand\";s:4:\"visa\";s:8:\"reusable\";b:1;s:9:\"signature\";s:24:\"SIG_OoLvEygcel8sj8T6JgNz\";}s:8:\"customer\";O:8:\"stdClass\":8:{s:2:\"id\";i:6103169;s:10:\"first_name\";s:6:\"Israel\";s:9:\"last_name\";s:6:\"Alagbe\";s:5:\"email\";s:24:\"israelalagbe53@gmail.com\";s:13:\"customer_code\";s:19:\"CUS_a0iq212ta2lsjak\";s:5:\"phone\";s:0:\"\";s:8:\"metadata\";N;s:11:\"risk_action\";s:7:\"default\";}s:4:\"plan\";N;s:6:\"paidAt\";s:24:\"2019-02-14T11:33:05.000Z\";s:9:\"createdAt\";s:24:\"2019-02-14T11:32:59.000Z\";s:16:\"transaction_date\";s:24:\"2019-02-14T11:32:59.000Z\";s:11:\"plan_object\";O:8:\"stdClass\":0:{}s:10:\"subaccount\";O:8:\"stdClass\":0:{}}'),
(119, 14, '827029222', '827029222', '500', 'NGN', 'completed', '2019-02-15 03:04:29', 'external_recharge', '2019-02-14 19:04:29', 'O:8:\"stdClass\":24:{s:2:\"id\";i:112961434;s:6:\"domain\";s:4:\"test\";s:6:\"status\";s:7:\"success\";s:9:\"reference\";s:9:\"827029222\";s:6:\"amount\";i:50000;s:7:\"message\";N;s:16:\"gateway_response\";s:10:\"Successful\";s:7:\"paid_at\";s:24:\"2019-02-14T19:04:27.000Z\";s:10:\"created_at\";s:24:\"2019-02-14T19:03:17.000Z\";s:7:\"channel\";s:4:\"card\";s:8:\"currency\";s:3:\"NGN\";s:10:\"ip_address\";s:14:\"154.118.21.102\";s:8:\"metadata\";O:8:\"stdClass\":2:{s:12:\"site_details\";O:8:\"stdClass\":2:{s:10:\"first_name\";s:12:\"Chinedu Ofor\";s:7:\"user_id\";i:14;}s:8:\"referrer\";s:26:\"http://themoovapp.com/pay/\";}s:3:\"log\";O:8:\"stdClass\":9:{s:10:\"start_time\";i:1550170997;s:10:\"time_spent\";i:70;s:8:\"attempts\";i:2;s:14:\"authentication\";s:3:\"pin\";s:6:\"errors\";i:0;s:7:\"success\";b:1;s:6:\"mobile\";b:0;s:5:\"input\";a:0:{}s:7:\"history\";a:8:{i:0;O:8:\"stdClass\":3:{s:4:\"type\";s:5:\"input\";s:7:\"message\";s:30:\"Filled this field: card number\";s:4:\"time\";i:37;}i:1;O:8:\"stdClass\":3:{s:4:\"type\";s:5:\"input\";s:7:\"message\";s:31:\"Changed this field: card number\";s:4:\"time\";i:50;}i:2;O:8:\"stdClass\":3:{s:4:\"type\";s:5:\"input\";s:7:\"message\";s:30:\"Filled this field: card expiry\";s:4:\"time\";i:55;}i:3;O:8:\"stdClass\":3:{s:4:\"type\";s:5:\"input\";s:7:\"message\";s:27:\"Filled this field: card cvv\";s:4:\"time\";i:63;}i:4;O:8:\"stdClass\":3:{s:4:\"type\";s:6:\"action\";s:7:\"message\";s:26:\"Attempted to pay with card\";s:4:\"time\";i:63;}i:5;O:8:\"stdClass\":3:{s:4:\"type\";s:4:\"auth\";s:7:\"message\";s:28:\"Authentication Required: pin\";s:4:\"time\";i:64;}i:6;O:8:\"stdClass\":3:{s:4:\"type\";s:6:\"action\";s:7:\"message\";s:26:\"Attempted to pay with card\";s:4:\"time\";i:70;}i:7;O:8:\"stdClass\":3:{s:4:\"type\";s:7:\"success\";s:7:\"message\";s:27:\"Successfully paid with card\";s:4:\"time\";i:70;}}}s:4:\"fees\";i:750;s:10:\"fees_split\";N;s:13:\"authorization\";O:8:\"stdClass\":12:{s:18:\"authorization_code\";s:15:\"AUTH_zo5eq47ksv\";s:3:\"bin\";s:6:\"507850\";s:5:\"last4\";s:4:\"7812\";s:9:\"exp_month\";s:2:\"01\";s:8:\"exp_year\";s:4:\"2023\";s:7:\"channel\";s:4:\"card\";s:9:\"card_type\";s:6:\"verve \";s:4:\"bank\";s:0:\"\";s:12:\"country_code\";s:0:\"\";s:5:\"brand\";s:5:\"verve\";s:8:\"reusable\";b:1;s:9:\"signature\";s:24:\"SIG_fW5NYsbZRgFLlCpSSGyz\";}s:8:\"customer\";O:8:\"stdClass\":8:{s:2:\"id\";i:1514863;s:10:\"first_name\";N;s:9:\"last_name\";N;s:5:\"email\";s:28:\"oforchinedukelechi@gmail.com\";s:13:\"customer_code\";s:19:\"CUS_p7fopnro5tqpmnz\";s:5:\"phone\";N;s:8:\"metadata\";N;s:11:\"risk_action\";s:7:\"default\";}s:4:\"plan\";N;s:6:\"paidAt\";s:24:\"2019-02-14T19:04:27.000Z\";s:9:\"createdAt\";s:24:\"2019-02-14T19:03:17.000Z\";s:16:\"transaction_date\";s:24:\"2019-02-14T19:03:17.000Z\";s:11:\"plan_object\";O:8:\"stdClass\":0:{}s:10:\"subaccount\";O:8:\"stdClass\":0:{}}'),
(120, 145, '171721247', '171721247', '1000', 'NGN', 'completed', '2019-02-15 03:31:39', 'external_recharge', '2019-02-14 19:31:39', 'O:8:\"stdClass\":24:{s:2:\"id\";i:113006800;s:6:\"domain\";s:4:\"test\";s:6:\"status\";s:7:\"success\";s:9:\"reference\";s:9:\"171721247\";s:6:\"amount\";i:100000;s:7:\"message\";N;s:16:\"gateway_response\";s:10:\"Successful\";s:7:\"paid_at\";s:24:\"2019-02-14T19:31:36.000Z\";s:10:\"created_at\";s:24:\"2019-02-14T19:31:22.000Z\";s:7:\"channel\";s:4:\"card\";s:8:\"currency\";s:3:\"NGN\";s:10:\"ip_address\";s:13:\"105.112.41.91\";s:8:\"metadata\";O:8:\"stdClass\":2:{s:12:\"site_details\";O:8:\"stdClass\":2:{s:10:\"first_name\";s:13:\"Israel Alagbe\";s:7:\"user_id\";i:145;}s:8:\"referrer\";s:26:\"http://themoovapp.com/pay/\";}s:3:\"log\";O:8:\"stdClass\":8:{s:10:\"start_time\";i:1550172682;s:10:\"time_spent\";i:14;s:8:\"attempts\";i:1;s:6:\"errors\";i:0;s:7:\"success\";b:1;s:6:\"mobile\";b:1;s:5:\"input\";a:0:{}s:7:\"history\";a:3:{i:0;O:8:\"stdClass\":3:{s:4:\"type\";s:6:\"action\";s:7:\"message\";s:27:\"Set payment method to: card\";s:4:\"time\";i:5;}i:1;O:8:\"stdClass\":3:{s:4:\"type\";s:6:\"action\";s:7:\"message\";s:26:\"Attempted to pay with card\";s:4:\"time\";i:13;}i:2;O:8:\"stdClass\":3:{s:4:\"type\";s:7:\"success\";s:7:\"message\";s:27:\"Successfully paid with card\";s:4:\"time\";i:14;}}}s:4:\"fees\";i:1500;s:10:\"fees_split\";N;s:13:\"authorization\";O:8:\"stdClass\":12:{s:18:\"authorization_code\";s:15:\"AUTH_z4umwj0u8u\";s:3:\"bin\";s:6:\"408408\";s:5:\"last4\";s:4:\"4081\";s:9:\"exp_month\";s:2:\"12\";s:8:\"exp_year\";s:4:\"2020\";s:7:\"channel\";s:4:\"card\";s:9:\"card_type\";s:10:\"visa DEBIT\";s:4:\"bank\";s:9:\"Test Bank\";s:12:\"country_code\";s:2:\"NG\";s:5:\"brand\";s:4:\"visa\";s:8:\"reusable\";b:1;s:9:\"signature\";s:24:\"SIG_OoLvEygcel8sj8T6JgNz\";}s:8:\"customer\";O:8:\"stdClass\":8:{s:2:\"id\";i:6103169;s:10:\"first_name\";s:6:\"Israel\";s:9:\"last_name\";s:6:\"Alagbe\";s:5:\"email\";s:24:\"israelalagbe53@gmail.com\";s:13:\"customer_code\";s:19:\"CUS_a0iq212ta2lsjak\";s:5:\"phone\";s:0:\"\";s:8:\"metadata\";N;s:11:\"risk_action\";s:7:\"default\";}s:4:\"plan\";N;s:6:\"paidAt\";s:24:\"2019-02-14T19:31:36.000Z\";s:9:\"createdAt\";s:24:\"2019-02-14T19:31:22.000Z\";s:16:\"transaction_date\";s:24:\"2019-02-14T19:31:22.000Z\";s:11:\"plan_object\";O:8:\"stdClass\":0:{}s:10:\"subaccount\";O:8:\"stdClass\":0:{}}'),
(121, 2, '433092724', '', '1000', '', 'started', '2019-02-15 06:01:54', 'external_recharge', '2019-02-14 22:01:54', 'created'),
(122, 2, '257953983', '257953983', '1000', 'NGN', 'completed', '2019-02-15 06:07:39', 'external_recharge', '2019-02-14 22:07:39', 'O:8:\"stdClass\":24:{s:2:\"id\";i:113127901;s:6:\"domain\";s:4:\"test\";s:6:\"status\";s:7:\"success\";s:9:\"reference\";s:9:\"257953983\";s:6:\"amount\";i:100000;s:7:\"message\";s:11:\"madePayment\";s:16:\"gateway_response\";s:18:\"Payment successful\";s:7:\"paid_at\";s:24:\"2019-02-14T22:07:36.000Z\";s:10:\"created_at\";s:24:\"2019-02-14T22:05:27.000Z\";s:7:\"channel\";N;s:8:\"currency\";s:3:\"NGN\";s:10:\"ip_address\";s:13:\"105.112.37.38\";s:8:\"metadata\";O:8:\"stdClass\":2:{s:12:\"site_details\";O:8:\"stdClass\":2:{s:10:\"first_name\";s:16:\"Adedipo Adekanbi\";s:7:\"user_id\";i:2;}s:8:\"referrer\";s:26:\"http://themoovapp.com/pay/\";}s:3:\"log\";O:8:\"stdClass\":8:{s:10:\"start_time\";i:1550181928;s:10:\"time_spent\";i:130;s:8:\"attempts\";i:0;s:6:\"errors\";i:0;s:7:\"success\";b:1;s:6:\"mobile\";b:0;s:5:\"input\";a:0:{}s:7:\"history\";a:6:{i:0;O:8:\"stdClass\":3:{s:4:\"type\";s:6:\"action\";s:7:\"message\";s:27:\"Set payment method to: bank\";s:4:\"time\";i:3;}i:1;O:8:\"stdClass\":3:{s:4:\"type\";s:6:\"action\";s:7:\"message\";s:27:\"Set payment method to: ussd\";s:4:\"time\";i:35;}i:2;O:8:\"stdClass\":3:{s:4:\"type\";s:6:\"action\";s:7:\"message\";s:27:\"Set payment method to: bank\";s:4:\"time\";i:84;}i:3;O:8:\"stdClass\":3:{s:4:\"type\";s:6:\"action\";s:7:\"message\";s:27:\"Set payment method to: ussd\";s:4:\"time\";i:102;}i:4;O:8:\"stdClass\":3:{s:4:\"type\";s:7:\"success\";s:7:\"message\";s:26:\"Successfully paid with 737\";s:4:\"time\";i:130;}i:5;O:8:\"stdClass\":3:{s:4:\"type\";s:7:\"success\";s:7:\"message\";s:26:\"Successfully paid with 737\";s:4:\"time\";i:130;}}}s:4:\"fees\";i:1500;s:10:\"fees_split\";N;s:13:\"authorization\";O:8:\"stdClass\":12:{s:18:\"authorization_code\";s:20:\"AUTH_54o1t2mudvkmm4y\";s:3:\"bin\";s:6:\"XXXXXX\";s:5:\"last4\";s:4:\"XXXX\";s:9:\"exp_month\";s:2:\"01\";s:8:\"exp_year\";s:4:\"2019\";s:7:\"channel\";s:4:\"card\";s:9:\"card_type\";s:7:\"offline\";s:4:\"bank\";s:19:\"Guaranty Trust Bank\";s:12:\"country_code\";s:2:\"NG\";s:5:\"brand\";s:7:\"offline\";s:8:\"reusable\";b:0;s:9:\"signature\";N;}s:8:\"customer\";O:8:\"stdClass\":8:{s:2:\"id\";i:1958916;s:10:\"first_name\";N;s:9:\"last_name\";N;s:5:\"email\";s:25:\"adekanbiadedipo@gmail.com\";s:13:\"customer_code\";s:19:\"CUS_ornwgw4427yg8pf\";s:5:\"phone\";N;s:8:\"metadata\";N;s:11:\"risk_action\";s:7:\"default\";}s:4:\"plan\";N;s:6:\"paidAt\";s:24:\"2019-02-14T22:07:36.000Z\";s:9:\"createdAt\";s:24:\"2019-02-14T22:05:27.000Z\";s:16:\"transaction_date\";s:24:\"2019-02-14T22:05:27.000Z\";s:11:\"plan_object\";O:8:\"stdClass\":0:{}s:10:\"subaccount\";O:8:\"stdClass\":0:{}}'),
(123, 14, '336888938', '', '1000000', '', 'started', '2019-02-15 06:05:43', 'external_recharge', '2019-02-14 22:05:43', 'created'),
(124, 2, '623791200', '623791200', '1000', 'NGN', 'completed', '2019-02-15 06:09:46', 'external_recharge', '2019-02-14 22:09:46', 'O:8:\"stdClass\":24:{s:2:\"id\";i:113128366;s:6:\"domain\";s:4:\"test\";s:6:\"status\";s:7:\"success\";s:9:\"reference\";s:9:\"623791200\";s:6:\"amount\";i:100000;s:7:\"message\";N;s:16:\"gateway_response\";s:10:\"Successful\";s:7:\"paid_at\";s:24:\"2019-02-14T22:09:43.000Z\";s:10:\"created_at\";s:24:\"2019-02-14T22:08:29.000Z\";s:7:\"channel\";s:4:\"card\";s:8:\"currency\";s:3:\"NGN\";s:10:\"ip_address\";s:13:\"105.112.37.38\";s:8:\"metadata\";O:8:\"stdClass\":2:{s:12:\"site_details\";O:8:\"stdClass\":2:{s:10:\"first_name\";s:16:\"Adedipo Adekanbi\";s:7:\"user_id\";i:2;}s:8:\"referrer\";s:26:\"http://themoovapp.com/pay/\";}s:3:\"log\";O:8:\"stdClass\":8:{s:10:\"start_time\";i:1550182110;s:10:\"time_spent\";i:75;s:8:\"attempts\";i:1;s:6:\"errors\";i:0;s:7:\"success\";b:1;s:6:\"mobile\";b:0;s:5:\"input\";a:0:{}s:7:\"history\";a:3:{i:0;O:8:\"stdClass\":3:{s:4:\"type\";s:6:\"action\";s:7:\"message\";s:27:\"Set payment method to: card\";s:4:\"time\";i:49;}i:1;O:8:\"stdClass\":3:{s:4:\"type\";s:6:\"action\";s:7:\"message\";s:26:\"Attempted to pay with card\";s:4:\"time\";i:72;}i:2;O:8:\"stdClass\":3:{s:4:\"type\";s:7:\"success\";s:7:\"message\";s:27:\"Successfully paid with card\";s:4:\"time\";i:75;}}}s:4:\"fees\";i:1500;s:10:\"fees_split\";N;s:13:\"authorization\";O:8:\"stdClass\":12:{s:18:\"authorization_code\";s:15:\"AUTH_0smd93ew2s\";s:3:\"bin\";s:6:\"408408\";s:5:\"last4\";s:4:\"4081\";s:9:\"exp_month\";s:2:\"12\";s:8:\"exp_year\";s:4:\"2020\";s:7:\"channel\";s:4:\"card\";s:9:\"card_type\";s:10:\"visa DEBIT\";s:4:\"bank\";s:9:\"Test Bank\";s:12:\"country_code\";s:2:\"NG\";s:5:\"brand\";s:4:\"visa\";s:8:\"reusable\";b:1;s:9:\"signature\";s:24:\"SIG_OoLvEygcel8sj8T6JgNz\";}s:8:\"customer\";O:8:\"stdClass\":8:{s:2:\"id\";i:1958916;s:10:\"first_name\";N;s:9:\"last_name\";N;s:5:\"email\";s:25:\"adekanbiadedipo@gmail.com\";s:13:\"customer_code\";s:19:\"CUS_ornwgw4427yg8pf\";s:5:\"phone\";N;s:8:\"metadata\";N;s:11:\"risk_action\";s:7:\"default\";}s:4:\"plan\";N;s:6:\"paidAt\";s:24:\"2019-02-14T22:09:43.000Z\";s:9:\"createdAt\";s:24:\"2019-02-14T22:08:29.000Z\";s:16:\"transaction_date\";s:24:\"2019-02-14T22:08:29.000Z\";s:11:\"plan_object\";O:8:\"stdClass\":0:{}s:10:\"subaccount\";O:8:\"stdClass\":0:{}}'),
(125, 14, '625196448', '', '100', '', 'started', '2019-02-15 06:09:00', 'external_recharge', '2019-02-14 22:09:00', 'created'),
(126, 2, '66145049', '', '1000', '', 'started', '2019-02-15 06:10:22', 'external_recharge', '2019-02-14 22:10:22', 'created'),
(127, 2, '744313932', '744313932', '1000', 'NGN', 'completed', '2019-02-15 06:15:17', 'external_recharge', '2019-02-14 22:15:17', 'O:8:\"stdClass\":24:{s:2:\"id\";i:113129242;s:6:\"domain\";s:4:\"test\";s:6:\"status\";s:7:\"success\";s:9:\"reference\";s:9:\"744313932\";s:6:\"amount\";i:100000;s:7:\"message\";s:11:\"madePayment\";s:16:\"gateway_response\";s:18:\"Payment successful\";s:7:\"paid_at\";s:24:\"2019-02-14T22:15:12.000Z\";s:10:\"created_at\";s:24:\"2019-02-14T22:14:08.000Z\";s:7:\"channel\";N;s:8:\"currency\";s:3:\"NGN\";s:10:\"ip_address\";s:13:\"105.112.37.38\";s:8:\"metadata\";O:8:\"stdClass\":2:{s:12:\"site_details\";O:8:\"stdClass\":2:{s:10:\"first_name\";s:16:\"Adedipo Adekanbi\";s:7:\"user_id\";i:2;}s:8:\"referrer\";s:26:\"http://themoovapp.com/pay/\";}s:3:\"log\";O:8:\"stdClass\":8:{s:10:\"start_time\";i:1550182450;s:10:\"time_spent\";i:64;s:8:\"attempts\";i:0;s:6:\"errors\";i:0;s:7:\"success\";b:1;s:6:\"mobile\";b:0;s:5:\"input\";a:0:{}s:7:\"history\";a:2:{i:0;O:8:\"stdClass\":3:{s:4:\"type\";s:6:\"action\";s:7:\"message\";s:27:\"Set payment method to: ussd\";s:4:\"time\";i:3;}i:1;O:8:\"stdClass\":3:{s:4:\"type\";s:7:\"success\";s:7:\"message\";s:26:\"Successfully paid with 737\";s:4:\"time\";i:64;}}}s:4:\"fees\";i:1500;s:10:\"fees_split\";N;s:13:\"authorization\";O:8:\"stdClass\":12:{s:18:\"authorization_code\";s:20:\"AUTH_hl8gy4ovmzphbtx\";s:3:\"bin\";s:6:\"XXXXXX\";s:5:\"last4\";s:4:\"XXXX\";s:9:\"exp_month\";s:2:\"01\";s:8:\"exp_year\";s:4:\"2019\";s:7:\"channel\";s:4:\"card\";s:9:\"card_type\";s:7:\"offline\";s:4:\"bank\";s:19:\"Guaranty Trust Bank\";s:12:\"country_code\";s:2:\"NG\";s:5:\"brand\";s:7:\"offline\";s:8:\"reusable\";b:0;s:9:\"signature\";N;}s:8:\"customer\";O:8:\"stdClass\":8:{s:2:\"id\";i:1958916;s:10:\"first_name\";N;s:9:\"last_name\";N;s:5:\"email\";s:25:\"adekanbiadedipo@gmail.com\";s:13:\"customer_code\";s:19:\"CUS_ornwgw4427yg8pf\";s:5:\"phone\";N;s:8:\"metadata\";N;s:11:\"risk_action\";s:7:\"default\";}s:4:\"plan\";N;s:6:\"paidAt\";s:24:\"2019-02-14T22:15:12.000Z\";s:9:\"createdAt\";s:24:\"2019-02-14T22:14:08.000Z\";s:16:\"transaction_date\";s:24:\"2019-02-14T22:14:08.000Z\";s:11:\"plan_object\";O:8:\"stdClass\":0:{}s:10:\"subaccount\";O:8:\"stdClass\":0:{}}'),
(128, 145, '744211882', '744211882', '1000', 'NGN', 'completed', '2019-02-15 17:24:10', 'external_recharge', '2019-02-15 09:24:10', 'O:8:\"stdClass\":24:{s:2:\"id\";i:113260670;s:6:\"domain\";s:4:\"test\";s:6:\"status\";s:7:\"success\";s:9:\"reference\";s:9:\"744211882\";s:6:\"amount\";i:100000;s:7:\"message\";N;s:16:\"gateway_response\";s:10:\"Successful\";s:7:\"paid_at\";s:24:\"2019-02-15T09:24:06.000Z\";s:10:\"created_at\";s:24:\"2019-02-15T09:23:50.000Z\";s:7:\"channel\";s:4:\"card\";s:8:\"currency\";s:3:\"NGN\";s:10:\"ip_address\";s:13:\"105.112.41.41\";s:8:\"metadata\";O:8:\"stdClass\":2:{s:12:\"site_details\";O:8:\"stdClass\":2:{s:10:\"first_name\";s:13:\"Israel Alagbe\";s:7:\"user_id\";i:145;}s:8:\"referrer\";s:26:\"http://themoovapp.com/pay/\";}s:3:\"log\";O:8:\"stdClass\":8:{s:10:\"start_time\";i:1550222630;s:10:\"time_spent\";i:15;s:8:\"attempts\";i:1;s:6:\"errors\";i:0;s:7:\"success\";b:1;s:6:\"mobile\";b:1;s:5:\"input\";a:0:{}s:7:\"history\";a:3:{i:0;O:8:\"stdClass\":3:{s:4:\"type\";s:6:\"action\";s:7:\"message\";s:27:\"Set payment method to: card\";s:4:\"time\";i:4;}i:1;O:8:\"stdClass\":3:{s:4:\"type\";s:6:\"action\";s:7:\"message\";s:26:\"Attempted to pay with card\";s:4:\"time\";i:14;}i:2;O:8:\"stdClass\":3:{s:4:\"type\";s:7:\"success\";s:7:\"message\";s:27:\"Successfully paid with card\";s:4:\"time\";i:15;}}}s:4:\"fees\";i:1500;s:10:\"fees_split\";N;s:13:\"authorization\";O:8:\"stdClass\":12:{s:18:\"authorization_code\";s:15:\"AUTH_z5814dcmyq\";s:3:\"bin\";s:6:\"408408\";s:5:\"last4\";s:4:\"4081\";s:9:\"exp_month\";s:2:\"12\";s:8:\"exp_year\";s:4:\"2020\";s:7:\"channel\";s:4:\"card\";s:9:\"card_type\";s:10:\"visa DEBIT\";s:4:\"bank\";s:9:\"Test Bank\";s:12:\"country_code\";s:2:\"NG\";s:5:\"brand\";s:4:\"visa\";s:8:\"reusable\";b:1;s:9:\"signature\";s:24:\"SIG_OoLvEygcel8sj8T6JgNz\";}s:8:\"customer\";O:8:\"stdClass\":8:{s:2:\"id\";i:6103169;s:10:\"first_name\";s:6:\"Israel\";s:9:\"last_name\";s:6:\"Alagbe\";s:5:\"email\";s:24:\"israelalagbe53@gmail.com\";s:13:\"customer_code\";s:19:\"CUS_a0iq212ta2lsjak\";s:5:\"phone\";s:0:\"\";s:8:\"metadata\";N;s:11:\"risk_action\";s:7:\"default\";}s:4:\"plan\";N;s:6:\"paidAt\";s:24:\"2019-02-15T09:24:06.000Z\";s:9:\"createdAt\";s:24:\"2019-02-15T09:23:50.000Z\";s:16:\"transaction_date\";s:24:\"2019-02-15T09:23:50.000Z\";s:11:\"plan_object\";O:8:\"stdClass\":0:{}s:10:\"subaccount\";O:8:\"stdClass\":0:{}}');
INSERT INTO `transactions` (`t_id`, `t_user_id`, `t_reference`, `t_access_code`, `t_amount`, `t_currency`, `t_status`, `t_started`, `t_type`, `t_date`, `t_response`) VALUES
(129, 76, '127948229', '127948229', '5000', 'NGN', 'completed', '2019-02-15 18:31:57', 'external_recharge', '2019-02-15 10:31:57', 'O:8:\"stdClass\":24:{s:2:\"id\";i:113297219;s:6:\"domain\";s:4:\"test\";s:6:\"status\";s:7:\"success\";s:9:\"reference\";s:9:\"127948229\";s:6:\"amount\";i:500000;s:7:\"message\";s:11:\"madePayment\";s:16:\"gateway_response\";s:8:\"Approved\";s:7:\"paid_at\";s:24:\"2019-02-15T10:31:55.000Z\";s:10:\"created_at\";s:24:\"2019-02-15T10:31:11.000Z\";s:7:\"channel\";s:4:\"bank\";s:8:\"currency\";s:3:\"NGN\";s:10:\"ip_address\";s:13:\"185.176.76.25\";s:8:\"metadata\";O:8:\"stdClass\":2:{s:12:\"site_details\";O:8:\"stdClass\":2:{s:10:\"first_name\";s:5:\"Dbanj\";s:7:\"user_id\";i:76;}s:8:\"referrer\";s:26:\"http://themoovapp.com/pay/\";}s:3:\"log\";O:8:\"stdClass\":9:{s:10:\"start_time\";i:1550226672;s:10:\"time_spent\";i:43;s:8:\"attempts\";i:1;s:14:\"authentication\";s:13:\"payment_token\";s:6:\"errors\";i:0;s:7:\"success\";b:1;s:6:\"mobile\";b:1;s:5:\"input\";a:0:{}s:7:\"history\";a:7:{i:0;O:8:\"stdClass\":3:{s:4:\"type\";s:6:\"action\";s:7:\"message\";s:27:\"Set payment method to: bank\";s:4:\"time\";i:5;}i:1;O:8:\"stdClass\":3:{s:4:\"type\";s:5:\"input\";s:7:\"message\";s:33:\"Filled this field: account number\";s:4:\"time\";i:11;}i:2;O:8:\"stdClass\":3:{s:4:\"type\";s:6:\"action\";s:7:\"message\";s:34:\"Attempted to pay with bank account\";s:4:\"time\";i:11;}i:3;O:8:\"stdClass\":3:{s:4:\"type\";s:4:\"auth\";s:7:\"message\";s:33:\"Authentication Required: birthday\";s:4:\"time\";i:13;}i:4;O:8:\"stdClass\":3:{s:4:\"type\";s:4:\"auth\";s:7:\"message\";s:43:\"Authentication Required: registration_token\";s:4:\"time\";i:24;}i:5;O:8:\"stdClass\":3:{s:4:\"type\";s:4:\"auth\";s:7:\"message\";s:38:\"Authentication Required: payment_token\";s:4:\"time\";i:29;}i:6;O:8:\"stdClass\":3:{s:4:\"type\";s:7:\"success\";s:7:\"message\";s:35:\"Successfully paid with bank account\";s:4:\"time\";i:43;}}}s:4:\"fees\";i:17500;s:10:\"fees_split\";N;s:13:\"authorization\";O:8:\"stdClass\":12:{s:18:\"authorization_code\";s:15:\"AUTH_tjveiqkli1\";s:3:\"bin\";s:6:\"000XXX\";s:5:\"last4\";s:4:\"X000\";s:9:\"exp_month\";s:2:\"12\";s:8:\"exp_year\";s:4:\"9999\";s:7:\"channel\";s:4:\"bank\";s:9:\"card_type\";s:0:\"\";s:4:\"bank\";s:11:\"Zenith Bank\";s:12:\"country_code\";s:2:\"NG\";s:5:\"brand\";s:15:\"Zenith Emandate\";s:8:\"reusable\";b:0;s:9:\"signature\";N;}s:8:\"customer\";O:8:\"stdClass\":8:{s:2:\"id\";i:6682934;s:10:\"first_name\";s:0:\"\";s:9:\"last_name\";s:0:\"\";s:5:\"email\";s:20:\"evbogbai08@gmail.com\";s:13:\"customer_code\";s:19:\"CUS_znh1b014i8eo567\";s:5:\"phone\";s:0:\"\";s:8:\"metadata\";N;s:11:\"risk_action\";s:7:\"default\";}s:4:\"plan\";N;s:6:\"paidAt\";s:24:\"2019-02-15T10:31:55.000Z\";s:9:\"createdAt\";s:24:\"2019-02-15T10:31:11.000Z\";s:16:\"transaction_date\";s:24:\"2019-02-15T10:31:11.000Z\";s:11:\"plan_object\";O:8:\"stdClass\":0:{}s:10:\"subaccount\";O:8:\"stdClass\":0:{}}'),
(130, 9, '365546017', '', '10000', '', 'started', '2019-02-15 19:06:41', 'external_recharge', '2019-02-15 11:06:41', 'created'),
(131, 9, '576119227', '', '10000', '', 'started', '2019-02-15 19:06:41', 'external_recharge', '2019-02-15 11:06:41', 'created'),
(132, 95, '764245247', '', '1000', '', 'started', '2019-02-15 19:20:25', 'external_recharge', '2019-02-15 11:20:25', 'created'),
(133, 145, '336426086', '', '1000', '', 'started', '2019-02-15 19:23:08', 'external_recharge', '2019-02-15 11:23:08', 'created'),
(134, 14, '180854346', '', '6000000', '', 'started', '2019-02-16 07:17:12', 'external_recharge', '2019-02-15 23:17:12', 'created'),
(135, 14, '359575998', '', '6000', '', 'started', '2019-02-16 16:49:58', 'external_recharge', '2019-02-16 08:49:58', 'created'),
(136, 2, '834665451', '', '1000', '', 'started', '2019-02-18 22:36:37', 'external_recharge', '2019-02-18 14:36:37', 'created'),
(137, 2, '284746647', '284746647', '2000', 'NGN', 'completed', '2019-02-19 04:58:48', 'external_recharge', '2019-02-18 20:58:48', 'O:8:\"stdClass\":24:{s:2:\"id\";i:115470240;s:6:\"domain\";s:4:\"test\";s:6:\"status\";s:7:\"success\";s:9:\"reference\";s:9:\"284746647\";s:6:\"amount\";i:200000;s:7:\"message\";s:11:\"madePayment\";s:16:\"gateway_response\";s:18:\"Payment successful\";s:7:\"paid_at\";s:24:\"2019-02-18T20:58:46.000Z\";s:10:\"created_at\";s:24:\"2019-02-18T20:56:36.000Z\";s:7:\"channel\";N;s:8:\"currency\";s:3:\"NGN\";s:10:\"ip_address\";s:14:\"105.112.39.117\";s:8:\"metadata\";O:8:\"stdClass\":2:{s:12:\"site_details\";O:8:\"stdClass\":2:{s:10:\"first_name\";s:16:\"Adedipo Adekanbi\";s:7:\"user_id\";i:2;}s:8:\"referrer\";s:26:\"http://themoovapp.com/pay/\";}s:3:\"log\";O:8:\"stdClass\":8:{s:10:\"start_time\";i:1550523402;s:10:\"time_spent\";i:130;s:8:\"attempts\";i:0;s:6:\"errors\";i:0;s:7:\"success\";b:1;s:6:\"mobile\";b:0;s:5:\"input\";a:0:{}s:7:\"history\";a:2:{i:0;O:8:\"stdClass\":3:{s:4:\"type\";s:6:\"action\";s:7:\"message\";s:27:\"Set payment method to: ussd\";s:4:\"time\";i:85;}i:1;O:8:\"stdClass\":3:{s:4:\"type\";s:7:\"success\";s:7:\"message\";s:26:\"Successfully paid with 737\";s:4:\"time\";i:130;}}}s:4:\"fees\";i:3000;s:10:\"fees_split\";N;s:13:\"authorization\";O:8:\"stdClass\":12:{s:18:\"authorization_code\";s:20:\"AUTH_477p0s0dnokfccx\";s:3:\"bin\";s:6:\"XXXXXX\";s:5:\"last4\";s:4:\"XXXX\";s:9:\"exp_month\";s:2:\"01\";s:8:\"exp_year\";s:4:\"2019\";s:7:\"channel\";s:4:\"card\";s:9:\"card_type\";s:7:\"offline\";s:4:\"bank\";s:19:\"Guaranty Trust Bank\";s:12:\"country_code\";s:2:\"NG\";s:5:\"brand\";s:7:\"offline\";s:8:\"reusable\";b:0;s:9:\"signature\";N;}s:8:\"customer\";O:8:\"stdClass\":8:{s:2:\"id\";i:1958916;s:10:\"first_name\";N;s:9:\"last_name\";N;s:5:\"email\";s:25:\"adekanbiadedipo@gmail.com\";s:13:\"customer_code\";s:19:\"CUS_ornwgw4427yg8pf\";s:5:\"phone\";N;s:8:\"metadata\";N;s:11:\"risk_action\";s:7:\"default\";}s:4:\"plan\";N;s:6:\"paidAt\";s:24:\"2019-02-18T20:58:46.000Z\";s:9:\"createdAt\";s:24:\"2019-02-18T20:56:36.000Z\";s:16:\"transaction_date\";s:24:\"2019-02-18T20:56:36.000Z\";s:11:\"plan_object\";O:8:\"stdClass\":0:{}s:10:\"subaccount\";O:8:\"stdClass\":0:{}}'),
(138, 49, '00_269', '000000', '0', 'NGN', 'completed', '2019-02-19 08:56:26', 'driver_pay', '2019-02-19 08:56:26', 'done'),
(139, 1, '00_269', '000000', '0', 'NGN', 'completed', '2019-02-19 08:56:26', 'school_pay', '2019-02-19 08:56:26', 'done'),
(140, 159, '00_269', '000000', '200.0', 'NGN', 'completed', '2019-02-19 08:56:26', 'ride_pay', '2019-02-19 08:56:26', 'done'),
(141, 49, '00_269', '000000', '0', 'NGN', 'completed', '2019-02-19 08:58:11', 'driver_pay', '2019-02-19 08:58:11', 'done'),
(142, 1, '00_269', '000000', '0', 'NGN', 'completed', '2019-02-19 08:58:11', 'school_pay', '2019-02-19 08:58:11', 'done'),
(143, 159, '00_269', '000000', '200.0', 'NGN', 'completed', '2019-02-19 08:58:11', 'ride_pay', '2019-02-19 08:58:11', 'done'),
(144, 49, '00_269', '000000', '0', 'NGN', 'completed', '2019-02-19 08:58:17', 'driver_pay', '2019-02-19 08:58:17', 'done'),
(145, 1, '00_269', '000000', '0', 'NGN', 'completed', '2019-02-19 08:58:17', 'school_pay', '2019-02-19 08:58:17', 'done'),
(146, 159, '00_269', '000000', '200.0', 'NGN', 'completed', '2019-02-19 08:58:17', 'ride_pay', '2019-02-19 08:58:17', 'done'),
(147, 12, '793183745', '793183745', '3000', 'NGN', 'completed', '2019-02-20 22:35:26', 'external_recharge', '2019-02-20 14:35:26', 'O:8:\"stdClass\":24:{s:2:\"id\";i:116439531;s:6:\"domain\";s:4:\"test\";s:6:\"status\";s:7:\"success\";s:9:\"reference\";s:9:\"793183745\";s:6:\"amount\";i:300000;s:7:\"message\";N;s:16:\"gateway_response\";s:10:\"Successful\";s:7:\"paid_at\";s:24:\"2019-02-20T14:35:24.000Z\";s:10:\"created_at\";s:24:\"2019-02-20T14:35:12.000Z\";s:7:\"channel\";s:4:\"card\";s:8:\"currency\";s:3:\"NGN\";s:10:\"ip_address\";s:12:\"41.58.89.230\";s:8:\"metadata\";O:8:\"stdClass\":2:{s:12:\"site_details\";O:8:\"stdClass\":2:{s:10:\"first_name\";s:14:\"Seun Owonikoko\";s:7:\"user_id\";i:12;}s:8:\"referrer\";s:26:\"http://themoovapp.com/pay/\";}s:3:\"log\";O:8:\"stdClass\":8:{s:10:\"start_time\";i:1550673313;s:10:\"time_spent\";i:12;s:8:\"attempts\";i:1;s:6:\"errors\";i:0;s:7:\"success\";b:1;s:6:\"mobile\";b:0;s:5:\"input\";a:0:{}s:7:\"history\";a:2:{i:0;O:8:\"stdClass\":3:{s:4:\"type\";s:6:\"action\";s:7:\"message\";s:26:\"Attempted to pay with card\";s:4:\"time\";i:10;}i:1;O:8:\"stdClass\":3:{s:4:\"type\";s:7:\"success\";s:7:\"message\";s:27:\"Successfully paid with card\";s:4:\"time\";i:12;}}}s:4:\"fees\";i:14500;s:10:\"fees_split\";N;s:13:\"authorization\";O:8:\"stdClass\":12:{s:18:\"authorization_code\";s:15:\"AUTH_mw037shoh2\";s:3:\"bin\";s:6:\"408408\";s:5:\"last4\";s:4:\"4081\";s:9:\"exp_month\";s:2:\"12\";s:8:\"exp_year\";s:4:\"2020\";s:7:\"channel\";s:4:\"card\";s:9:\"card_type\";s:10:\"visa DEBIT\";s:4:\"bank\";s:9:\"Test Bank\";s:12:\"country_code\";s:2:\"NG\";s:5:\"brand\";s:4:\"visa\";s:8:\"reusable\";b:1;s:9:\"signature\";s:24:\"SIG_OoLvEygcel8sj8T6JgNz\";}s:8:\"customer\";O:8:\"stdClass\":8:{s:2:\"id\";i:6793309;s:10:\"first_name\";s:0:\"\";s:9:\"last_name\";s:0:\"\";s:5:\"email\";s:23:\"seunowonikoko@gmail.com\";s:13:\"customer_code\";s:19:\"CUS_re3ev4e5cjw64jt\";s:5:\"phone\";s:0:\"\";s:8:\"metadata\";N;s:11:\"risk_action\";s:7:\"default\";}s:4:\"plan\";N;s:6:\"paidAt\";s:24:\"2019-02-20T14:35:24.000Z\";s:9:\"createdAt\";s:24:\"2019-02-20T14:35:12.000Z\";s:16:\"transaction_date\";s:24:\"2019-02-20T14:35:12.000Z\";s:11:\"plan_object\";O:8:\"stdClass\":0:{}s:10:\"subaccount\";O:8:\"stdClass\":0:{}}'),
(148, 49, '00_273', '000000', '96.405', 'NGN', 'completed', '2019-02-20 23:25:02', 'driver_pay', '2019-02-20 23:25:02', 'done'),
(149, 1, '00_273', '000000', '128.54000000000002', 'NGN', 'completed', '2019-02-20 23:25:02', 'school_pay', '2019-02-20 23:25:02', 'done'),
(150, 159, '00_273', '000000', '321.35', 'NGN', 'completed', '2019-02-20 23:25:02', 'ride_pay', '2019-02-20 23:25:02', 'done'),
(151, 49, '00_273', '000000', '96.405', 'NGN', 'completed', '2019-02-20 23:25:10', 'driver_pay', '2019-02-20 23:25:10', 'done'),
(152, 1, '00_273', '000000', '128.54000000000002', 'NGN', 'completed', '2019-02-20 23:25:10', 'school_pay', '2019-02-20 23:25:10', 'done'),
(153, 159, '00_273', '000000', '321.35', 'NGN', 'completed', '2019-02-20 23:25:10', 'ride_pay', '2019-02-20 23:25:10', 'done'),
(154, 49, '00_273', '000000', '96.405', 'NGN', 'completed', '2019-02-20 23:27:19', 'driver_pay', '2019-02-20 23:27:19', 'done'),
(155, 1, '00_273', '000000', '128.54000000000002', 'NGN', 'completed', '2019-02-20 23:27:19', 'school_pay', '2019-02-20 23:27:19', 'done'),
(156, 159, '00_273', '000000', '321.35', 'NGN', 'completed', '2019-02-20 23:27:19', 'ride_pay', '2019-02-20 23:27:19', 'done'),
(157, 49, '00_273', '000000', '96.405', 'NGN', 'completed', '2019-02-20 23:27:22', 'driver_pay', '2019-02-20 23:27:22', 'done'),
(158, 1, '00_273', '000000', '128.54000000000002', 'NGN', 'completed', '2019-02-20 23:27:22', 'school_pay', '2019-02-20 23:27:22', 'done'),
(159, 159, '00_273', '000000', '321.35', 'NGN', 'completed', '2019-02-20 23:27:22', 'ride_pay', '2019-02-20 23:27:22', 'done'),
(160, 49, '00_273', '000000', '96.405', 'NGN', 'completed', '2019-02-20 23:27:26', 'driver_pay', '2019-02-20 23:27:26', 'done'),
(161, 1, '00_273', '000000', '128.54000000000002', 'NGN', 'completed', '2019-02-20 23:27:26', 'school_pay', '2019-02-20 23:27:26', 'done'),
(162, 159, '00_273', '000000', '321.35', 'NGN', 'completed', '2019-02-20 23:27:26', 'ride_pay', '2019-02-20 23:27:26', 'done'),
(163, 49, '00_285', '000000', '80.00999999999999', 'NGN', 'completed', '2019-02-21 20:37:55', 'driver_pay', '2019-02-21 20:37:55', 'done'),
(164, 2, '00_285', '000000', '106.68', 'NGN', 'completed', '2019-02-21 20:37:55', 'school_pay', '2019-02-21 20:37:55', 'done'),
(165, 12, '00_285', '000000', '266.7', 'NGN', 'completed', '2019-02-21 20:37:55', 'ride_pay', '2019-02-21 20:37:55', 'done'),
(166, 49, '00_286', '000000', '80.00999999999999', 'NGN', 'completed', '2019-02-21 21:03:08', 'driver_pay', '2019-02-21 21:03:08', 'done'),
(167, 2, '00_286', '000000', '106.68', 'NGN', 'completed', '2019-02-21 21:03:08', 'school_pay', '2019-02-21 21:03:08', 'done'),
(168, 12, '00_286', '000000', '266.7', 'NGN', 'completed', '2019-02-21 21:03:08', 'ride_pay', '2019-02-21 21:03:08', 'done'),
(169, 76, '157446427', '157446427', '3000', 'NGN', 'completed', '2019-02-22 05:28:11', 'external_recharge', '2019-02-21 21:28:11', 'O:8:\"stdClass\":24:{s:2:\"id\";i:117339961;s:6:\"domain\";s:4:\"test\";s:6:\"status\";s:7:\"success\";s:9:\"reference\";s:9:\"157446427\";s:6:\"amount\";i:300000;s:7:\"message\";N;s:16:\"gateway_response\";s:10:\"Successful\";s:7:\"paid_at\";s:24:\"2019-02-21T21:28:08.000Z\";s:10:\"created_at\";s:24:\"2019-02-21T21:27:42.000Z\";s:7:\"channel\";s:4:\"card\";s:8:\"currency\";s:3:\"NGN\";s:10:\"ip_address\";s:12:\"154.66.53.94\";s:8:\"metadata\";O:8:\"stdClass\":2:{s:12:\"site_details\";O:8:\"stdClass\":2:{s:10:\"first_name\";s:5:\"Dbanj\";s:7:\"user_id\";i:76;}s:8:\"referrer\";s:26:\"http://themoovapp.com/pay/\";}s:3:\"log\";O:8:\"stdClass\":8:{s:10:\"start_time\";i:1550784462;s:10:\"time_spent\";i:27;s:8:\"attempts\";i:1;s:6:\"errors\";i:0;s:7:\"success\";b:1;s:6:\"mobile\";b:1;s:5:\"input\";a:0:{}s:7:\"history\";a:3:{i:0;O:8:\"stdClass\":3:{s:4:\"type\";s:6:\"action\";s:7:\"message\";s:27:\"Set payment method to: card\";s:4:\"time\";i:6;}i:1;O:8:\"stdClass\":3:{s:4:\"type\";s:6:\"action\";s:7:\"message\";s:26:\"Attempted to pay with card\";s:4:\"time\";i:26;}i:2;O:8:\"stdClass\":3:{s:4:\"type\";s:7:\"success\";s:7:\"message\";s:27:\"Successfully paid with card\";s:4:\"time\";i:27;}}}s:4:\"fees\";i:14500;s:10:\"fees_split\";N;s:13:\"authorization\";O:8:\"stdClass\":12:{s:18:\"authorization_code\";s:15:\"AUTH_rhm3b3wd4b\";s:3:\"bin\";s:6:\"408408\";s:5:\"last4\";s:4:\"4081\";s:9:\"exp_month\";s:2:\"12\";s:8:\"exp_year\";s:4:\"2020\";s:7:\"channel\";s:4:\"card\";s:9:\"card_type\";s:10:\"visa DEBIT\";s:4:\"bank\";s:9:\"Test Bank\";s:12:\"country_code\";s:2:\"NG\";s:5:\"brand\";s:4:\"visa\";s:8:\"reusable\";b:1;s:9:\"signature\";s:24:\"SIG_OoLvEygcel8sj8T6JgNz\";}s:8:\"customer\";O:8:\"stdClass\":8:{s:2:\"id\";i:6682934;s:10:\"first_name\";s:0:\"\";s:9:\"last_name\";s:0:\"\";s:5:\"email\";s:20:\"evbogbai08@gmail.com\";s:13:\"customer_code\";s:19:\"CUS_znh1b014i8eo567\";s:5:\"phone\";s:0:\"\";s:8:\"metadata\";N;s:11:\"risk_action\";s:7:\"default\";}s:4:\"plan\";N;s:6:\"paidAt\";s:24:\"2019-02-21T21:28:08.000Z\";s:9:\"createdAt\";s:24:\"2019-02-21T21:27:42.000Z\";s:16:\"transaction_date\";s:24:\"2019-02-21T21:27:42.000Z\";s:11:\"plan_object\";O:8:\"stdClass\":0:{}s:10:\"subaccount\";O:8:\"stdClass\":0:{}}'),
(170, 49, '00_287', '000000', '62.98499999999999', 'NGN', 'completed', '2019-02-22 23:47:26', 'driver_pay', '2019-02-22 23:47:26', 'done'),
(171, 1, '00_287', '000000', '83.98', 'NGN', 'completed', '2019-02-22 23:47:26', 'school_pay', '2019-02-22 23:47:26', 'done'),
(172, 159, '00_287', '000000', '209.95', 'NGN', 'completed', '2019-02-22 23:47:26', 'ride_pay', '2019-02-22 23:47:26', 'done'),
(173, 95, '732822826', '', '1000', '', 'started', '2019-02-23 20:36:28', 'external_recharge', '2019-02-23 12:36:28', 'created'),
(174, 201, '3f5f16ccb6ef12b8dd37', '3f5f16ccb6ef12b8dd37', '1015', 'NGN', 'completed', '2019-02-28 21:30:57', 'recharge', '2019-02-28 13:30:57', 'O:8:\"stdClass\":24:{s:2:\"id\";i:121381272;s:6:\"domain\";s:4:\"test\";s:6:\"status\";s:7:\"success\";s:9:\"reference\";s:20:\"3f5f16ccb6ef12b8dd37\";s:6:\"amount\";i:101500;s:7:\"message\";N;s:16:\"gateway_response\";s:8:\"Approved\";s:7:\"paid_at\";s:24:\"2019-02-28T13:30:56.000Z\";s:10:\"created_at\";s:24:\"2019-02-28T13:30:55.000Z\";s:7:\"channel\";s:4:\"card\";s:8:\"currency\";s:3:\"NGN\";s:10:\"ip_address\";s:29:\"160.153.155.25, 172.69.54.115\";s:8:\"metadata\";O:8:\"stdClass\":1:{s:12:\"site_details\";O:8:\"stdClass\":2:{s:10:\"first_name\";s:5:\"First\";s:7:\"user_id\";s:3:\"201\";}}s:3:\"log\";N;s:4:\"fees\";i:1523;s:10:\"fees_split\";N;s:13:\"authorization\";O:8:\"stdClass\":12:{s:18:\"authorization_code\";s:15:\"AUTH_hzidsawk5h\";s:3:\"bin\";s:6:\"408408\";s:5:\"last4\";s:4:\"4081\";s:9:\"exp_month\";s:2:\"03\";s:8:\"exp_year\";s:4:\"2020\";s:7:\"channel\";s:4:\"card\";s:9:\"card_type\";s:5:\"visa \";s:4:\"bank\";s:9:\"TEST BANK\";s:12:\"country_code\";s:2:\"NG\";s:5:\"brand\";s:4:\"visa\";s:8:\"reusable\";b:1;s:9:\"signature\";s:24:\"SIG_yjXOsm2mtbq155R29vge\";}s:8:\"customer\";O:8:\"stdClass\":8:{s:2:\"id\";i:6933146;s:10:\"first_name\";N;s:9:\"last_name\";N;s:5:\"email\";s:18:\"firstsur@gmail.com\";s:13:\"customer_code\";s:19:\"CUS_ixu36edfcysvt4o\";s:5:\"phone\";N;s:8:\"metadata\";N;s:11:\"risk_action\";s:7:\"default\";}s:4:\"plan\";N;s:6:\"paidAt\";s:24:\"2019-02-28T13:30:56.000Z\";s:9:\"createdAt\";s:24:\"2019-02-28T13:30:55.000Z\";s:16:\"transaction_date\";s:24:\"2019-02-28T13:30:55.000Z\";s:11:\"plan_object\";O:8:\"stdClass\":0:{}s:10:\"subaccount\";O:8:\"stdClass\":0:{}}'),
(175, 49, '00_288', '000000', '239.46', 'NGN', 'completed', '2019-03-01 23:40:34', 'driver_pay', '2019-03-01 23:40:34', 'done'),
(176, 2, '00_288', '000000', '319.28000000000003', 'NGN', 'completed', '2019-03-01 23:40:34', 'school_pay', '2019-03-01 23:40:34', 'done'),
(177, 12, '00_288', '000000', '798.2', 'NGN', 'completed', '2019-03-01 23:40:34', 'ride_pay', '2019-03-01 23:40:34', 'done'),
(178, 203, '5c70485119ffd3c6db57', '5c70485119ffd3c6db57', '5175', 'NGN', 'completed', '2019-03-02 01:28:22', 'recharge', '2019-03-01 17:28:22', 'O:8:\"stdClass\":24:{s:2:\"id\";i:122108598;s:6:\"domain\";s:4:\"test\";s:6:\"status\";s:7:\"success\";s:9:\"reference\";s:20:\"5c70485119ffd3c6db57\";s:6:\"amount\";i:517500;s:7:\"message\";N;s:16:\"gateway_response\";s:8:\"Approved\";s:7:\"paid_at\";s:24:\"2019-03-01T17:28:21.000Z\";s:10:\"created_at\";s:24:\"2019-03-01T17:28:20.000Z\";s:7:\"channel\";s:4:\"card\";s:8:\"currency\";s:3:\"NGN\";s:10:\"ip_address\";s:30:\"160.153.155.25, 141.101.105.10\";s:8:\"metadata\";O:8:\"stdClass\":1:{s:12:\"site_details\";O:8:\"stdClass\":2:{s:10:\"first_name\";s:8:\"temidayo\";s:7:\"user_id\";s:3:\"203\";}}s:3:\"log\";N;s:4:\"fees\";i:17763;s:10:\"fees_split\";N;s:13:\"authorization\";O:8:\"stdClass\":12:{s:18:\"authorization_code\";s:15:\"AUTH_1uvb6tefjx\";s:3:\"bin\";s:6:\"408408\";s:5:\"last4\";s:4:\"4081\";s:9:\"exp_month\";s:2:\"03\";s:8:\"exp_year\";s:4:\"2021\";s:7:\"channel\";s:4:\"card\";s:9:\"card_type\";s:5:\"visa \";s:4:\"bank\";s:9:\"TEST BANK\";s:12:\"country_code\";s:2:\"NG\";s:5:\"brand\";s:4:\"visa\";s:8:\"reusable\";b:1;s:9:\"signature\";s:24:\"SIG_ndgrcoOX2HXwkBw3x9nj\";}s:8:\"customer\";O:8:\"stdClass\":8:{s:2:\"id\";i:6958701;s:10:\"first_name\";N;s:9:\"last_name\";N;s:5:\"email\";s:17:\"temmydd@gmail.com\";s:13:\"customer_code\";s:19:\"CUS_0yzze6mrv9d3604\";s:5:\"phone\";N;s:8:\"metadata\";N;s:11:\"risk_action\";s:7:\"default\";}s:4:\"plan\";N;s:6:\"paidAt\";s:24:\"2019-03-01T17:28:21.000Z\";s:9:\"createdAt\";s:24:\"2019-03-01T17:28:20.000Z\";s:16:\"transaction_date\";s:24:\"2019-03-01T17:28:20.000Z\";s:11:\"plan_object\";O:8:\"stdClass\":0:{}s:10:\"subaccount\";O:8:\"stdClass\":0:{}}'),
(179, 13, '00_298', '000000', '88.8', 'NGN', 'completed', '2019-03-02 20:22:34', 'driver_pay', '2019-03-02 20:22:34', 'done'),
(180, 1, '00_298', '000000', '118.4', 'NGN', 'completed', '2019-03-02 20:22:34', 'school_pay', '2019-03-02 20:22:34', 'done'),
(181, 159, '00_298', '000000', '296.0', 'NGN', 'completed', '2019-03-02 20:22:34', 'ride_pay', '2019-03-02 20:22:34', 'done'),
(182, 9, '0eced7a90e4d289a6f62', '0eced7a90e4d289a6f62', '5175', 'NGN', 'completed', '2019-03-03 01:50:54', 'recharge', '2019-03-02 17:50:54', 'O:8:\"stdClass\":24:{s:2:\"id\";i:122789568;s:6:\"domain\";s:4:\"test\";s:6:\"status\";s:7:\"success\";s:9:\"reference\";s:20:\"0eced7a90e4d289a6f62\";s:6:\"amount\";i:517500;s:7:\"message\";N;s:16:\"gateway_response\";s:8:\"Approved\";s:7:\"paid_at\";s:24:\"2019-03-02T17:50:53.000Z\";s:10:\"created_at\";s:24:\"2019-03-02T17:50:52.000Z\";s:7:\"channel\";s:4:\"card\";s:8:\"currency\";s:3:\"NGN\";s:10:\"ip_address\";s:29:\"160.153.155.25, 141.101.77.23\";s:8:\"metadata\";O:8:\"stdClass\":1:{s:12:\"site_details\";O:8:\"stdClass\":2:{s:10:\"first_name\";s:7:\"Chinedu\";s:7:\"user_id\";s:1:\"9\";}}s:3:\"log\";N;s:4:\"fees\";i:17763;s:10:\"fees_split\";N;s:13:\"authorization\";O:8:\"stdClass\":12:{s:18:\"authorization_code\";s:15:\"AUTH_cogjbr8vm1\";s:3:\"bin\";s:6:\"408408\";s:5:\"last4\";s:4:\"4081\";s:9:\"exp_month\";s:2:\"04\";s:8:\"exp_year\";s:4:\"2020\";s:7:\"channel\";s:4:\"card\";s:9:\"card_type\";s:5:\"visa \";s:4:\"bank\";s:9:\"TEST BANK\";s:12:\"country_code\";s:2:\"NG\";s:5:\"brand\";s:4:\"visa\";s:8:\"reusable\";b:1;s:9:\"signature\";s:24:\"SIG_aHeNs3H9gvvOsGPdxD0z\";}s:8:\"customer\";O:8:\"stdClass\":8:{s:2:\"id\";i:1890421;s:10:\"first_name\";N;s:9:\"last_name\";N;s:5:\"email\";s:7:\"c@c.com\";s:13:\"customer_code\";s:19:\"CUS_6zcd4f41kjyvx8m\";s:5:\"phone\";N;s:8:\"metadata\";N;s:11:\"risk_action\";s:7:\"default\";}s:4:\"plan\";N;s:6:\"paidAt\";s:24:\"2019-03-02T17:50:53.000Z\";s:9:\"createdAt\";s:24:\"2019-03-02T17:50:52.000Z\";s:16:\"transaction_date\";s:24:\"2019-03-02T17:50:52.000Z\";s:11:\"plan_object\";O:8:\"stdClass\":0:{}s:10:\"subaccount\";O:8:\"stdClass\":0:{}}'),
(183, 9, 'aa574976313999200bd4', 'aa574976313999200bd4', '101.5', 'NGN', 'completed', '2019-03-03 01:51:51', 'recharge', '2019-03-02 17:51:51', 'O:8:\"stdClass\":24:{s:2:\"id\";i:122789991;s:6:\"domain\";s:4:\"test\";s:6:\"status\";s:7:\"success\";s:9:\"reference\";s:20:\"aa574976313999200bd4\";s:6:\"amount\";i:10150;s:7:\"message\";N;s:16:\"gateway_response\";s:8:\"Approved\";s:7:\"paid_at\";s:24:\"2019-03-02T17:51:49.000Z\";s:10:\"created_at\";s:24:\"2019-03-02T17:51:48.000Z\";s:7:\"channel\";s:4:\"card\";s:8:\"currency\";s:3:\"NGN\";s:10:\"ip_address\";s:31:\"160.153.155.25, 162.158.111.160\";s:8:\"metadata\";O:8:\"stdClass\":1:{s:12:\"site_details\";O:8:\"stdClass\":2:{s:10:\"first_name\";s:7:\"Chinedu\";s:7:\"user_id\";s:1:\"9\";}}s:3:\"log\";N;s:4:\"fees\";i:153;s:10:\"fees_split\";N;s:13:\"authorization\";O:8:\"stdClass\":12:{s:18:\"authorization_code\";s:15:\"AUTH_au0ou6gxzk\";s:3:\"bin\";s:6:\"408408\";s:5:\"last4\";s:4:\"4081\";s:9:\"exp_month\";s:2:\"04\";s:8:\"exp_year\";s:4:\"2020\";s:7:\"channel\";s:4:\"card\";s:9:\"card_type\";s:5:\"visa \";s:4:\"bank\";s:9:\"TEST BANK\";s:12:\"country_code\";s:2:\"NG\";s:5:\"brand\";s:4:\"visa\";s:8:\"reusable\";b:1;s:9:\"signature\";s:24:\"SIG_aHeNs3H9gvvOsGPdxD0z\";}s:8:\"customer\";O:8:\"stdClass\":8:{s:2:\"id\";i:1890421;s:10:\"first_name\";N;s:9:\"last_name\";N;s:5:\"email\";s:7:\"c@c.com\";s:13:\"customer_code\";s:19:\"CUS_6zcd4f41kjyvx8m\";s:5:\"phone\";N;s:8:\"metadata\";N;s:11:\"risk_action\";s:7:\"default\";}s:4:\"plan\";N;s:6:\"paidAt\";s:24:\"2019-03-02T17:51:49.000Z\";s:9:\"createdAt\";s:24:\"2019-03-02T17:51:48.000Z\";s:16:\"transaction_date\";s:24:\"2019-03-02T17:51:48.000Z\";s:11:\"plan_object\";O:8:\"stdClass\":0:{}s:10:\"subaccount\";O:8:\"stdClass\":0:{}}');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `u_id` int(11) NOT NULL,
  `u_token` varchar(100) DEFAULT NULL,
  `u_first_name` varchar(70) DEFAULT NULL,
  `u_last_name` varchar(70) DEFAULT NULL,
  `u_email` varchar(100) DEFAULT NULL,
  `u_password` varchar(150) DEFAULT NULL,
  `u_edu_institution` int(11) DEFAULT NULL,
  `u_phone` varchar(20) DEFAULT NULL,
  `u_phone_country` varchar(20) DEFAULT NULL,
  `u_type` int(11) DEFAULT NULL,
  `u_gender` varchar(10) DEFAULT NULL,
  `u_image` varchar(70) DEFAULT NULL,
  `u_auth_mode` varchar(10) NOT NULL DEFAULT 'email',
  `u_auth_provider` varchar(10) DEFAULT NULL,
  `u_auth_uid` varchar(50) DEFAULT NULL,
  `u_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `u_last_modified` varchar(50) DEFAULT NULL,
  `u_device_id` text,
  `u_app_version` varchar(10) DEFAULT NULL,
  `u_device_type` varchar(50) DEFAULT NULL,
  `u_push_token` text,
  `u_last_otp` varchar(50) DEFAULT NULL,
  `u_role` int(11) NOT NULL DEFAULT '5',
  `u_status` enum('ACTIVE','DEACTIVATED','SUSPENDED','') NOT NULL DEFAULT 'ACTIVE',
  `u_temp_pass` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`u_id`, `u_token`, `u_first_name`, `u_last_name`, `u_email`, `u_password`, `u_edu_institution`, `u_phone`, `u_phone_country`, `u_type`, `u_gender`, `u_image`, `u_auth_mode`, `u_auth_provider`, `u_auth_uid`, `u_created_at`, `u_last_modified`, `u_device_id`, `u_app_version`, `u_device_type`, `u_push_token`, `u_last_otp`, `u_role`, `u_status`, `u_temp_pass`) VALUES
(1, 'UFUvRVI5akVhc2tWWWE2MldmalV6ZW1UVEQ2a1lVbktGbHExV3VpRllTVT0=', 'Remya', 'Krishnan', 'remya@gmail.com', '223344', 0, '8877665544', '+91', 4, 'female', 'female.png', 'email', 'email', 'email', '2018-09-20 11:47:56', '2018-09-24 12:01:41', 'fNiygai8zwI:APA91bFUMDovvnhQ0WVs-uwiyu5d9JerEYZiv5bb1Qoa4GY5DhhuSrTtiO2nkyob3XPgKzzbS4-W6RG73iMQkGFlUgBKQpv7JG10jIBhP89CrKmSz91QD1CkAJz3WboIrXavfzhthMO8', '1.2', 'android', 'fNiygai8zwI:APA91bFUMDovvnhQ0WVs-uwiyu5d9JerEYZiv5bb1Qoa4GY5DhhuSrTtiO2nkyob3XPgKzzbS4-W6RG73iMQkGFlUgBKQpv7JG10jIBhP89CrKmSz91QD1CkAJz3WboIrXavfzhthMO8', NULL, 5, 'ACTIVE', NULL),
(2, 'R3huUE84Ri9pMitoRlZsM2xmRklpa1R3RnpaRnNrdjFRWXE3N1VkcGZWcz0=', 'Adedipo Adekanbi', '', 'adekanbiadedipo@gmail.com', '0Dy5tlag', 2, '8149565063', '+234', 3, '', '.png', 'social', 'google', '108474877981881463341', '2018-09-20 12:21:47', '2019-03-01 15:01:34', '', '2.0', 'android', '', NULL, 5, 'ACTIVE', NULL),
(4, 'QXVPRXBJbUU1NFZHZ3NsSFovcVk0M1RwSjZ1c0ZndDZDR250Y3hwWGhIbz0=', 'Test', 'sics', 'test@gmail.com', '123', 3, '8943871644', '+972', 3, '', '.png', 'email', '', '', '2018-09-20 12:34:35', '2018-10-17 13:32:09', 'dOyFkVzaFtI:APA91bFrZwej5uI4Hz5qdjmw6HSNwftQdIr_Bi8NmFui6O0KMOtxv4VsIR2CP3nssS4SrTre1dvp0Ha1AQKBUx5CWhBVbVOcqP14OdEVnZa2KPxiVWngUe9sNK69POJ57TGB6wPYrznE', '2.0', 'android', 'dOyFkVzaFtI:APA91bFrZwej5uI4Hz5qdjmw6HSNwftQdIr_Bi8NmFui6O0KMOtxv4VsIR2CP3nssS4SrTre1dvp0Ha1AQKBUx5CWhBVbVOcqP14OdEVnZa2KPxiVWngUe9sNK69POJ57TGB6wPYrznE', NULL, 5, 'ACTIVE', NULL),
(5, 'a1NBWG1LQ3RwTjJ6QVlIQ0lVVXBNRDJtMjNFSXkvcXN3VXdZQUo5eU1pTT0=', 'Tesr', 'Sics', 'testsics@gmail.com', '23456', 0, '321456987', '+91', 4, 'male', 'male.png', 'email', 'email', 'email', '2018-09-20 14:19:25', '2018-10-12 18:43:28', '6d0de82783c28fd30544f4cd19f59f73545960666b9e8db2ee6e1b39ee076052', '1.2', 'iOS', '6d0de82783c28fd30544f4cd19f59f73545960666b9e8db2ee6e1b39ee076052', NULL, 5, 'ACTIVE', NULL),
(6, 'SmNYazZxYXd3TE9NUE9NcGs2cUUyOC9QSGlrdXdtY011N1NIV0c0UmM4Yz0=', 'test2', 'user', 'test@test.com', 'MSkMycTT', 1, '888888888', '+91', 1, 'male', 'pNR4axw3jU.png', 'email', 'google', '125a47856', '2018-09-20 16:08:44', '2018-10-04 13:02:35', NULL, NULL, NULL, NULL, NULL, 5, 'ACTIVE', NULL),
(7, 'RFh2N0pyNEJLYThNOHpLYlNmVCszVnBobXhnT3BTYmpLTTBOeWRSdXBYTT0=', 'test2', 'user', 'test1@gmail.com', '123456', 1, '888888888', '+91', 4, 'male', 'male.png', 'email', 'google', '125a47856', '2018-09-20 16:18:47', '2018-09-21 19:05:40', '77099257dba40369baf9c1dd315e4ace00f63f7e84869b4301de30c599fac47c', '1.2', 'iOS', '77099257dba40369baf9c1dd315e4ace00f63f7e84869b4301de30c599fac47c', NULL, 5, 'ACTIVE', NULL),
(8, 'SmNYazZxYXd3TE9NUE9NcGs2cUUyNGtNdU9HaGVNSGFOK3dBaFNEaGpTST0=', 'Test Rider', 'User', 'testj@testj.com', '123456', 1, '1234567899', '+91', 3, '', '.png', 'email', '', '', '2018-09-20 17:50:14', '2018-09-20 18:50:14', NULL, NULL, NULL, NULL, NULL, 5, 'ACTIVE', NULL),
(9, 'djVsV1pNRHdwQW9WRTNrOFJwa3RZYU1ueHpUM0Naa2NzbjdYWWVIbDM4Zz0=', 'Chinedu', 'Ofor', 'c@c.com', 'cccccc', 2, '07030296746', '+234', 3, '', '.png', 'email', '', '', '2018-09-20 19:34:16', '2019-03-02 18:46:51', 'en8YaZl3vbQ:APA91bEi-gNAWykgRE4a6gyuOiSNb6Rwp6GmtKgfGH2BFWlx1gg1bXgYAdm79FPbBzNVX7kwPH9AUs-6YddgHhQNve54YThdxPxzAatBshws-_NS8gvJd7msrf9I8qCWrWPdohI3ljyI', '2.0', 'iOS', 'en8YaZl3vbQ:APA91bEi-gNAWykgRE4a6gyuOiSNb6Rwp6GmtKgfGH2BFWlx1gg1bXgYAdm79FPbBzNVX7kwPH9AUs-6YddgHhQNve54YThdxPxzAatBshws-_NS8gvJd7msrf9I8qCWrWPdohI3ljyI', NULL, 5, 'ACTIVE', NULL),
(10, 'SmNYazZxYXd3TE9NUE9NcGs2cUUyNWVhNkFLV05yMUxtS0hXL1RYeTI1TT0=', 'Chinonso Raymond', 'Raymond', 'chinonsoray@gmail.com', '2caRXb1N', 1, '851818085', '+1', 3, '', 'FhS390lEjG.png', 'social', 'google', '114671026178399377136', '2018-09-20 21:40:20', '2018-09-20 22:40:20', NULL, NULL, NULL, NULL, NULL, 5, 'ACTIVE', NULL),
(11, 'SVp4Y09rZ2xmaXVENXgzT1pHQndCcmQ1UnZHdVF3RndXOWdkUE9xV25DWT0=', 'Lijo', 'Matew', 'lijo@gmail.com', 'qwe123', 2, '9961087465', '+91', 3, 'male', '.png', 'email', '', '', '2018-09-21 18:16:40', '2018-10-15 05:40:45', 'fvstn-mZOVg:APA91bGZm5edAkLN564sWier0lxcK3S4krHwzBu7ZP1DqkPTSQlEmJI3Rbx6nvQG80hFTlRRM-2x_A5Wjz3Wy_sgJDZnE7fbiQYVKIJi-CURI5OSeFgJLhd7dxLhWF_g-XWT7FLU0Jsq', '2.0', 'android', 'fvstn-mZOVg:APA91bGZm5edAkLN564sWier0lxcK3S4krHwzBu7ZP1DqkPTSQlEmJI3Rbx6nvQG80hFTlRRM-2x_A5Wjz3Wy_sgJDZnE7fbiQYVKIJi-CURI5OSeFgJLhd7dxLhWF_g-XWT7FLU0Jsq', NULL, 5, 'ACTIVE', NULL),
(12, 'UWVoM0FrcWp1WXJPZlRwSDVZWThNb0JDbzhTV0hmbTViUHZFQk45WU9pcz0=', 'Seun Owonikoko', 'Owonikoko', 'seunowonikoko@gmail.com', '8G4yqzHF', 2, '8079216793', '+234', 3, '', '1RwK0owsJc.png', 'social', 'google', '113406966567259347441', '2018-09-21 19:14:01', '2018-10-04 13:41:08', 'fXCWjr8kn0A:APA91bHDiZG9s2_53Li-PFDH1BgR3JXKmfQcqNG-BnneGxAcrD_jOXzTONpuClVESkFjaV8fv2MDmunX4o8EdvpvmkUBGHBaaqukYMg0pvkUzWJWaCFKdUG4oMjazrn7iDINuPEo8ybG', '2.0', 'android', 'fXCWjr8kn0A:APA91bHDiZG9s2_53Li-PFDH1BgR3JXKmfQcqNG-BnneGxAcrD_jOXzTONpuClVESkFjaV8fv2MDmunX4o8EdvpvmkUBGHBaaqukYMg0pvkUzWJWaCFKdUG4oMjazrn7iDINuPEo8ybG', NULL, 5, 'ACTIVE', NULL),
(13, 'd1ZnVnhnVjZMZ1BETCsvVG0rOVpwdFVhTTFvVGhhK1VUZ0JMUU1MdE9WVT0=', 'Banky', 'W', 'deepseadavidz@gmail.com', 'Deepsea_1', 1, '8181122520', '+234', 4, 'male', 'male.png', 'email', 'email', 'email', '2018-09-21 19:25:52', '2019-03-02 19:06:33', 'eSsbdprP1sc:APA91bFVtHQztCWa13s10QNhzQtzc17FJDEQCN1GDOkjNo3_EOvk82CqIGh12AzpWhp7dUxa7bEhvpcKcsOL_BDBeFxwCfBrzstdVkEYEGuKrGtHY-SGtY0Jkss3fIE8SWfoaJiRqPTp', '1.02', 'android', 'eSsbdprP1sc:APA91bFVtHQztCWa13s10QNhzQtzc17FJDEQCN1GDOkjNo3_EOvk82CqIGh12AzpWhp7dUxa7bEhvpcKcsOL_BDBeFxwCfBrzstdVkEYEGuKrGtHY-SGtY0Jkss3fIE8SWfoaJiRqPTp', NULL, 5, 'ACTIVE', NULL),
(14, 'RnpQVDZYenZrNmY1ZU1LMk9sU1ZPSFRKMnpOdFhjUDlaMlBqb0lrSUk0ST0=', 'Chinedu Ofor', '', 'oforchinedukelechi@gmail.com', 'SsuPg20O', 2, '7030296746', '+234', 3, '', '.png', 'social', 'google', '106070622921397931455', '2018-09-21 19:33:18', '2018-11-30 19:13:01', 'fDAlgSv3hag:APA91bHNfnNunVClyaYP6OgAVtj46pk3D-DAnHxO9hwq-RttcmBfUQABD5YGip1Rus4o5c-StEgU8lDnYVw-Url_pU294PRbR5jwPG_Kb8RMFYO-_T1c9crfcqmv--RvdofaI9QX8V7X', '2.0', 'iOS', 'fDAlgSv3hag:APA91bHNfnNunVClyaYP6OgAVtj46pk3D-DAnHxO9hwq-RttcmBfUQABD5YGip1Rus4o5c-StEgU8lDnYVw-Url_pU294PRbR5jwPG_Kb8RMFYO-_T1c9crfcqmv--RvdofaI9QX8V7X', NULL, 5, 'ACTIVE', NULL),
(15, 'TUErSy9QU0w2NHFlUDFtZ0tWQjkvb0pRNnNWaWRYUVI2aXE1YUVkcERnVT0=', 'Test', 'Lady', 'testlady@gmail.com', 'Test', 2, '8125225258', '+234', 3, '', '.png', 'email', '', '', '2018-09-22 19:43:10', '2018-09-22 20:43:10', NULL, NULL, NULL, NULL, NULL, 5, 'ACTIVE', NULL),
(16, 'TUErSy9QU0w2NHFlUDFtZ0tWQjkvc2UwVVY2QWQ3U1d0VFY1VkZsMVFzND0=', 'Test', 'Driver', 'testdriver@gmail.com', 'Test', 1, '8252563328', '+234', 4, 'female', 'female.png', 'email', 'email', 'email', '2018-09-22 19:46:53', '2018-09-22 20:46:53', NULL, NULL, NULL, NULL, NULL, 5, 'ACTIVE', NULL),
(17, 'WHpQVm5UVzY0cG01K3hYRlhsMDVpQ1B2bTZTMlpkRjhXQW1XbkcxaHJRND0=', 'Rex', 'Oravbiere', 'rexoravbiere@gmail.com', 'reigner', 4, '08163511377', '+234', 6, '', '.png', 'email', '', '', '2018-09-23 22:09:46', '2018-09-23 23:09:46', NULL, NULL, NULL, NULL, NULL, 5, 'ACTIVE', NULL),
(18, 'ZWNBakJnTkkzL083bFRKOWJWMXFhS1J2S0lkMlJTQ2hwVmluNUdRNE5LWT0=', '', '', '', 'JpGTKQD4', 0, '', '+91', 4, 'female', 'female.png', 'email', 'email', 'email', '2018-09-24 17:21:07', '2018-09-24 18:21:07', NULL, NULL, NULL, NULL, NULL, 5, 'ACTIVE', NULL),
(19, 'ZWNBakJnTkkzL083bFRKOWJWMXFhSXNBWm9GOGM4WGNKUmxNelpPWkNMYz0=', 'Prabhu', 'Sasi', 'prabhu@gmail.com', '23456', 0, '88552233', '+91', 4, 'female', 'female.png', 'email', 'email', 'email', '2018-09-24 17:22:43', '2018-09-24 18:22:43', NULL, NULL, NULL, NULL, NULL, 5, 'ACTIVE', NULL),
(20, 'ZWNBakJnTkkzL083bFRKOWJWMXFhSlUvc0pUOFFkczZyN01pM1dwbTBoQT0=', 'Prabhu', 'Sasi', 'prabhusasi@gmail.com', '23456', 2, '88552233', '+91', 4, 'female', 'female.png', 'email', 'email', 'email', '2018-09-24 17:27:12', '2018-09-24 18:27:12', NULL, NULL, NULL, NULL, NULL, 5, 'ACTIVE', NULL),
(21, 'ZWNBakJnTkkzL083bFRKOWJWMXFhRmpXOCsvRUdudTdCNEpTWXhia2prbz0=', 'Test11', 'Fffg', 'test11@gmail.com', '23456', 0, '22335566', '+91', 4, 'female', 'female.png', 'email', 'email', 'email', '2018-09-24 17:34:01', '2018-09-24 18:34:01', NULL, NULL, NULL, NULL, NULL, 5, 'ACTIVE', NULL),
(22, 'ZWNBakJnTkkzL083bFRKOWJWMXFhQXlOUHF2RnZwQy9yYk5RWUVQZXNYOD0=', 'Test11', 'Fffg', 'test1c1@gmail.com', '23456', 0, '22335566', '+91', 4, 'female', 'female.png', 'email', 'email', 'email', '2018-09-24 17:41:53', '2018-09-24 18:41:53', NULL, NULL, NULL, NULL, NULL, 5, 'ACTIVE', NULL),
(23, 'ZWNBakJnTkkzL083bFRKOWJWMXFhQzBIYlRYdGRsWk94L3p1azdYQW1nVT0=', 'Test11', 'Fffg', 'testc1c1@gmail.com', '23456', 0, '22335566', '+91', 4, 'female', 'female.png', 'email', 'email', 'email', '2018-09-24 17:44:09', '2018-09-24 18:44:09', NULL, NULL, NULL, NULL, NULL, 5, 'ACTIVE', NULL),
(24, 'R0NjNUFQY3dpQW13V3RCVWJUb05OdzNsbHhvUnNEaFZTR2JCMUxtMnEzWT0=', 'Arju', 'Dev', 'arju@gmail.com', '23456', 0, '1122334455', '+91', 4, 'male', 'male.png', 'email', 'email', 'email', '2018-09-25 09:21:02', '2018-09-25 10:21:02', NULL, NULL, NULL, NULL, NULL, 5, 'ACTIVE', NULL),
(25, 'MlJVRUNNa3lGNFZvTTkyYW1NNDhCTWdzR25qdDZ2L3VwQllLVjJnWWtYcz0=', 'Arju', 'PwoliSir', 'arjusir@gmail.com', '23456', 0, '22334455', '+91', 4, 'male', 'a86ffa68a1466541.jpg', 'email', 'email', 'email', '2018-09-25 09:34:32', '2018-10-17 13:33:12', 'dgByDezeAro:APA91bFFZsbZ_FxIYGknTC-9Lkrode5hLdsktiO8-ph47aJAG6iVK8Cdi88w9_jkF5NTd1GbCpVsBdxqKSRbjt3uvVJFqV7x2wYlsykgAXQgij1JabNcZORW2knDSipqYfc2HloBsDrT', '1.02', 'android', 'dgByDezeAro:APA91bFFZsbZ_FxIYGknTC-9Lkrode5hLdsktiO8-ph47aJAG6iVK8Cdi88w9_jkF5NTd1GbCpVsBdxqKSRbjt3uvVJFqV7x2wYlsykgAXQgij1JabNcZORW2knDSipqYfc2HloBsDrT', NULL, 5, 'ACTIVE', NULL),
(26, 'R0NjNUFQY3dpQW13V3RCVWJUb05OMkZkb3BMck45OW4zcVlmanlBa2szYz0=', 'Jijin', 'Tampi', 'jijin@gmail.com', '123456', 0, '85285285', '+91', 4, 'male', 'male.png', 'email', 'email', 'email', '2018-09-25 13:33:19', '2018-09-25 14:33:19', NULL, NULL, NULL, NULL, NULL, 5, 'ACTIVE', NULL),
(27, 'R0NjNUFQY3dpQW13V3RCVWJUb05ONVRPZ09CbTZUYkl0c2RLelBaMVVmRT0=', 'test2', 'user', 'testd22@test.com', '123456', 1, '888888888', '+91', 4, 'male', 'male.png', 'email', 'google', '125a47856', '2018-09-25 16:26:22', '2018-09-25 17:26:22', NULL, NULL, NULL, NULL, NULL, 5, 'ACTIVE', NULL),
(28, 'cEJBcmhXazlKRTF2S3hIU3FZV2MvOXZFK1Jtd25jS1lWamNEWkRYK09XQT0=', 'test4', '', 'test4@gmail.com', '123', 1, '789456123', '+1', 4, 'male', '832bee33a36ccd85.jpeg', 'email', '', '', '2018-09-25 17:52:39', '2018-09-26 11:54:59', '', '1.2', 'iOS', '', NULL, 5, 'ACTIVE', NULL),
(29, 'Mm5RdEExUUZ4M0s5MWJYNlNXdFlMdGlZWGhEVlNVeEgzR2l5QXc2c1UwRT0=', 'Haha', 'Huhi', 'haha@hihi.com', 'qwe123', 3, '9856324789', '+91', 5, '', '.png', 'email', '', '', '2018-09-26 15:05:57', '2018-09-26 16:05:57', NULL, NULL, NULL, NULL, NULL, 5, 'ACTIVE', NULL),
(30, 'Mm5RdEExUUZ4M0s5MWJYNlNXdFlMbkVwRWFWQzgvNm9pZzhNU3FLc1c3TT0=', 'Haha', 'Huhi', 'haha@hihihi.com', 'qwe123', 3, '9856324789', '+91', 5, '', '.png', 'email', '', '', '2018-09-26 15:10:25', '2018-09-26 16:10:25', NULL, NULL, NULL, NULL, NULL, 5, 'ACTIVE', NULL),
(31, 'Mm5RdEExUUZ4M0s5MWJYNlNXdFlMdHJOTmFWV0NNakhNQ2J3bkxkWVhaRT0=', 'Haha', 'Huhi', 'hahaha@hihihi.com', 'qwe123', 3, '9856324788', '+91', 5, '', '.png', 'email', '', '', '2018-09-26 15:11:09', '2018-09-26 16:11:09', NULL, NULL, NULL, NULL, NULL, 5, 'ACTIVE', NULL),
(32, 'Mm5RdEExUUZ4M0s5MWJYNlNXdFlMb2xoTGF5TmhYazBvUlpJOW5rM1UrWT0=', 'cjc', 'cjcj', 'ha@hi.com', 'qwe123', 2, '985635698', '+91', 5, '', '.png', 'email', '', '', '2018-09-26 15:12:39', '2018-09-26 16:12:39', NULL, NULL, NULL, NULL, NULL, 5, 'ACTIVE', NULL),
(33, '2f0414962bb099ed7f3ed161a649eee7d96f25e6f7143b212422dbe57a96c1be', 'test2', 'user', 'test1@test.com', '123456', 1, '888888888', '+91', 1, 'male', 'iAD4MmY8Q1.png', 'email', 'google', '125a47856', '2018-09-26 16:03:27', '2018-11-05 08:44:46', NULL, NULL, NULL, NULL, NULL, 2, 'ACTIVE', NULL),
(34, 'Mm5RdEExUUZ4M0s5MWJYNlNXdFlMc3hzK2t4OW9SRXVCNjVKa1NXTktvZz0=', 'Haha', 'Huhi', 'hahahaha@hihihi.com', 'qwe123', 3, '9856324788', '+91', 5, '', '.png', 'email', '', '', '2018-09-26 16:18:24', '2018-09-26 17:18:24', NULL, NULL, NULL, NULL, NULL, 5, 'ACTIVE', NULL),
(35, 'Mm5RdEExUUZ4M0s5MWJYNlNXdFlMbkxCWWZqakFKeVpudEVOTmgyVHJIcz0=', 'Haha', 'Huhi', 'hahahahhaa@hihihi.com', 'qwe123', 3, '9856324788', '+91', 5, '', '.png', 'email', '', '', '2018-09-26 16:22:34', '2018-09-26 17:22:34', NULL, NULL, NULL, NULL, NULL, 5, 'ACTIVE', NULL),
(36, 'Mm5RdEExUUZ4M0s5MWJYNlNXdFlMdndwWkozRWxqeVMrV0NwLy9rQkU5TT0=', 'Uvi', 'Hv', 'uc@ug.com', 'qwe123', 3, '9988445522', '+91', 3, '', '.png', 'email', '', '', '2018-09-26 16:29:09', '2018-09-26 17:29:09', NULL, NULL, NULL, NULL, NULL, 5, 'ACTIVE', NULL),
(37, 'Mm5RdEExUUZ4M0s5MWJYNlNXdFlMcSt5RGFYTVJxeHpHWll4NnlGdjFhTT0=', 'Uvi', 'Hv', 'ucgj@ug.com', 'qwe123', 3, '9988446522', '+91', 3, '', '.png', 'email', '', '', '2018-09-26 16:31:52', '2018-09-26 17:31:52', NULL, NULL, NULL, NULL, NULL, 5, 'ACTIVE', NULL),
(38, 'Mm5RdEExUUZ4M0s5MWJYNlNXdFlMaDBUL0R6YXlURTZ3WXIzM0ZLb1lEbz0=', 'test2', 'user', 'test6@test.com', '123456', 1, '888888888', '+91', 2, '', '00FTS63bpL.png', 'email', 'google', '125a47856', '2018-09-26 16:34:12', '2018-09-26 17:34:12', NULL, NULL, NULL, NULL, NULL, 5, 'ACTIVE', NULL),
(39, 'Mm5RdEExUUZ4M0s5MWJYNlNXdFlMaVAySjZzSE9JUnVIMG5nVXdwNjNpcz0=', 'test2', 'user', 'test7@test.com', '123456', 1, '888888888', '+91', 2, '', 'uSrCFQz45C.png', 'email', 'google', '125a47856', '2018-09-26 16:34:17', '2018-09-26 17:34:17', NULL, NULL, NULL, NULL, NULL, 5, 'ACTIVE', NULL),
(40, 'Mm5RdEExUUZ4M0s5MWJYNlNXdFlMaFFSS2pXbzBYWXVUNktsanMrYzR5bz0=', 'test2', 'user', 'test11@test.com', '123456', 1, '888888888', '+91', 1, 'male', 'yjM4ZUgftj.png', 'email', 'google', '125a47856', '2018-09-26 16:34:47', '2018-09-26 17:34:47', NULL, NULL, NULL, NULL, NULL, 5, 'ACTIVE', NULL),
(41, 'Mm5RdEExUUZ4M0s5MWJYNlNXdFlMb09pT2cxekFyQ3U0L09SRlhpMVM4Yz0=', 'test2', 'user', 'test111@test.com', '123456', 1, '888888888', '+91', 1, 'male', 'YUYofSP3ep.png', 'email', 'google', '125a47856', '2018-09-26 16:37:02', '2018-09-26 17:37:02', NULL, NULL, NULL, NULL, NULL, 5, 'ACTIVE', NULL),
(42, 'Mm5RdEExUUZ4M0s5MWJYNlNXdFlMa0paQnpldlQvTGoydGM2UzhISmdjRT0=', 'Uvi', 'Hv', 'ucgj@vxug.com', 'qwe123', 3, '9988446522', '+91', 3, '', '.png', 'email', '', '', '2018-09-26 16:38:09', '2018-09-26 17:38:09', NULL, NULL, NULL, NULL, NULL, 5, 'ACTIVE', NULL),
(43, 'ejhaMTF6REtMMERpaFBDeG1nKzRyNVQ0THRzYzFneG5JM3M0Zkh2bTRrQT0=', 'Chinedu', 'Ofor', 'oforchinedu@gmail.com', 'cccccc', 1, '07030296746', '+234', 4, 'male', 'male.png', 'email', 'email', 'email', '2018-09-26 19:13:09', '2018-09-26 20:16:33', 'cvel39Esh5M:APA91bGtqa1ygqc4TIYnUyHXHL_qoqtS-PlDp8ZiIFMcTSJRrOrzzhnDX07YrG19gNGTg83IQKtltYHBcYaqzm-6PPnHjfqwA73q63wFfyCJ-0Z1eyUp__Pom6NBGurBqn5TuvQA2GgW', '1.2', 'android', 'cvel39Esh5M:APA91bGtqa1ygqc4TIYnUyHXHL_qoqtS-PlDp8ZiIFMcTSJRrOrzzhnDX07YrG19gNGTg83IQKtltYHBcYaqzm-6PPnHjfqwA73q63wFfyCJ-0Z1eyUp__Pom6NBGurBqn5TuvQA2GgW', NULL, 5, 'ACTIVE', NULL),
(44, 'K3UxTFJmTUd1UVZTcG10SFloVlpRNlo0d2lKdDdSRDNLL1A1Q3V0bU0rND0=', 'Chinedu', 'Ofor', 'oforchinedu1@gmail.com', 'cccccc', 1, '07030296746', '+234', 4, 'male', 'male.png', 'email', 'email', 'email', '2018-09-26 19:13:44', '2018-09-26 20:16:57', 'cvel39Esh5M:APA91bGtqa1ygqc4TIYnUyHXHL_qoqtS-PlDp8ZiIFMcTSJRrOrzzhnDX07YrG19gNGTg83IQKtltYHBcYaqzm-6PPnHjfqwA73q63wFfyCJ-0Z1eyUp__Pom6NBGurBqn5TuvQA2GgW', '1.2', 'android', 'cvel39Esh5M:APA91bGtqa1ygqc4TIYnUyHXHL_qoqtS-PlDp8ZiIFMcTSJRrOrzzhnDX07YrG19gNGTg83IQKtltYHBcYaqzm-6PPnHjfqwA73q63wFfyCJ-0Z1eyUp__Pom6NBGurBqn5TuvQA2GgW', NULL, 5, 'ACTIVE', NULL),
(45, 'Mm5RdEExUUZ4M0s5MWJYNlNXdFlMb1dqWTgrQnc4OWlUN21hWnI4MGo1UT0=', 'Chinedu', 'Ofor', 'c@z.com', 'cccccc', 1, '07030296746', '+234', 4, 'male', 'male.png', 'email', 'email', 'email', '2018-09-26 19:18:41', '2018-09-26 20:18:41', NULL, NULL, NULL, NULL, NULL, 5, 'ACTIVE', NULL),
(46, 'Mm5RdEExUUZ4M0s5MWJYNlNXdFlMckc4YlN0eFdOQVBDdURZNFpKN0lSST0=', 'Chinedu', 'Ofor', 'c@zt.com', 'cccccc', 0, '07030296746', '+234', 4, 'male', 'male.png', 'email', 'email', 'email', '2018-09-26 19:44:01', '2018-09-26 20:44:01', NULL, NULL, NULL, NULL, NULL, 5, 'ACTIVE', NULL),
(47, 'Mm5RdEExUUZ4M0s5MWJYNlNXdFlMdlh6dFFJUTl1SG56T3pOZVpKVGM3ST0=', 'Chinedu', 'Ofor', 'testbug@gmail.com', 'cccccc', 1, '', '+234', 4, 'male', 'male.png', 'email', 'email', 'email', '2018-09-26 19:45:55', '2018-09-26 20:45:55', NULL, NULL, NULL, NULL, NULL, 5, 'ACTIVE', NULL),
(48, 'Mm5RdEExUUZ4M0s5MWJYNlNXdFlMZzBGQzRqcDg0b3BRWXlYVTVQM3BrWT0=', 'Chinedu', 'Ofor', 'bug test', 'cccccc', 1, '', '+234', 4, 'female', 'female.png', 'email', 'email', 'email', '2018-09-26 19:49:53', '2018-09-26 20:49:53', NULL, NULL, NULL, NULL, NULL, 5, 'ACTIVE', NULL),
(49, 'U0xGbCsrR291SVVnZlV0QmwvMitjaktCWUppRzhmc3R2TWdscytoZ1VpQT0=', 'Chinedu', 'Ofor', 'v@c.com', 'cccccc', 1, '', '+234', 4, 'male', 'male.png', 'email', 'email', 'email', '2018-09-26 19:51:49', '2019-03-02 18:32:18', 'diqLtIDtIgw:APA91bHWkqasUwf6I8uWeyk9hkTD0fPVPlcwUDaXcp61bHrBMw6uElchaAQleTHE0cgLps9FVRiYzFkP3SivW7J_iJdWR1HxnMIYaR1eZL6799u4v40FoXIs_h8O_N6Lnefbe_wN6-pb', '1.02', 'android', 'diqLtIDtIgw:APA91bHWkqasUwf6I8uWeyk9hkTD0fPVPlcwUDaXcp61bHrBMw6uElchaAQleTHE0cgLps9FVRiYzFkP3SivW7J_iJdWR1HxnMIYaR1eZL6799u4v40FoXIs_h8O_N6Lnefbe_wN6-pb', NULL, 5, 'ACTIVE', NULL),
(50, 'MERrUTVnMjRjQ0ttWGphbXJGRE5Yb1NrR1g5aWc1NUY0Z2k0VktUb0Foaz0=', 'Tester', 'Tt', 'j@test.com', '23456', 1, '999999999', '+91', 4, 'male', 'male.png', 'email', 'email', 'email', '2018-09-27 08:57:49', '2018-09-27 10:02:22', 'ab123456', '1.02', 'android', 'ab123456', NULL, 5, 'ACTIVE', NULL),
(52, 'eHB2THE0MnJTRkU4Zm9HVVNtTWFwdU1UZDZzOE8zMnhEaHQyeVlHZ0xrTT0=', 'Testnew', 'Sics', 'testnew@gmail.com', '23456', 3, '8888889898', '+91', 4, 'male', 'male.png', 'email', 'email', 'email', '2018-09-27 12:51:12', '2018-09-27 19:03:07', 'fNiygai8zwI:APA91bFUMDovvnhQ0WVs-uwiyu5d9JerEYZiv5bb1Qoa4GY5DhhuSrTtiO2nkyob3XPgKzzbS4-W6RG73iMQkGFlUgBKQpv7JG10jIBhP89CrKmSz91QD1CkAJz3WboIrXavfzhthMO8', '1.2', 'android', 'fNiygai8zwI:APA91bFUMDovvnhQ0WVs-uwiyu5d9JerEYZiv5bb1Qoa4GY5DhhuSrTtiO2nkyob3XPgKzzbS4-W6RG73iMQkGFlUgBKQpv7JG10jIBhP89CrKmSz91QD1CkAJz3WboIrXavfzhthMO8', NULL, 5, 'ACTIVE', NULL),
(53, 'MW5xOEVYb3p1QWlvazNJM1Y4ZDBvc2ttVkFEbFRNUGxNQlpXMU5TeTZsRT0=', 'admin', 'test', 'admin@test.com', '123456', 1, '123456789', '91', 1, 'male', NULL, 'email', NULL, NULL, '2018-09-27 01:00:00', '2019-01-09 15:03:14', 'fH_PbBDiljY:APA91bEcO6hJxzBdeDTnzEUPaOb9Qk7O7xLjnBYufQ2l9pl2wN17KCxXPn0_t19NTKZeDPzKOU4q7zSqPVUe1sXSqKjIBmkT1tzK2byp1Xv9q_-pjyzSU3uC3kj4zT9E3RRRIVc2E15S', '2.0', 'android', 'fH_PbBDiljY:APA91bEcO6hJxzBdeDTnzEUPaOb9Qk7O7xLjnBYufQ2l9pl2wN17KCxXPn0_t19NTKZeDPzKOU4q7zSqPVUe1sXSqKjIBmkT1tzK2byp1Xv9q_-pjyzSU3uC3kj4zT9E3RRRIVc2E15S', NULL, 1, 'ACTIVE', NULL),
(54, 'cFVkM1MyNm5nd3dYckdIamN3VHlBZTNQMDlmcXdibHA1QXpEQWxVYXBvbz0=', 'Lijo', 'Mathew', 'Lijo123@gmail.com', '23456', 0, '852963741', '+91', 4, 'male', 'male.png', 'email', 'email', 'email', '2018-09-27 18:12:17', '2018-09-27 20:10:12', 'cuazwYyu_5Y:APA91bFb3tMO3BtGZFGHstpr6FRXzJ8BeI6i2dcjlMLBg4AtPgJDLaf4m2fa1r0k7NyVqW-A80LKGWOTnkQbp63OYVOTr44z3C-X0MaYUiKG60zR0ogsuDm-PHbWeTUo2juusVRiPXBn', '1.2', 'android', 'cuazwYyu_5Y:APA91bFb3tMO3BtGZFGHstpr6FRXzJ8BeI6i2dcjlMLBg4AtPgJDLaf4m2fa1r0k7NyVqW-A80LKGWOTnkQbp63OYVOTr44z3C-X0MaYUiKG60zR0ogsuDm-PHbWeTUo2juusVRiPXBn', NULL, 5, 'ACTIVE', NULL),
(55, 'R0VhdFI2SGVMZmY4ck1KaFFSTFRnUldoQy9NMTl0Qmd3bWt5c09WOEMwQT0=', 'Vv', 'Vv', 'vvb@gmail.com', 'vbbb', 0, '77', '+91', 4, 'female', 'female.png', 'email', 'email', 'email', '2018-09-27 18:25:22', '2018-09-27 19:25:22', NULL, NULL, NULL, NULL, NULL, 5, 'ACTIVE', NULL),
(56, 'R0VhdFI2SGVMZmY4ck1KaFFSTFRnYUg3QjlWUzg1cXBReXJwLzBBRWZpUT0=', 'Cc', '  V', 'demo@demoschool.com', 'gvvb', 1, '7788', '+91', 4, 'female', '45693ed92993abc8.jpg', 'email', 'email', 'email', '2018-09-27 18:39:36', '2018-09-27 19:39:36', NULL, NULL, NULL, NULL, NULL, 5, 'ACTIVE', NULL),
(57, 'R0VhdFI2SGVMZmY4ck1KaFFSTFRnVTA3T2tDc0FPMFp1cEc0WWFFT0ZuST0=', 'Aalia', 'Ar', 'ajeev@gmail.com', '23456', 3, '123456789', '+91', 4, 'female', 'female.png', 'email', 'email', 'email', '2018-09-27 19:12:08', '2018-09-27 20:12:08', NULL, NULL, NULL, NULL, NULL, 5, 'ACTIVE', NULL),
(58, 'R0VhdFI2SGVMZmY4ck1KaFFSTFRnWVJTbzJzYWxDeVdkOXcxdTNLcHBRST0=', 'Chinedu', 'Ofor', 'v@b.com', 'cccccc', 2, '07030296746', '+234', 4, 'others', 'others.png', 'email', 'email', 'email', '2018-09-27 19:18:48', '2018-09-27 20:18:48', NULL, NULL, NULL, NULL, NULL, 5, 'ACTIVE', NULL),
(59, 'RjAyVGtxdUpJWUlCcWNHVDdrbnk2ei9tdm9sS2tHU0FwMVFrM3FoNlczST0=', 'Alan', 'Ajeev', 'alan@gmail.com', '23456', 4, '8956231422', '+91', 4, 'male', '349c815eb1fc7c22.jpg', 'email', 'email', 'email', '2018-09-28 09:11:26', '2018-09-28 13:50:07', 'dgByDezeAro:APA91bFFZsbZ_FxIYGknTC-9Lkrode5hLdsktiO8-ph47aJAG6iVK8Cdi88w9_jkF5NTd1GbCpVsBdxqKSRbjt3uvVJFqV7x2wYlsykgAXQgij1JabNcZORW2knDSipqYfc2HloBsDrT', '1.2', 'android', 'dgByDezeAro:APA91bFFZsbZ_FxIYGknTC-9Lkrode5hLdsktiO8-ph47aJAG6iVK8Cdi88w9_jkF5NTd1GbCpVsBdxqKSRbjt3uvVJFqV7x2wYlsykgAXQgij1JabNcZORW2knDSipqYfc2HloBsDrT', NULL, 5, 'ACTIVE', NULL),
(60, 'TVFtcmNEVUYrRVY2VnNvQlFXMGIxbkdXQ3l0NmFYUkdSSUo5TXFlYm9yMD0=', '  Vbb', 'Vb', 'debmo@demoschool.com', '455y', 1, '12586', '+91', 4, 'female', '4c33f037fd53df17.jpg', 'email', 'email', 'email', '2018-09-28 12:49:01', '2018-09-28 13:49:01', NULL, NULL, NULL, NULL, NULL, 5, 'ACTIVE', NULL),
(61, 'Y3pzbXZwdVV3N1I4d1BzVTZTL1hRZEZHNUZ4dFEvVnpOSnliNlJnT21abz0=', 'driver', 'driver ', 'driver@email.com', 'yjnjallbbl', 2, '08079216793', '+234', 4, 'male', '5f7a7bf602cd529b.jpeg', 'email', '', '', '2018-09-28 12:55:46', '2019-02-09 15:48:29', '263e5ce2948edde5ad7fbf2118c44d092d7090e5652ae691e866ce872f05d99a', '1.2', 'iOS', '263e5ce2948edde5ad7fbf2118c44d092d7090e5652ae691e866ce872f05d99a', NULL, 5, 'ACTIVE', NULL),
(62, 'RlF2K0VhaUpnQTZoYjdnYzdUQkZRNFI2VnJtamZCOGtpTVJVZkZTT2o0RT0=', 'C', 'C', 'ui@gmail.com', 'cvb', 1, '777', '+91', 4, 'female', 'female.png', 'email', 'email', 'email', '2018-09-28 14:44:26', '2018-10-03 14:12:28', 'dgByDezeAro:APA91bFFZsbZ_FxIYGknTC-9Lkrode5hLdsktiO8-ph47aJAG6iVK8Cdi88w9_jkF5NTd1GbCpVsBdxqKSRbjt3uvVJFqV7x2wYlsykgAXQgij1JabNcZORW2knDSipqYfc2HloBsDrT', '', '', 'dgByDezeAro:APA91bFFZsbZ_FxIYGknTC-9Lkrode5hLdsktiO8-ph47aJAG6iVK8Cdi88w9_jkF5NTd1GbCpVsBdxqKSRbjt3uvVJFqV7x2wYlsykgAXQgij1JabNcZORW2knDSipqYfc2HloBsDrT', NULL, 5, 'ACTIVE', NULL),
(63, 'dEYvWkpRZ2V6Ukw0ZkhrMU5vWmxaYmhnU1FNdU9PVHZ6aDhDZTdYT0NXaz0=', 'Remya Krishnan', '', 'remyakrishnankutty@gmail.com', 'BjjsBMmx', 1, '8888888888', '+91', 3, '', '.png', 'social', 'google', '109006678350615204304', '2018-10-01 04:42:59', '2018-10-01 05:42:59', 'crZ0ggt2XxM:APA91bHCaOp-mfeHQqpkltiwPk9Lyk_6nv84-2N5kyY2u5qHujKsEUj2_mfl4db7NaGJSKTdyM4DE9XUY8GromzdmPS_N06KSg6VohspGuZHbSSmDnMo_D89CEAjP31kSI55-xhWlJcH', '2.0', 'android', 'crZ0ggt2XxM:APA91bHCaOp-mfeHQqpkltiwPk9Lyk_6nv84-2N5kyY2u5qHujKsEUj2_mfl4db7NaGJSKTdyM4DE9XUY8GromzdmPS_N06KSg6VohspGuZHbSSmDnMo_D89CEAjP31kSI55-xhWlJcH', NULL, 5, 'ACTIVE', NULL),
(64, 'M0RjMDgxSXU5SFJHRGlKbnprSmQwZUFlWFVXWU4vMmREelg3dkNsN1BIOD0=', 'Aa', 'Bb', 'mgmnew@gmail.com', '23456', 1, '88888888', '+91', 4, 'female', 'female.png', 'email', 'email', 'email', '2018-10-03 13:16:30', '2018-10-03 14:16:30', NULL, NULL, NULL, NULL, NULL, 5, 'ACTIVE', NULL),
(65, 'M0RjMDgxSXU5SFJHRGlKbnprSmQwUTVRUlFkb0xiT1d5MXgwdVFGL24wOD0=', 'test2', 'user', 'testd2222@test.com', '123456', 1, '888888888', '+91', 4, 'male', 'male.png', 'email', 'google', '125a47856', '2018-10-03 13:18:52', '2018-10-03 14:18:52', NULL, NULL, NULL, NULL, NULL, 5, 'ACTIVE', NULL),
(66, 'M0RjMDgxSXU5SFJHRGlKbnprSmQwZWdIMlVDamdwVFI2QnZoZ29XRzFqND0=', 'test test', 'user', 'testtoken@test.com', '123456', 1, '888888888', '+91', 4, 'male', 'male.png', 'email', 'google', '125a47856', '2018-10-03 13:33:43', '2018-10-03 14:33:43', 'ab123456', '1.02', 'android', 'a123', NULL, 5, 'ACTIVE', NULL),
(67, 'UlpRUEYrSVQyZXNJRFd0M3o3UHpzbXBzUnhFM01IVTVySFRBVDNZbEFlMD0=', 'student', 'student', 'student@testmail.com', 'student', 2, '85632458', '+234', 3, '', '.png', 'email', '', '', '2018-10-04 13:15:04', '2018-10-04 14:15:04', '2f846903e30e43bf510737ccfa1ce514faa9721b01ff9a9881408e8af036c1bb', '1.2', 'iOS', '2f846903e30e43bf510737ccfa1ce514faa9721b01ff9a9881408e8af036c1bb', NULL, 5, 'ACTIVE', NULL),
(68, 'RHFONWVNRVZPVHRVSytpb3ErZi9uRVgvNzZ1MXovZUJFVzhObjQzWGQ1Yz0=', 'Nelson Newton', 'Newton', 'nelson.srishti@gmail.com', 'AG5DUS55', 2, '8888888888', '+972', 3, '', 'ERUf3F18KB.png', 'social', 'google', '102772458615687364779', '2018-10-04 13:37:21', '2018-10-04 14:37:21', 'cbb9cd0bfe548b4462c02fd4276c67f65b3d884eb8106e6b91c1a26323605080', '1.0', 'iOS', 'cbb9cd0bfe548b4462c02fd4276c67f65b3d884eb8106e6b91c1a26323605080', NULL, 5, 'ACTIVE', NULL),
(69, 'L2E3by92dXo5VWJydnBBenQzSlVqU1lEYzNmb09iU1RtbnlRcmdnT2wrWT0=', 'King', 'Evbogbai ', 'Captaincookmedia@gmail.com', '123456', 1, '8134540222', '+234', 3, '', '.png', 'email', '', '', '2018-10-05 09:22:29', '2018-10-09 14:22:08', '00c2e6bb8cd611a15f53095ce016be4d049930174f7faf255cd646230a02877a', '1.2', 'iOS', '00c2e6bb8cd611a15f53095ce016be4d049930174f7faf255cd646230a02877a', NULL, 5, 'ACTIVE', NULL),
(70, 'UFEvd1FyWHg4R0c4R2tMZG9ORFdrTnd2bHlmcnFZbjAvQVZuTC9UVi9HND0=', 'student ', 'student ', 'student@email.com', 'student ', 2, '888888888', '+234', 3, '', '.png', 'email', '', '', '2018-10-05 10:14:29', '2018-10-05 11:14:29', '87a887566e0868abe0bf4ddee70b10682d29062265efab8e7ab1847d73f4c38c', '1.2', 'iOS', '87a887566e0868abe0bf4ddee70b10682d29062265efab8e7ab1847d73f4c38c', NULL, 5, 'ACTIVE', NULL),
(71, 'TlJENlArbmc3Z0JKZ3BpOWd6RTdkZWNkbU1QeGxEdHREbE5OWjhxb2I0dz0=', 'Dharani', 'Kottinti', 'dharu477.dkr@gmail.com', 'Msdindia1@.', 3, '8886173456', '+91', 3, '', '.png', 'email', '', '', '2018-10-09 04:09:25', '2018-10-09 05:09:25', '', '2.0', 'android', '', NULL, 5, 'ACTIVE', NULL),
(72, 'TlJENlArbmc3Z0JKZ3BpOWd6RTdkWTUrTlBJaFc2RnY3MkJmS2tCN1VGVT0=', 'Felix Awolola', 'Awolola', 'fawololaa@gmail.com', '56W2GOOI', 1, '8161819719', '+234', 6, '', '0I34O1PRfH.png', 'social', 'google', '116258219492877411571', '2018-10-09 13:26:43', '2018-10-09 14:26:43', 'f735da5253e1eee9bfb1b4a868dc0a0fca4c0d7c358f665670af497887f0f831', '1.2', 'iOS', 'f735da5253e1eee9bfb1b4a868dc0a0fca4c0d7c358f665670af497887f0f831', NULL, 5, 'ACTIVE', NULL),
(73, 'UWdPYTZpcDJmM09oYmx3Q0tiVVFmeTZQWlhjamRVZk5ack1UU01Bd0xOND0=', 'Dipo', 'Adekanbi', 'd@gmail.com', 'Deepsea_1', 1, '8181122520', '+234', 3, '', '.png', 'email', '', '', '2018-10-09 13:40:05', '2018-10-15 13:05:22', 'd1qOCA3JC4o:APA91bH99QOE5HfGfXqp0wlqPaRw7RsDsRIqHsivPKDDJ-1RAup6hv7Foo9h_lKuD7uSYim_wgL6Wipm-XXciM1lwIcdXGEW0OrLkHyoOUhcQn0u7d1GgJcYIYwt8t_lDIQ-sLgf-TOq', '2.0', 'android', 'd1qOCA3JC4o:APA91bH99QOE5HfGfXqp0wlqPaRw7RsDsRIqHsivPKDDJ-1RAup6hv7Foo9h_lKuD7uSYim_wgL6Wipm-XXciM1lwIcdXGEW0OrLkHyoOUhcQn0u7d1GgJcYIYwt8t_lDIQ-sLgf-TOq', NULL, 5, 'ACTIVE', NULL),
(74, 'TlJENlArbmc3Z0JKZ3BpOWd6RTdkWEZiWnZFQzZzT1ZCWXVMVVkza0k5UT0=', 'John Teslie', '', 'flyflyerson4@gmail.com', 'ZQApLdJL', 2, '4084066195', '+1', 3, '', 'YPHHyPuaNj.png', 'social', 'facebook', '904815319714572', '2018-10-09 21:33:14', '2018-10-09 22:33:14', '38ecbb77be3cad712f887b9918ae1858ca903f42bb36c5b6b524f206e67cf860', '1.2', 'iOS', '38ecbb77be3cad712f887b9918ae1858ca903f42bb36c5b6b524f206e67cf860', NULL, 5, 'ACTIVE', NULL),
(75, 'VHZYRnlSQUtQMkdwSVZDVTZyb0h5VkRvUjFDVEtBUE4za1VLWWVWdGlDYz0=', 'Chinedu', 'Ofor', 'c@g.com', 'cccccc', 2, '07030296746', '+234', 3, '', '.png', 'email', '', '', '2018-10-12 19:51:38', '2018-10-12 20:51:38', 'fksDzJ8t7J8:APA91bFxRj0HjwpnyfOzCDn9Axu0KcE3QISRMzYESAVb8faDkAghNluKtMVoL1D8Fs5PSK0sYzdHMBAjJGOJmvoPNpYbKjiL-6a8f71tcwB_cm52jQg4C_-DAOPwuVPGyg8YNr_EKXAN', '2.0', 'android', 'fksDzJ8t7J8:APA91bFxRj0HjwpnyfOzCDn9Axu0KcE3QISRMzYESAVb8faDkAghNluKtMVoL1D8Fs5PSK0sYzdHMBAjJGOJmvoPNpYbKjiL-6a8f71tcwB_cm52jQg4C_-DAOPwuVPGyg8YNr_EKXAN', NULL, 5, 'ACTIVE', NULL),
(76, 'UklFMk9HYXpUMDR6MHVVQmFkRWdKcWxwMzlUMElRV3k5YlpRbWZQeG9BMD0=', 'Dbanj', '2face', 'evbogbai08@gmail.com', 'JP62yn5s', 1, '8134540222', '+234', 4, 'male', 'male.png', 'email', 'email', 'email', '2018-10-13 13:36:43', '2019-03-01 16:56:11', 'fO_AF5iLRo8:APA91bGlYUkTJexzS3g0Nwzf7RPm5IunOkJn8Zl2GJU1n44NcJN3BlP1WmJxYHNA6dgEDUpsZ1qmZ40UxZSz4n1KosHV80CYc666q6P_3IYvb3mS2GFWA4LHmF5MGC2-8CKbghCuPz7N', '2.0', 'android', 'fO_AF5iLRo8:APA91bGlYUkTJexzS3g0Nwzf7RPm5IunOkJn8Zl2GJU1n44NcJN3BlP1WmJxYHNA6dgEDUpsZ1qmZ40UxZSz4n1KosHV80CYc666q6P_3IYvb3mS2GFWA4LHmF5MGC2-8CKbghCuPz7N', NULL, 5, 'ACTIVE', NULL),
(77, 'RCtjYmR4VGlIWng5WkFwRG1JU2xXdUVBZ2tDZ0dwMHRSc2V2RVV5b1Rudz0=', 'Onyekachi', 'Ezekiel', 'ezeokeonyekachi@gmail.com', 'samuel', 3, '898888865', '+1', 4, 'male', 'd68a385a9b39a955.jpeg', 'email', '', '', '2018-10-14 17:57:27', '2018-10-14 18:57:27', '', '1.2', 'iOS', '', NULL, 5, 'ACTIVE', NULL),
(78, 'VDg4MUF3VmZKTmFGbVZvTkh3RituWkh6ZjY3WjI5c2UzUHZXK2FmMjI1Zz0=', 'Lois', 'Tarikabor', 'loisibiene@gmail.com', 'Girl12ish', 3, '9030531196', '+234', 3, '', '.png', 'email', '', '', '2018-10-20 07:57:34', '2018-10-20 08:57:34', 'f2488d729ec6c2b40a578afff5b61b5d13d5e92b90ce5ea0586cd926e0a1f1ba', '1.2', 'iOS', 'f2488d729ec6c2b40a578afff5b61b5d13d5e92b90ce5ea0586cd926e0a1f1ba', NULL, 5, 'ACTIVE', NULL),
(79, 'MUhlMFlhTVNXeGxQWHYzaVNmQmZrSXYzd2x5MVI4d2gzaHNPeGVKZGozbz0=', 'Ratan Keshwani', '', 'dr.ratankeshwani@rediffmail.com', 'FRxZgCMk', 1, '9329487849', '+91', 6, '', '.png', 'social', 'facebook', '1498189700318037', '2018-10-21 13:11:07', '2018-10-21 14:11:07', 'ftd9oZR7AK8:APA91bE7f4hBDfjHt9CKCMDjcjZqAtTWFGB9P1AAfETPLnitlTaXqLRCQ15GVR2zr6-hc6-82Wg0mpvqLF84a1_umvoap72XzjfteI0cCeMeaxuhs_yVKf_lKUBRAhziiflwPPDkKgvp', '2.0', 'android', 'ftd9oZR7AK8:APA91bE7f4hBDfjHt9CKCMDjcjZqAtTWFGB9P1AAfETPLnitlTaXqLRCQ15GVR2zr6-hc6-82Wg0mpvqLF84a1_umvoap72XzjfteI0cCeMeaxuhs_yVKf_lKUBRAhziiflwPPDkKgvp', NULL, 5, 'ACTIVE', NULL),
(80, 'Y3liTVc1bXE5NTBDN1UrWllDRDhyMVNuNm1xenVZa21KKzBkQ0I0SXpLcz0=', 'Ch Misbah Jutt', 'Misbah', 'Pakistaniiam79@gmail.com', '03127489162', 1, '03127489162', '+92', 3, '', '.png', 'email', '', '', '2018-10-27 18:05:37', '2018-10-27 19:05:37', '', '2.0', 'android', '', NULL, 5, 'ACTIVE', NULL),
(81, 'Y3liTVc1bXE5NTBDN1UrWllDRDhyNEpidnJqaDRqS25Da0lyU05CcEdvUT0=', 'Ch Misbah Jutt', 'Misbah', 'alinetcafe3001@gmail.com', '8Ksp9og5', 1, '3127489162', '+92', 3, '', '.png', 'email', '', '', '2018-10-27 18:07:09', '2018-10-28 03:38:38', '', '2.0', 'android', '', NULL, 5, 'ACTIVE', NULL),
(82, 'eWVyZXBsMzN3ZlZZSTJnWFBIdkxsZVRndTZDLzVhOE9Gb1QzQnVUbG4rQT0=', 'Carmela Vingle', '', 'carmelavingle@gmail.com', '2N74Ym7n', 1, '+17402152634', '+1', 3, '', '.png', 'social', 'google', '100053983410779887818', '2018-11-05 06:31:28', '2018-11-05 07:38:53', 'dsTNb8Z_srQ:APA91bH8GeJN2Y3bjuE5BWBtydfuWR2PJuLGUXz3JU6OOZ6dcFiNW1ibzyYRwQ31xvinpkD-y4AsTrBGIX9b7BmgilZy0s6_DIJn0WQcp5T-4qazkq5Ni3W22dSM0GxK0BSzzTVgycCc', '2.0', 'android', 'dsTNb8Z_srQ:APA91bH8GeJN2Y3bjuE5BWBtydfuWR2PJuLGUXz3JU6OOZ6dcFiNW1ibzyYRwQ31xvinpkD-y4AsTrBGIX9b7BmgilZy0s6_DIJn0WQcp5T-4qazkq5Ni3W22dSM0GxK0BSzzTVgycCc', NULL, 5, 'ACTIVE', NULL),
(83, '7fbcca24990b8d7e0b871a128f688ca6c1f45374c4f6a05218f5057a9c8d054b', 'Chinedu', 'Ofor', 'chinedu@symple.tech', '666666', NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, '2018-11-05 08:11:13', '2019-03-02 16:15:47', NULL, NULL, NULL, NULL, NULL, 1, 'ACTIVE', ''),
(85, 'M0FYT0I5SVl4VFhoOGFJdmlwbzcvSGVkYzBrQzZTdVhTQjltamp1SC9Hcz0=', 'Tarik', 'Demir', 'ahmet_duz_58@hotmail.com', 'ahse5883', 1, '5321521258', '+90', 3, '', '.png', 'email', '', '', '2018-11-05 14:55:42', '2018-11-05 15:55:42', 'db0ISDX2T3g:APA91bFCz3lhMd9iZGWvxZlbZgxsQWHTEjjmC3T5m8ZJN8Cc1lacZNwnG-rrxLfLa0yURPfYqJsLYwwKsaLdSU38cu9MCMLzJ_mQP_ukZv8FYrrEtePl9l30iJg_B6v7zRwQGDaQfUCl', '2.0', 'android', 'db0ISDX2T3g:APA91bFCz3lhMd9iZGWvxZlbZgxsQWHTEjjmC3T5m8ZJN8Cc1lacZNwnG-rrxLfLa0yURPfYqJsLYwwKsaLdSU38cu9MCMLzJ_mQP_ukZv8FYrrEtePl9l30iJg_B6v7zRwQGDaQfUCl', NULL, 5, 'ACTIVE', NULL),
(86, 'M3pqOVMrSEdPQ3NQeXpDcmJraXhISFNmMWx4YTlRdG02M2hzSXVKbVRuOD0=', 'Mhd', 'Zafran', 'humeranawaz1@gmail.com', '1234567', 1, '03206686824', '+92', 3, '', '.png', 'email', '', '', '2018-11-08 05:52:46', '2018-11-08 06:53:41', 'e_HUPPzingg:APA91bEIaTW-EOo-xjeexLKPvDPHYi4AB1PMJNGOV-URMoZiXjPfMFUVw6BhfptJOsy9YLG_SwAYLFCvU64rgoEl4s77NdcWM-4EJiBda-PQOcgXU2TZ3eWoWzOPAs-Z-3XWRC_5VYQV', '2.0', 'android', 'e_HUPPzingg:APA91bEIaTW-EOo-xjeexLKPvDPHYi4AB1PMJNGOV-URMoZiXjPfMFUVw6BhfptJOsy9YLG_SwAYLFCvU64rgoEl4s77NdcWM-4EJiBda-PQOcgXU2TZ3eWoWzOPAs-Z-3XWRC_5VYQV', NULL, 5, 'ACTIVE', NULL),
(87, 'd2015a157e9721abd4b7489b2472d772fef2602fd7c19aef0fe81a1f6f706dfb', 'Seun', 'Owonikoko', 'seun@symple.tech', 'canxcbnlgm', NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, '2018-11-08 18:16:34', '2019-01-09 14:39:41', NULL, NULL, NULL, NULL, NULL, 1, 'ACTIVE', NULL),
(88, '53769f47114d19aed9efaf8ad3ad13eb8b8a9f9592acda5e88537b5c1031fc1b', 'dipo', 'dipo', 'deepsea', 'gxzliblcbg', 2, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, '2018-11-08 18:35:07', '2018-11-08 19:41:33', NULL, NULL, NULL, NULL, NULL, 2, 'ACTIVE', NULL),
(89, NULL, 'Dipo ', 'Goat', 'goatdip', '5be48b388d43e_7877', 4, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, '2018-11-08 18:38:40', '2018-11-08 20:15:04', NULL, NULL, NULL, NULL, NULL, 6, 'DEACTIVATED', 'dncnfijkfh'),
(90, NULL, 'sdsds', 'sdsdsd', 'sdsdsds', NULL, 4, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, '2018-11-08 18:43:02', '2018-11-08 19:43:02', NULL, NULL, NULL, NULL, NULL, 4, 'ACTIVE', NULL),
(91, 'Mk1iS0c2cnA3UWY5RWNDdlFMSmRsZE9sUGxPdzlrNk91dEdEbCtuR2V2Zz0=', 'c', 'c', 'c@w.com', 'ddodeegilm', 4, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, '2018-11-08 19:16:32', '2018-11-08 20:23:12', 'd8_16AiBX30:APA91bEiHXzgSahgqYr4jo2QzaNIxCnCH5MVazAo0-UYOmJgDk_ZLGoibcLcV3t476sxh1FFwGCaxsBdBBS40OMyoHOIAViUi-xflCiG-6kk-T_iGf8j0EohbATiQC_I11mD7Ttwyq7B', '2.0', 'android', 'd8_16AiBX30:APA91bEiHXzgSahgqYr4jo2QzaNIxCnCH5MVazAo0-UYOmJgDk_ZLGoibcLcV3t476sxh1FFwGCaxsBdBBS40OMyoHOIAViUi-xflCiG-6kk-T_iGf8j0EohbATiQC_I11mD7Ttwyq7B', NULL, 5, 'ACTIVE', ''),
(92, '023087453ea0a4fb0c56269808247e255890fc0a4d4ec0bc7586c41b05e6e456', 'Seun', 'maranatha', 's@m.com', 'oxdlkyiogj', 1, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, '2018-11-08 19:24:08', '2018-11-08 20:24:50', NULL, NULL, NULL, NULL, NULL, 2, 'ACTIVE', NULL),
(93, 'WEZsbmtrdmlKdEVISGs3bzB0UWRpcGpPcHhTUTNBMDRCWEVKOUw1NkFMbz0=', 'c', 'c@q.com', 'c@q.com', '5be48e8d8f8cb_7636', 1, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, '2018-11-08 19:26:58', '2018-11-08 20:29:17', 'd8_16AiBX30:APA91bEiHXzgSahgqYr4jo2QzaNIxCnCH5MVazAo0-UYOmJgDk_ZLGoibcLcV3t476sxh1FFwGCaxsBdBBS40OMyoHOIAViUi-xflCiG-6kk-T_iGf8j0EohbATiQC_I11mD7Ttwyq7B', '2.0', 'android', 'd8_16AiBX30:APA91bEiHXzgSahgqYr4jo2QzaNIxCnCH5MVazAo0-UYOmJgDk_ZLGoibcLcV3t476sxh1FFwGCaxsBdBBS40OMyoHOIAViUi-xflCiG-6kk-T_iGf8j0EohbATiQC_I11mD7Ttwyq7B', NULL, 5, 'DEACTIVATED', 'blnpffjnhx'),
(94, 'bEVjOVZVQWVoMHNlY0YvZnBTZlUxWjFycks5MUw5cmV2bkg1dW5ZSUx1bz0=', 'Chinedu', 'Ofor', 'c@xx.com', 'cccccc', 1, '07030296745', '+234', 4, 'female', 'female.png', 'email', 'email', 'email', '2018-11-08 19:40:23', '2018-11-08 20:41:36', 'dQEOm1Ptw7w:APA91bGibDC1NctgwCSv4CPbst4AfKk4I7U0SRAaIyXoUwU7gDhrRLXOOiVHn1vuR2y7XMKDSYigvXC7csRM143NAiwxQwHYQ7ZTcDOejf2yKnQXtiNY9LI3cArgaj3J1hlqr2VIazYA', '1.02', 'android', 'dQEOm1Ptw7w:APA91bGibDC1NctgwCSv4CPbst4AfKk4I7U0SRAaIyXoUwU7gDhrRLXOOiVHn1vuR2y7XMKDSYigvXC7csRM143NAiwxQwHYQ7ZTcDOejf2yKnQXtiNY9LI3cArgaj3J1hlqr2VIazYA', NULL, 5, 'ACTIVE', NULL),
(95, 'OVlyVmNwVHNNY1pBdEVkNmdsYnZCeGorM2VqNm4veFNiRVpGRWt6OU5YZz0=', 'Moov Moov', '', 'moov.helpdesk@gmail.com', 'zFf4SEAM', 1, '07030296475', '+234', 3, '', '.png', 'social', 'google', '104144265820584969429', '2018-11-08 19:45:22', '2018-11-08 20:45:22', 'fF6eyUh22bI:APA91bGHU9f2Akj287_2QwxrlWiozhySCYKqVwvP3h63oTqg2XdbScYp7aKFGxbWbVydTC5APWAHpZiXzeN_PH3kggqK7E-KVjLvICcydz1ioqE3hU6Mf-4HOMwc01W-lCL8ZQMr-Sd3', '2.0', 'android', 'fF6eyUh22bI:APA91bGHU9f2Akj287_2QwxrlWiozhySCYKqVwvP3h63oTqg2XdbScYp7aKFGxbWbVydTC5APWAHpZiXzeN_PH3kggqK7E-KVjLvICcydz1ioqE3hU6Mf-4HOMwc01W-lCL8ZQMr-Sd3', NULL, 5, 'ACTIVE', NULL),
(97, 'ZENLd2JTbkliL0pPNDZRbkJWc25sSERFV1ZrR1hGZUZRRi9Uclgra3luMD0=', 'c', 'c', 'c@qp.com', 'dafbknjand', 1, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, '2018-11-08 19:46:37', '2018-11-08 20:47:08', 'd8_16AiBX30:APA91bEiHXzgSahgqYr4jo2QzaNIxCnCH5MVazAo0-UYOmJgDk_ZLGoibcLcV3t476sxh1FFwGCaxsBdBBS40OMyoHOIAViUi-xflCiG-6kk-T_iGf8j0EohbATiQC_I11mD7Ttwyq7B', '2.0', 'android', 'd8_16AiBX30:APA91bEiHXzgSahgqYr4jo2QzaNIxCnCH5MVazAo0-UYOmJgDk_ZLGoibcLcV3t476sxh1FFwGCaxsBdBBS40OMyoHOIAViUi-xflCiG-6kk-T_iGf8j0EohbATiQC_I11mD7Ttwyq7B', NULL, 5, 'ACTIVE', NULL),
(98, 'RUVPRTViUkh5R1VLZ3pwYk1vVWNoYlU4dlZheS8wQ0JKMVlRZ3FiU2ZBcz0=', 'Ahmad Nasser', '', 'nourmuradd@gmail.com', 'g8ZTeHlH', 3, '5530509850', '+90', 6, '', '.png', 'social', 'facebook', '1220927858058666', '2018-11-09 14:03:18', '2018-11-09 15:03:18', 'cemkmD29cJ8:APA91bGEfP6c8hvOP8a-CwSbsZvnPLV6mSkHDBpyuhndbU2LpvbDJl4Hn8VnWNXDB-XJ38ukyzpHVvrkZALqJXUTqXBOeUNVr3xc5n8mQYTogd3lXbJUN3yjEjFD3vlJsr1AOByF3uVo', '2.0', 'android', 'cemkmD29cJ8:APA91bGEfP6c8hvOP8a-CwSbsZvnPLV6mSkHDBpyuhndbU2LpvbDJl4Hn8VnWNXDB-XJ38ukyzpHVvrkZALqJXUTqXBOeUNVr3xc5n8mQYTogd3lXbJUN3yjEjFD3vlJsr1AOByF3uVo', NULL, 5, 'ACTIVE', NULL),
(99, 'S2pHRE1OQlZFRWZucjRjcTF3UldwOTlzbnNrWkszeWE1WnBucXZRQU1GUT0=', 'Ahmad Nasser', 'NASSER', 'noonename23@gmail.com', '5502084abir', 1, '5530509850', '+90', 3, '', '.png', 'social', 'facebook', '1220927858058666', '2018-11-09 14:04:19', '2018-11-09 15:04:36', 'cemkmD29cJ8:APA91bGEfP6c8hvOP8a-CwSbsZvnPLV6mSkHDBpyuhndbU2LpvbDJl4Hn8VnWNXDB-XJ38ukyzpHVvrkZALqJXUTqXBOeUNVr3xc5n8mQYTogd3lXbJUN3yjEjFD3vlJsr1AOByF3uVo', '2.0', 'android', 'cemkmD29cJ8:APA91bGEfP6c8hvOP8a-CwSbsZvnPLV6mSkHDBpyuhndbU2LpvbDJl4Hn8VnWNXDB-XJ38ukyzpHVvrkZALqJXUTqXBOeUNVr3xc5n8mQYTogd3lXbJUN3yjEjFD3vlJsr1AOByF3uVo', NULL, 5, 'ACTIVE', NULL),
(100, 'aGhpRkR5aHgxVTMyZ0ZOSzNCcjdxUklyWFRkK2dReWlGUnprV0VTZlRNVT0=', 'Taiwo', 'Adedotun', 'adedotun.taiwo.a@gmail.com', '123456', 1, '7064248915', '+234', 3, '', '.png', 'email', '', '', '2018-11-12 17:37:59', '2018-11-12 18:40:48', 'cd0a37d73697ac57a80d5610b4e1eb2441004f76687d3267181668494c327e1f', '1.2', 'iOS', 'cd0a37d73697ac57a80d5610b4e1eb2441004f76687d3267181668494c327e1f', NULL, 5, 'ACTIVE', NULL),
(101, 'OExJak9pRjBHR05YcDZRNU01TnpuNlFpYVlra2Z6cndITnFlU2lSTkdNND0=', 'hello', 'world', 'hello@world.com', '123456', 1, '54546', '+1', 3, '', '.png', 'email', '', '', '2018-11-13 02:25:31', '2018-11-13 03:25:31', '7db898984291fc79d9a5ba75676f01ba4fe5cc454b24f7edcdd5cc8db49ea201', '1.2', 'iOS', '7db898984291fc79d9a5ba75676f01ba4fe5cc454b24f7edcdd5cc8db49ea201', NULL, 5, 'ACTIVE', NULL),
(102, 'ODZSZ0h1TWp5M1NPUThSUWttalhIVjBkMEwvM3F5RGYxTHZ4Rm80R0QwQT0=', 'mike', 'testing', 'miek343@gmail.com', '47food47', 2, '5565259529', '+1', 5, '', '.png', 'email', '', '', '2018-11-15 20:44:58', '2018-11-15 21:44:58', '669c0c5ce02226678b56512fde15e7d7c1b8ff7cefc674ba4c8cfff1a7735f0e', '1.2', 'iOS', '669c0c5ce02226678b56512fde15e7d7c1b8ff7cefc674ba4c8cfff1a7735f0e', NULL, 5, 'ACTIVE', NULL),
(103, 'ODZSZ0h1TWp5M1NPUThSUWttalhIV3ViYjl6NVdyK3o4R0lQNVdlYUkwZz0=', 'mike', 'testing', 'miek343xfk@gmail.com', '47food47', 1, '221224255', '+1', 3, '', '.png', 'email', '', '', '2018-11-15 20:45:33', '2018-11-15 21:45:33', '669c0c5ce02226678b56512fde15e7d7c1b8ff7cefc674ba4c8cfff1a7735f0e', '1.2', 'iOS', '669c0c5ce02226678b56512fde15e7d7c1b8ff7cefc674ba4c8cfff1a7735f0e', NULL, 5, 'ACTIVE', NULL),
(104, 'ODZSZ0h1TWp5M1NPUThSUWttalhIZjBjTVNKUDZNclVVSzArRGNublFkQT0=', 'Kebin Errrf', 'Errrf', 'windscribe147@gmail.com', '2Oq6RRkP', 1, '8321225236', '+1', 5, '', '0OL7rRHuZn.png', 'social', 'google', '103829742586297299927', '2018-11-15 20:46:19', '2018-11-15 21:46:19', '669c0c5ce02226678b56512fde15e7d7c1b8ff7cefc674ba4c8cfff1a7735f0e', '1.2', 'iOS', '669c0c5ce02226678b56512fde15e7d7c1b8ff7cefc674ba4c8cfff1a7735f0e', NULL, 5, 'ACTIVE', NULL),
(105, 'eUJ6ajZydG94RnA5N05adGZISE9oWEJrbVVLRDA3YlR5eENMSFVtSzZIZz0=', 'banana sawika', '', 'sawika360@gmail.com', 'JDDnhtLK', 1, '0866872867', '+66', 3, '', '.png', 'social', 'google', '101086649903215596574', '2018-11-18 11:35:14', '2018-11-18 12:35:14', 'eA-_CCwf0Ao:APA91bEhVYPOcU2RKooebPyfRNiCxP7EwF1qTDgZ52o5loz7GNlRm1V7TpEps28sskQt9whtXDQ7M0YiUkrWW_0almWPjuIJHtPQUlwXXMauD_Jlq_qgaHP8-hAenb_fSPudqHjfym3m', '2.0', 'android', 'eA-_CCwf0Ao:APA91bEhVYPOcU2RKooebPyfRNiCxP7EwF1qTDgZ52o5loz7GNlRm1V7TpEps28sskQt9whtXDQ7M0YiUkrWW_0almWPjuIJHtPQUlwXXMauD_Jlq_qgaHP8-hAenb_fSPudqHjfym3m', NULL, 5, 'ACTIVE', NULL),
(106, 'eUJ6ajZydG94RnA5N05adGZISE9oZUJRcGtqSFpuZnFkYjE0emVFTkVHbz0=', 'saree khunram', '', 'sareekhunram1950@gmail.com', 'xFrJDHUc', 1, '0866872867', '+66', 3, '', '.png', 'social', 'google', '100963294422625234626', '2018-11-18 11:38:07', '2018-11-18 12:38:07', 'eA-_CCwf0Ao:APA91bEhVYPOcU2RKooebPyfRNiCxP7EwF1qTDgZ52o5loz7GNlRm1V7TpEps28sskQt9whtXDQ7M0YiUkrWW_0almWPjuIJHtPQUlwXXMauD_Jlq_qgaHP8-hAenb_fSPudqHjfym3m', '2.0', 'android', 'eA-_CCwf0Ao:APA91bEhVYPOcU2RKooebPyfRNiCxP7EwF1qTDgZ52o5loz7GNlRm1V7TpEps28sskQt9whtXDQ7M0YiUkrWW_0almWPjuIJHtPQUlwXXMauD_Jlq_qgaHP8-hAenb_fSPudqHjfym3m', NULL, 5, 'ACTIVE', NULL),
(107, 'eUJ6ajZydG94RnA5N05adGZISE9oVlhsL01jZ3hxWmRsYWhYazVTZTNHaz0=', 'saree khunram', 'Me Saree', 'banana.sawika@gmail.com', '43610040', 1, '0866872867', '+66', 3, '', '.png', 'social', 'google', '100963294422625234626', '2018-11-18 11:42:43', '2018-11-18 12:42:43', 'eA-_CCwf0Ao:APA91bEhVYPOcU2RKooebPyfRNiCxP7EwF1qTDgZ52o5loz7GNlRm1V7TpEps28sskQt9whtXDQ7M0YiUkrWW_0almWPjuIJHtPQUlwXXMauD_Jlq_qgaHP8-hAenb_fSPudqHjfym3m', '2.0', 'android', 'eA-_CCwf0Ao:APA91bEhVYPOcU2RKooebPyfRNiCxP7EwF1qTDgZ52o5loz7GNlRm1V7TpEps28sskQt9whtXDQ7M0YiUkrWW_0almWPjuIJHtPQUlwXXMauD_Jlq_qgaHP8-hAenb_fSPudqHjfym3m', NULL, 5, 'ACTIVE', NULL),
(108, 'ckMxRGpxUVlLRlZRRm9GMHZud0U3eWxNcHRiV242U25PMWdNcXJUT3FUYz0=', 'Okan Ürkü', '', 'okanrex@gmail.com', 'D3HR79W0', 1, '5522807580', '+90', 3, '', '.png', 'social', 'facebook', '1931623016921156', '2018-11-22 19:15:40', '2018-11-22 20:15:40', 'dJjNUkWhHhs:APA91bGJKSZymGRL7t5qa0aq2f8t1bh-Wnnk72SLzPgU8-mLKgo_bgHHF5MuoTqlzXL8tJZTNrDH8YyQjzJL1JpDc28DwgJkQlug8Qr-Kd7igNE13KvZSkuXvhA34U_58F0X8Q28Y5nn', '2.0', 'android', 'dJjNUkWhHhs:APA91bGJKSZymGRL7t5qa0aq2f8t1bh-Wnnk72SLzPgU8-mLKgo_bgHHF5MuoTqlzXL8tJZTNrDH8YyQjzJL1JpDc28DwgJkQlug8Qr-Kd7igNE13KvZSkuXvhA34U_58F0X8Q28Y5nn', NULL, 5, 'ACTIVE', NULL),
(109, 'MVlSV2dqaTZWcElOQ0NzeHNtVFZONnhUUzhGbEo5T3JwVm5Mc2NzWS9NZz0=', 'Arian', 'Esmaeili', 'arian.esf@iran.ir', 'UjKYeNhz', 1, '9113456860', '+98', 3, '', '.png', 'email', '', '', '2018-11-23 20:44:54', '2018-11-23 21:46:40', '', '2.0', 'android', '', NULL, 5, 'ACTIVE', NULL),
(110, 'YWxidnNob0MvYUYxdkp5ZE51dGxoMk1xS3lNbkk3MHRnR09BZG8xaUpoMD0=', 'ali asghar', '', 'aliasghar7979@gmail.com', 'Mf2mBilF', 1, '03067006343', '+92', 3, '', '.png', 'social', 'google', '108421779720232894328', '2018-11-28 17:21:40', '2018-11-28 18:21:40', '', '2.0', 'android', '', NULL, 5, 'ACTIVE', NULL),
(111, 'YWxidnNob0MvYUYxdkp5ZE51dGxoenZYS2R4ZWlFMnF6bWVLcDZvRUVRMD0=', 'Ali', 'Ali Asghar', 'aliasghar528@yahoo.com', '03067006343', 1, '03067006343', '+92', 3, '', '.png', 'email', '', '', '2018-11-28 17:33:08', '2018-11-28 18:33:08', 'eaeor93YJLI:APA91bGhOxq9NnIP5THzUeT7LaRgMXVOkgYT4sTwJdVOJBZ6lpbKwwTYUMYEuaQdkd5tLPtRNGwdvDhcUJt3IBX40nN1KXxTbLLChobmzSjQ7hVdsP8nBFHlP0alEyNDNgDi-8k-v7L4', '2.0', 'android', 'eaeor93YJLI:APA91bGhOxq9NnIP5THzUeT7LaRgMXVOkgYT4sTwJdVOJBZ6lpbKwwTYUMYEuaQdkd5tLPtRNGwdvDhcUJt3IBX40nN1KXxTbLLChobmzSjQ7hVdsP8nBFHlP0alEyNDNgDi-8k-v7L4', NULL, 5, 'ACTIVE', NULL),
(112, 'STF2c2dkZFJHa3NVODJtR0trdVNFRTBuWVR1TDZ1RzNoYS9lY2JuOTNBUT0=', 'Adigun Olalekan', '', 'adigunhammed.lekan@gmail.com', 'ddQL9BqY', 4, '7035452307', '+234', 3, '', '.png', 'social', 'google', '105203786202618295947', '2018-11-30 17:58:35', '2018-11-30 18:58:35', 'cz9D6H8rtPE:APA91bGnG4AVtpcvCVXE6xsT7x_GYyw68DH2y0xjsX9UC9_QSqEO_ivKNPtZ4_qXgMDoQypUdDh2rRgT7LnyQU8G5N6GJy380Md3GI4PWKyVSk5y57Zus49_C_YctxLMrxTX1iAXphWX', '2.0', 'android', 'cz9D6H8rtPE:APA91bGnG4AVtpcvCVXE6xsT7x_GYyw68DH2y0xjsX9UC9_QSqEO_ivKNPtZ4_qXgMDoQypUdDh2rRgT7LnyQU8G5N6GJy380Md3GI4PWKyVSk5y57Zus49_C_YctxLMrxTX1iAXphWX', NULL, 5, 'ACTIVE', NULL),
(113, 'Z1JKOTR2VEd5d2lRV3VWaXJFV21uN0luNStHTVRtWUJYMHdnRGZtNmdRaz0=', 'Adigun Olalekan', 'Adigun', 'adigunadunfe@gmail.com', '35452307AA', 4, '7035452307', '+234', 3, '', '.png', 'social', 'google', '105203786202618295947', '2018-11-30 17:59:31', '2018-11-30 22:45:54', '', '2.0', 'android', '', NULL, 5, 'ACTIVE', NULL),
(114, 'eE5Bd2Q1TFVlNGlHT2grdEpsNGwxZEtLbXN3YzJhdXdodmFBWFJJZXZOWT0=', 'Chinedu', 'Ofor', 'o@c.com', 'Badada11', 1, '07030296746', '+234', 3, '', '.png', 'email', '', '', '2018-11-30 18:15:20', '2018-11-30 19:15:20', '', '2.0', 'android', '', NULL, 5, 'ACTIVE', NULL),
(115, 'aDFIV2Y3MC9Eam4vYTY0aTVVYWlDNjZibGFsVE42RzRibzNGdVRiSExDOD0=', 'Chinedu', 'Ofor', 'c@gg.com', 'bbbbbb', 1, '07030296746', '+234', 3, '', '.png', 'email', '', '', '2018-11-30 18:19:15', '2018-12-10 15:21:29', '', '1.2', 'iOS', '', NULL, 5, 'ACTIVE', NULL),
(116, 'MHY5SmppVkdXMzlTV2llZ0tXTmRWc3ZRelRQRGVSUGVkQzVyN3Z3dCtMaz0=', 'Samuel', 'Abudu', 'abudusamuelbiodun@gmail', 'leumas001', 2, '7067509850', '+234', 3, '', '.png', 'email', '', '', '2018-11-30 23:22:03', '2018-12-01 00:22:58', 'dKK8MpmRu_U:APA91bHinWGnh6DBkjfDH8FEF2Pj_DqGcIaiqyEHTuaWuQDPYC0368MU5zptrr6cLUAwsWorTS3MHLVDjGhVv-nkjYDY_8WBFWaTLXC1kpA9280fE8tt1BNKKMmZiIBXOwHY73jz4NvC', '2.0', 'android', 'dKK8MpmRu_U:APA91bHinWGnh6DBkjfDH8FEF2Pj_DqGcIaiqyEHTuaWuQDPYC0368MU5zptrr6cLUAwsWorTS3MHLVDjGhVv-nkjYDY_8WBFWaTLXC1kpA9280fE8tt1BNKKMmZiIBXOwHY73jz4NvC', NULL, 5, 'ACTIVE', NULL),
(117, 'RHpJOTFzdjdkbm9vRVZ1K2txRXp4cG93R09iTmJDOGFCWkxHcEhKSDhOOD0=', 'Samuel', 'Abudu', 'abudusamuelbiodun@gmail.com', 'rosebug001', 1, '7067509850', '+234', 3, '', '.png', 'email', '', '', '2018-12-01 14:36:57', '2018-12-01 15:36:57', 'eZwcnmFCkek:APA91bE2wxjDug7zMbGBpUWi5AVcKbEjLtIE7gWmix_wZbw53mfWW9cqN9dVvNzwWCTlhjtLSJe0yoIVcEP7Zx6WmekLNzfxA5V5jmprTclDINZ2pV-fIHlpZgJS4_8KSibdMO8ll7fw', '2.0', 'android', 'eZwcnmFCkek:APA91bE2wxjDug7zMbGBpUWi5AVcKbEjLtIE7gWmix_wZbw53mfWW9cqN9dVvNzwWCTlhjtLSJe0yoIVcEP7Zx6WmekLNzfxA5V5jmprTclDINZ2pV-fIHlpZgJS4_8KSibdMO8ll7fw', NULL, 5, 'ACTIVE', NULL),
(118, 'NDFCdmViY3Q2LzhGL09reDFxZmhaUVk5d1pVem9ZSzRCdm5pQVk4R1p0UT0=', 'Samuel', 'Abudu', 'blvckleumas@gmail.com', 'rosebug001', 1, '7067509850', '+234', 3, '', '.png', 'email', '', '', '2018-12-01 14:37:49', '2018-12-21 13:09:49', 'elOw4oxmtlk:APA91bE6m3Z__-3Tf4dV6ge-y2ew_Ldm1R-XxNURKNVcViPMlzbAl51BWmoGe7jjv5LcXRATCWZ87tvTmPmfiTa9BESPBTVuxXMAnA4Ewfauus3ix1qY6L3wlA2mDeAMsGLIcEdFF1SK', '2.0', 'android', 'elOw4oxmtlk:APA91bE6m3Z__-3Tf4dV6ge-y2ew_Ldm1R-XxNURKNVcViPMlzbAl51BWmoGe7jjv5LcXRATCWZ87tvTmPmfiTa9BESPBTVuxXMAnA4Ewfauus3ix1qY6L3wlA2mDeAMsGLIcEdFF1SK', NULL, 5, 'ACTIVE', NULL),
(119, 'dENqTVRuMkpKV0hxNkZmYkQ5TEVhL1VvU0ppekRYMlJGNFU2ZTkrUlh0cz0=', 'Temidayo Onifade', 'Onifade', 'temidayojunior@gmail.com', 'tyak7WoW', 1, '8174847684', '+234', 3, '', 'HE7ixUaG00.png', 'social', 'google', '111363195544501935717', '2018-12-04 13:49:25', '2018-12-04 14:49:25', 'ac1de27e3fe3f063c24e03efdab45c0357895b314670211328aaa55128dc7ef8', '1.0', 'iOS', 'ac1de27e3fe3f063c24e03efdab45c0357895b314670211328aaa55128dc7ef8', NULL, 5, 'ACTIVE', NULL),
(120, 'V2lZTlUyU0tMRDZBTGUvMUhEaDdETTZqcXNwOVRwL21JbUlsYmp4di8zMD0=', 'Timi', 'Tejumola', 'tejumoladavid@gmail.com', 'david9595', 1, '8174847684', '+234', 5, '', '.png', 'email', '', '', '2018-12-05 16:18:01', '2018-12-07 23:02:44', '', '1.2', 'iOS', '', NULL, 5, 'ACTIVE', NULL),
(121, 'bW16aHkrdlNDMHF1RnRFZ0Rjd1BwRFU0am9HdFI5SEJHRExpSnkyT3ZWZz0=', 'd', 'd', 'd', 'd', 3, '22222', '+1', 6, '', '.png', 'email', '', '', '2018-12-10 13:19:52', '2018-12-10 14:19:52', 'appDelegate.deviceTokenStr', '1.2', 'iOS', 'appDelegate.deviceTokenStr', NULL, 5, 'ACTIVE', NULL),
(122, 'bW16aHkrdlNDMHF1RnRFZ0Rjd1BwREF1SExDRk9IQ3NXbDZCY3JPVlRLTT0=', 'w', 'w', 'w', 'w', 3, '1234565', '+1', 6, '', '.png', 'email', '', '', '2018-12-10 14:01:10', '2018-12-10 15:01:10', '', '1.2', 'iOS', '', NULL, 5, 'ACTIVE', NULL),
(123, 'bW16aHkrdlNDMHF1RnRFZ0Rjd1BwUENUS05BYXpNZVZuM2lIdS9jb1RLQT0=', 'w', 'w', 'w3333', 'w', 3, '8066804029', '+234', 5, '', '.png', 'email', '', '', '2018-12-10 14:05:56', '2018-12-10 15:05:56', '', '1.2', 'iOS', '', NULL, 5, 'ACTIVE', NULL),
(124, 'VnlXZ3g1bXhnYzlZditjWTVwVVMzWmYyUWxKbDVFS3prSFRRRmw5c3FiZz0=', 'Muna', 'Ugorji', 'ugorjimunachimso@gmail.com', 'toreachtheunreached', 3, '9094758862', '+234', 3, '', '.png', 'email', '', '', '2018-12-10 16:25:07', '2018-12-10 17:29:04', '5e0e6475176f8b8c99963dea196a60a4986f9c4f5778aa83b18003eaace409a9', '1.2', 'iOS', '5e0e6475176f8b8c99963dea196a60a4986f9c4f5778aa83b18003eaace409a9', NULL, 5, 'ACTIVE', NULL),
(125, 'RFBiSmlnWWNURExhOFdodVNBYUJBTGpvQU9vM3VFcWtrR0NCT3dpa29jMD0=', 'Chriso Phillips', '', 'christopher.phillips1089@hotmail.com', '7xW6zFWF', 1, '4000091372', '+61', 3, '', '.png', 'social', 'facebook', '10157830536856754', '2018-12-14 15:11:01', '2018-12-14 16:11:01', 'cAa8vxqvI8E:APA91bFqKth2mZAsuUV4cu3AgWBR0BYGJhcWiY5qz4Isj8WCTlS_6Y8SfR_JvjClQeOSsNwbix8qOd7HlLO4lBSZjyjq9ouqoPXWAul160piykf4pRHZ-XLyUEPwf05Bki7Aekz5LH6A', '2.0', 'android', 'cAa8vxqvI8E:APA91bFqKth2mZAsuUV4cu3AgWBR0BYGJhcWiY5qz4Isj8WCTlS_6Y8SfR_JvjClQeOSsNwbix8qOd7HlLO4lBSZjyjq9ouqoPXWAul160piykf4pRHZ-XLyUEPwf05Bki7Aekz5LH6A', NULL, 5, 'ACTIVE', NULL),
(126, 'RFBiSmlnWWNURExhOFdodVNBYUJBT2ZRd2VnZlFvNWtpMUFpL0dzS2dhMD0=', 'Chriso Phillips', 'Phillips', 'chris@sheetelec.com', 'SBCP2014', 1, '04000091372', '+61', 3, '', '.png', 'social', 'facebook', '10157830536856754', '2018-12-14 15:12:45', '2018-12-14 16:12:45', 'cAa8vxqvI8E:APA91bFqKth2mZAsuUV4cu3AgWBR0BYGJhcWiY5qz4Isj8WCTlS_6Y8SfR_JvjClQeOSsNwbix8qOd7HlLO4lBSZjyjq9ouqoPXWAul160piykf4pRHZ-XLyUEPwf05Bki7Aekz5LH6A', '2.0', 'android', 'cAa8vxqvI8E:APA91bFqKth2mZAsuUV4cu3AgWBR0BYGJhcWiY5qz4Isj8WCTlS_6Y8SfR_JvjClQeOSsNwbix8qOd7HlLO4lBSZjyjq9ouqoPXWAul160piykf4pRHZ-XLyUEPwf05Bki7Aekz5LH6A', NULL, 5, 'ACTIVE', NULL);
INSERT INTO `users` (`u_id`, `u_token`, `u_first_name`, `u_last_name`, `u_email`, `u_password`, `u_edu_institution`, `u_phone`, `u_phone_country`, `u_type`, `u_gender`, `u_image`, `u_auth_mode`, `u_auth_provider`, `u_auth_uid`, `u_created_at`, `u_last_modified`, `u_device_id`, `u_app_version`, `u_device_type`, `u_push_token`, `u_last_otp`, `u_role`, `u_status`, `u_temp_pass`) VALUES
(127, 'RGk2Nm1RUkJLOHp4emxQZnFTYVdVYU1XMFBTNVhUQjh4L1NpNUs0Mit6QT0=', 'Test', 'Test', 'tester@tester.com', 'tester', 2, '8079216793', '+234', 3, '', '.png', 'email', '', '', '2018-12-18 21:47:05', '2018-12-18 22:47:05', 'dnMuGz5mZ4I:APA91bHnNbEMZ8PHPCwKwMHFU6HU8qieUDOT5UoqHkM8feLTZicl8t3uQQxvXHz9f9mDnevnY-P5G_DU_0zvyqNo7fTop5Ng9TJmyU3R43wH4BkC_0qTG0zqMOyNy7yraAjZkzDoYG4M', '2.0', 'android', 'dnMuGz5mZ4I:APA91bHnNbEMZ8PHPCwKwMHFU6HU8qieUDOT5UoqHkM8feLTZicl8t3uQQxvXHz9f9mDnevnY-P5G_DU_0zvyqNo7fTop5Ng9TJmyU3R43wH4BkC_0qTG0zqMOyNy7yraAjZkzDoYG4M', NULL, 5, 'ACTIVE', NULL),
(128, 'RGk2Nm1RUkJLOHp4emxQZnFTYVdVY3RYMGRjS3BDVUIvV0VLS3JuWk5hND0=', 'Test', 'Test', 'seun@tester.com', 'tester', 2, '8079216793', '+234', 3, '', '.png', 'email', '', '', '2018-12-18 21:47:31', '2018-12-18 22:47:31', 'dnMuGz5mZ4I:APA91bHnNbEMZ8PHPCwKwMHFU6HU8qieUDOT5UoqHkM8feLTZicl8t3uQQxvXHz9f9mDnevnY-P5G_DU_0zvyqNo7fTop5Ng9TJmyU3R43wH4BkC_0qTG0zqMOyNy7yraAjZkzDoYG4M', '2.0', 'android', 'dnMuGz5mZ4I:APA91bHnNbEMZ8PHPCwKwMHFU6HU8qieUDOT5UoqHkM8feLTZicl8t3uQQxvXHz9f9mDnevnY-P5G_DU_0zvyqNo7fTop5Ng9TJmyU3R43wH4BkC_0qTG0zqMOyNy7yraAjZkzDoYG4M', NULL, 5, 'ACTIVE', NULL),
(129, 'RGk2Nm1RUkJLOHp4emxQZnFTYVdVU1NaSTUzWlNoT0l1dzZnTzZiT3V6az0=', 'Test', 'Test', 'owonikoko@tester.com', 'tester', 2, '8079216793', '+234', 3, '', '.png', 'email', '', '', '2018-12-18 21:47:49', '2018-12-18 22:47:49', 'dnMuGz5mZ4I:APA91bHnNbEMZ8PHPCwKwMHFU6HU8qieUDOT5UoqHkM8feLTZicl8t3uQQxvXHz9f9mDnevnY-P5G_DU_0zvyqNo7fTop5Ng9TJmyU3R43wH4BkC_0qTG0zqMOyNy7yraAjZkzDoYG4M', '2.0', 'android', 'dnMuGz5mZ4I:APA91bHnNbEMZ8PHPCwKwMHFU6HU8qieUDOT5UoqHkM8feLTZicl8t3uQQxvXHz9f9mDnevnY-P5G_DU_0zvyqNo7fTop5Ng9TJmyU3R43wH4BkC_0qTG0zqMOyNy7yraAjZkzDoYG4M', NULL, 5, 'ACTIVE', NULL),
(130, 'RGk2Nm1RUkJLOHp4emxQZnFTYVdVVUJQOC9iVXJWVElUTDRVdEl0R3pnOD0=', 'Test', 'Test', 'seun1234@tester.com', 'tester', 2, '8079216793', '+234', 3, '', '.png', 'email', '', '', '2018-12-18 21:48:28', '2018-12-18 22:48:28', 'dnMuGz5mZ4I:APA91bHnNbEMZ8PHPCwKwMHFU6HU8qieUDOT5UoqHkM8feLTZicl8t3uQQxvXHz9f9mDnevnY-P5G_DU_0zvyqNo7fTop5Ng9TJmyU3R43wH4BkC_0qTG0zqMOyNy7yraAjZkzDoYG4M', '2.0', 'android', 'dnMuGz5mZ4I:APA91bHnNbEMZ8PHPCwKwMHFU6HU8qieUDOT5UoqHkM8feLTZicl8t3uQQxvXHz9f9mDnevnY-P5G_DU_0zvyqNo7fTop5Ng9TJmyU3R43wH4BkC_0qTG0zqMOyNy7yraAjZkzDoYG4M', NULL, 5, 'ACTIVE', NULL),
(131, 'RGk2Nm1RUkJLOHp4emxQZnFTYVdVWi9nVCs0c2hhdEFzN0kxd0NzWld2Zz0=', 'Galina Kotovich', '', 'shadi76@mail.ru', 'eKx6WaWc', 1, '962203934', '+351', 3, '', '.png', 'social', 'facebook', '2190441351196296', '2018-12-18 22:43:00', '2018-12-18 23:43:00', 'dgSI8QLMXpk:APA91bF-cqsuZYdUMi6AXm8wzNFdFBPkZSNSTVH8gXoue5RkLj5xypcN4ECB62f5I4ZDlObi9xmpVb3pXJcBffODxkgO2FUTQcMAOXNVv9nGuIB8nXM44Hq-6jJXORFXw3umhq8rLCzK', '2.0', 'android', 'dgSI8QLMXpk:APA91bF-cqsuZYdUMi6AXm8wzNFdFBPkZSNSTVH8gXoue5RkLj5xypcN4ECB62f5I4ZDlObi9xmpVb3pXJcBffODxkgO2FUTQcMAOXNVv9nGuIB8nXM44Hq-6jJXORFXw3umhq8rLCzK', NULL, 5, 'ACTIVE', NULL),
(132, 'RXJ4aGx4aUJuMXFmRnBVVkozdzFjUzR6dnFVZFlkUHozVW9JNklFSTRPbz0=', '', '', 'xakhmthephx@gmail.com', 'hcSOX6nj', 1, '0871289849', '+66', 3, '', '.png', 'social', 'google', '100361572547566870137', '2018-12-19 01:08:42', '2018-12-19 02:08:42', 'cNMLtyte358:APA91bEsNluxkS3y20Ky0my7D4OFQJJYW9cGSK-njxBbhaampFPi7Dxbzl51VgoUTsltpsLrTFEE7LBVUipbiBj3JPTVaRZlV8WCFBiRBU2LTAxto6rGhVwIevs66AIS_L1n8FHIqKFL', '2.0', 'android', 'cNMLtyte358:APA91bEsNluxkS3y20Ky0my7D4OFQJJYW9cGSK-njxBbhaampFPi7Dxbzl51VgoUTsltpsLrTFEE7LBVUipbiBj3JPTVaRZlV8WCFBiRBU2LTAxto6rGhVwIevs66AIS_L1n8FHIqKFL', NULL, 5, 'ACTIVE', NULL),
(133, 'VDM4M2h2N0lSQzd5NWxmVzFoOHYwd1lLL1BBemx4dmhQVTJnR1JsTURyTT0=', 'Khalil Ahmad', '', 'saeedeng37@gmail.com', '2eGHgoog', 1, '3216611985', '+92', 3, '', '.png', 'social', 'google', '114310371073886059275', '2018-12-20 19:04:23', '2018-12-20 20:04:23', '', '2.0', 'android', '', NULL, 5, 'ACTIVE', NULL),
(134, 'bW1VSExPcVBOL1RnbFBmUEZIcmdmRzRMckdNNHBHYmMwdGh3MmtyQXh1RT0=', 'Stanley Tsang', '', 'stan_tsang@shaw.ca', 'imeyloccgd', 1, '6047168040', '+1', 3, '', '.png', 'social', 'facebook', '10218755257302518', '2018-12-22 05:52:04', '2019-01-25 15:08:15', 'cjQuy3yIh7Y:APA91bGjnJS6M88NV5F04VjdjK7k00jPVi8uE5kRmE8s6yJsHhBQNQIwGdCKI1ZsBhnu0B3lIyFW-GP5HW69F9WZ3r8PJa_PhND1zwHx2hxZuhwBjDEEzju9JSRhExPRwGy8eixFEcX0', '2.0', 'android', 'cjQuy3yIh7Y:APA91bGjnJS6M88NV5F04VjdjK7k00jPVi8uE5kRmE8s6yJsHhBQNQIwGdCKI1ZsBhnu0B3lIyFW-GP5HW69F9WZ3r8PJa_PhND1zwHx2hxZuhwBjDEEzju9JSRhExPRwGy8eixFEcX0', NULL, 5, 'ACTIVE', NULL),
(135, 'QUVJWXBhamNWK0l4U0JYWWR1WlNjbGljSmkvUTRJeGkvL0ZzanhKdnhLND0=', 'Stanley Tsang', '', 'tsangscp@gmail.com', 'GStFQzTM', 1, '6047168040', '+1', 3, '', '.png', 'social', 'google', '106480304901631051352', '2018-12-22 05:55:52', '2018-12-22 06:55:52', 'cjQuy3yIh7Y:APA91bGjnJS6M88NV5F04VjdjK7k00jPVi8uE5kRmE8s6yJsHhBQNQIwGdCKI1ZsBhnu0B3lIyFW-GP5HW69F9WZ3r8PJa_PhND1zwHx2hxZuhwBjDEEzju9JSRhExPRwGy8eixFEcX0', '2.0', 'android', 'cjQuy3yIh7Y:APA91bGjnJS6M88NV5F04VjdjK7k00jPVi8uE5kRmE8s6yJsHhBQNQIwGdCKI1ZsBhnu0B3lIyFW-GP5HW69F9WZ3r8PJa_PhND1zwHx2hxZuhwBjDEEzju9JSRhExPRwGy8eixFEcX0', NULL, 5, 'ACTIVE', NULL),
(136, 'S1lXcUpHWVFCdkVtcUl2TEZTVTJ3anc2RlpQSzBzQm9vNkJtalVTUk9Laz0=', 'Jeff Nieters', '', 'jnieters17@gmail.com', 'dO5657zp', 1, '3078716256', '+1', 3, '', '.png', 'social', 'google', '107557325719457141167', '2018-12-25 03:39:54', '2018-12-25 04:39:54', 'fDU7BUkkdUg:APA91bG2fXNjsTOIoAyDtaFUA3UovgdHVPW9vX0GevSl0iJLwv6BAeBJ5dVEOb_gJ6wTdYCi8r5tMAaEqd6_AuVn4tcXzwqgy-cYbdVZs3PYSBUyHMsvX3tBtiJ5uOCyr1LubwppOGf8', '2.0', 'android', 'fDU7BUkkdUg:APA91bG2fXNjsTOIoAyDtaFUA3UovgdHVPW9vX0GevSl0iJLwv6BAeBJ5dVEOb_gJ6wTdYCi8r5tMAaEqd6_AuVn4tcXzwqgy-cYbdVZs3PYSBUyHMsvX3tBtiJ5uOCyr1LubwppOGf8', NULL, 5, 'ACTIVE', NULL),
(137, 'S2RpVGlnZFh0eXQ0OHJYS2NENm9hYUNmeWZROUFldXBxcGRjZmRrN201MD0=', 'Tariq Farooq', '', 'tariqfarooq4227@gmail.com', 'jcMZLW7g', 1, '03217916366', '+92', 3, '', '.png', 'social', 'google', '107664850405295820623', '2018-12-25 05:58:02', '2018-12-25 06:58:02', '', '2.0', 'android', '', NULL, 5, 'ACTIVE', NULL),
(138, 'S2RpVGlnZFh0eXQ0OHJYS2NENm9hUS8xOFJyWWQ4cjUzN0lzREFvWEYwOD0=', 'Tariq', 'Farooq', 'tariqfarooq42277@gmail.com', '03217916366', 1, '03217916366', '+92', 3, '', '.png', 'email', '', '', '2018-12-25 06:04:05', '2018-12-25 07:04:05', 'dkmktBiIsxU:APA91bHRYXAJ0m_K9R4tX1bV9eBnQ-5gX0Slr-lg5E2X0JDpBzF6gV3JXraG8N7U7OHNKczbsmYZxQEOsib24TQIcuXDsJXYf3L6KMt-ZZUqdcE6YwJVNIVxUm4MS9fq6VWUjcLlqKH_', '2.0', 'android', 'dkmktBiIsxU:APA91bHRYXAJ0m_K9R4tX1bV9eBnQ-5gX0Slr-lg5E2X0JDpBzF6gV3JXraG8N7U7OHNKczbsmYZxQEOsib24TQIcuXDsJXYf3L6KMt-ZZUqdcE6YwJVNIVxUm4MS9fq6VWUjcLlqKH_', NULL, 5, 'ACTIVE', NULL),
(145, 'K0lvb1g3WDRGb3hnb0l4WkhxR2pZTWNPdUYwUFJDOTZFeFdPcXM3SXkzQT0=', 'Israel Alagbe', '', 'israelalagbe53@gmail.com', 'T9Z03C5y', 1, '8107760824', '+234', 3, '', '.png', 'social', 'google', '109320239085153878648', '2019-01-10 00:52:46', '2019-01-09 17:52:46', 'cW-N8-a9L2g:APA91bFXRhgdFOiCA900HpEkCrSlyBqgzFy3W4DR1sY3p-_fggZ2Nj0O3j8hTq0WUZnvrWHi6XXL0tkoQoouxvsXF4Q8M4IutMWq6_HxkwBnfCM32YQIgEIEfGm6SyFXGrH9pEHBLnd1', '2.0', 'android', 'cW-N8-a9L2g:APA91bFXRhgdFOiCA900HpEkCrSlyBqgzFy3W4DR1sY3p-_fggZ2Nj0O3j8hTq0WUZnvrWHi6XXL0tkoQoouxvsXF4Q8M4IutMWq6_HxkwBnfCM32YQIgEIEfGm6SyFXGrH9pEHBLnd1', NULL, 5, 'ACTIVE', NULL),
(159, 'Qy91Q3dBbEYyVDZOR01oanFtRDZVcHVLZFdDczZiU3J2dHFkNC9DaWRaMD0=', 'Manuel Chris Ogar', '', 'mcogar18@gmail.com', '7cfrkdTI', 1, '8143082454', '+234', 3, '', '.png', 'social', 'google', '110430911570715839483', '2019-01-10 23:05:26', '2019-01-10 16:05:26', 'cZXe2PGWHXM:APA91bEi47hjgG3pkQxHXAJk6izTGtm3OEGpS46lc3x2g1TVQLCQ5R_mxRYDdAB66IyN7DJCm3DcaFQAxo_sGBEFuaKyavH24ic3afOLEnEEVc8Pc2Gvs_WQWGvmWc0YoH9vhIA2sm6z', '2.0', 'android', 'cZXe2PGWHXM:APA91bEi47hjgG3pkQxHXAJk6izTGtm3OEGpS46lc3x2g1TVQLCQ5R_mxRYDdAB66IyN7DJCm3DcaFQAxo_sGBEFuaKyavH24ic3afOLEnEEVc8Pc2Gvs_WQWGvmWc0YoH9vhIA2sm6z', NULL, 5, 'ACTIVE', NULL),
(160, 'dm93YzZZT3hwbS91Tzl0TTN0ektjOHRUS3YydXpFcUtRN1dZbWN6YXNrZz0=', 'Tessy ikori', '', 'downtownhomemeals@gmail.com', 'fUANIuSA', 1, '8143082424', '+234', 3, '', '.png', 'social', 'google', '109865542683774906972', '2019-01-10 23:49:23', '2019-01-10 16:49:23', '', '2.0', 'android', '', NULL, 5, 'ACTIVE', NULL),
(161, 'e5766be6babe22bb72d9ddf990d4baaec556102f15cf6e6fce8ce164342ad88e', 'Israel', 'Alagbe', 'israelalagbe@symple.tech', 'pass', NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, '2018-11-05 08:11:13', '2019-03-01 15:02:37', NULL, NULL, NULL, NULL, NULL, 1, 'ACTIVE', ''),
(162, 'RnhXYUFmWFhZdk5oR3FKYzMwVitreVQwYndCSXNScHJQdjJLMGlqVjZ0ND0=', 'FNAME1', 'LNAME1', 'LAME@GMAIL.COM', 'PASS', 1, '02837737377', '+234', 3, 'male', 'male.png', 'social', 'google', '109865542683774906972', '2019-01-11 22:47:17', '2019-01-11 15:47:17', 'dkjjdjdjdjd', '2.0', 'android', 'fH_PbBDiljY:APA91bEcO6hJxzBdeDTnzEUPaOb9Qk7O7xLjnBYufQ2l9pl2wN17KCxXPn0_t19NTKZeDPzKOU4q7zSqPVUe1sXSqKjIBmkT1tzK2byp1Xv9q_-pjyzSU3uC3kj4zT9E3RRRIVc2E15S', NULL, 5, 'ACTIVE', NULL),
(163, 'ZmZWWEM5RzR0M05DaW85bHhEc2JJYW1OZFllWklBNlp0NVZFSzdnRjJJND0=', 'Javeed Iqbal', '', 'ji750674@gmail.com', '32y38Dah', 1, '03038631750', '+92', 3, '', '.png', 'social', 'google', '110243883703914674228', '2019-01-14 19:07:26', '2019-01-14 12:07:26', '', '2.0', 'android', '', NULL, 5, 'ACTIVE', NULL),
(164, 'WDU5OGVRT1FMbVJWS1NyWDk5MDNqaVFPRzVLWEZFeGVta1NZdUZqcWVVUT0=', 'Jonas', 'Peromar', 'jonasperomar34@gmail.com', 'kouekam0', 4, '699486486', '+237', 3, '', '.png', 'email', '', '', '2019-01-16 17:34:01', '2019-01-16 10:34:01', '', '2.0', 'android', '', NULL, 5, 'ACTIVE', NULL),
(165, 'UERIeUVRdGJRQzF5eG92N2wxVVpkNmkvMVI1UDJRTzl5S1VmVWN3NWgyOD0=', 'penquin paeng', '', 'sakonwanclash@gmail.com', 'pt955CTX', 1, '0917757573', '+66', 3, '', '.png', 'social', 'google', '115091704326471148109', '2019-01-21 08:10:42', '2019-01-21 01:10:42', 'cZviA8jK0oc:APA91bFOBtjQIrafSRknBi7X2-dAmALisWkE_kB1IBOpAdi9yNXRCMowpPbiLwLzGyTXlI9ILraKk25ZGl8MdW9dR_w88wg57g655SPnsT95K7DYJaSEgqUj6tZ2ctoUggYkPMKSMNvn', '2.0', 'iOS', 'cZviA8jK0oc:APA91bFOBtjQIrafSRknBi7X2-dAmALisWkE_kB1IBOpAdi9yNXRCMowpPbiLwLzGyTXlI9ILraKk25ZGl8MdW9dR_w88wg57g655SPnsT95K7DYJaSEgqUj6tZ2ctoUggYkPMKSMNvn', NULL, 5, 'ACTIVE', NULL),
(166, NULL, 'Israel', 'Alagbe', 'convenant_driver@gmail.com', 'bigxxogjod', 1, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, '2019-01-24 21:50:53', '2019-02-09 15:48:37', NULL, NULL, NULL, NULL, NULL, 4, 'ACTIVE', NULL),
(167, '571f90bdab5533f5c07c4ecacfb4ac91119437c19791334561c61ee5fb17e555', 'Covenant', 'Admin', 'covenant_admin@gmail.com', 'pass', 1, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, '2019-01-25 20:45:31', '2019-02-19 15:30:29', NULL, NULL, NULL, NULL, NULL, 2, 'ACTIVE', NULL),
(168, NULL, 'iuiijk', '.knih', 'cd@gmail.com', 'pass', 1, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, '2019-01-25 21:06:07', '2019-01-25 14:06:07', NULL, NULL, NULL, NULL, NULL, 4, 'ACTIVE', NULL),
(169, 'WWRhanBhZWpHUnB3RjhJVkNLYzJxaXVXUzJTWkhOREtVbit6VEJIWm0yTT0=', 'Israel', 'Alagbe', 'cad@gmail.com', 'pass', 1, '8107760824', '+234', 4, 'male', 'male.png', 'email', 'email', 'email', '2019-01-25 21:09:14', '2019-01-25 14:09:14', 'cdQTnxPNl0I:APA91bGB_9nCSJyBPlZQGgCNnn3cX7h6UQpns7xOasoc6AKsKNn0QKfou0brQgy9ITFV-8cu3KqU4xIhwfg_Q00jETTiAKKoGgqPW1FEPPkvEbY2GAQ16TZV6ZvgPatUjFYzG50nVaMP', '1.02', 'android', 'cdQTnxPNl0I:APA91bGB_9nCSJyBPlZQGgCNnn3cX7h6UQpns7xOasoc6AKsKNn0QKfou0brQgy9ITFV-8cu3KqU4xIhwfg_Q00jETTiAKKoGgqPW1FEPPkvEbY2GAQ16TZV6ZvgPatUjFYzG50nVaMP', NULL, 5, 'ACTIVE', NULL),
(170, 'cFBFTU1OMWxVTGZmQ2pib3IxWEZreGxXcStBQkYvKzV1V25aYXpCWnc1OD0=', 'Israel', 'Alagbe', 'dod@gmail.com', 'pass', 1, '8107760824', '+234', 4, 'male', 'male.png', 'email', 'email', 'email', '2019-01-25 21:09:38', '2019-01-25 14:11:01', 'cdQTnxPNl0I:APA91bGB_9nCSJyBPlZQGgCNnn3cX7h6UQpns7xOasoc6AKsKNn0QKfou0brQgy9ITFV-8cu3KqU4xIhwfg_Q00jETTiAKKoGgqPW1FEPPkvEbY2GAQ16TZV6ZvgPatUjFYzG50nVaMP', '1.02', 'android', 'cdQTnxPNl0I:APA91bGB_9nCSJyBPlZQGgCNnn3cX7h6UQpns7xOasoc6AKsKNn0QKfou0brQgy9ITFV-8cu3KqU4xIhwfg_Q00jETTiAKKoGgqPW1FEPPkvEbY2GAQ16TZV6ZvgPatUjFYzG50nVaMP', NULL, 5, 'ACTIVE', NULL),
(172, 'ea0fbd3fbb9620d7f5d32f4b27359af6df1e465a6463132912dff5276f0c9007', 'chitest@admin.com', 'chitest@admin.com', 'chitest@admin.com', 'cccccc', 1, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, '2019-01-25 22:53:01', '2019-01-25 15:54:14', NULL, NULL, NULL, NULL, NULL, 2, 'ACTIVE', NULL),
(173, 'bca69cd2797b3c52869845d3beffd1fa25c5ed33843015b2e3542c7edb652d73', 'adminSuper', 'adminSuper', 'adminSuper@email.com', 'cccccc', NULL, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, '2019-01-27 21:41:01', '2019-01-27 14:41:27', NULL, NULL, NULL, NULL, NULL, 1, 'ACTIVE', NULL),
(174, 'Q2Q1RmN0NlZzYUx1VWVrWEJpb013N2JRd3V2M2pzd1grdmFnRFFvOXRYZz0=', 'Idris Adetunmbi', '', 'chrylich@gmail.com', 'ZhsAqqQK', 1, '8056639180', '+234', 3, '', '.png', 'social', 'facebook', '2786968701320717', '2019-01-30 03:36:49', '2019-01-29 20:36:49', '', '2.0', 'android', '', NULL, 5, 'ACTIVE', NULL),
(175, 'ekY2Rk5TNTMwUi8xNjk5bkVveEZEZEFmbTZOek9vTWI3a0U1ODBML0RmST0=', 'Dhruva makashi', '', 'dhruvamakashi143@gmail.com', 'Tbz4G2FD', 1, '9964310719', '+91', 3, '', '.png', 'social', 'google', '116355922763193981028', '2019-01-31 18:47:19', '2019-01-31 11:47:19', '', '2.0', 'android', '', NULL, 5, 'ACTIVE', NULL),
(176, 'aGEwOWJ5d2EvVER0S3o0U29aclB2RzBNMTUvUlNyVzZTVENzWTAxcFdKdz0=', 'Taiwo Folu', '', 'taiwofolu@gmail.com', 'tefRcK3O', 1, '7088225854', '+234', 3, '', '.png', 'social', 'google', '103345428463047346436', '2019-02-09 22:35:18', '2019-02-09 15:35:18', 'eZ_6Q-Wn2EY:APA91bESys-Ss--zc2lL5phL6jf_zq7jUQBH6koaoLRMIQ0kN9RFZDcaHPHj3GF93zwYFhMGpPNGyVmvyNOJupGivsmWN6X0PttGRlfbcMXHPfLhHMEN5_ILi67iZOAwrXObvCvkom59', '2.0', 'android', 'eZ_6Q-Wn2EY:APA91bESys-Ss--zc2lL5phL6jf_zq7jUQBH6koaoLRMIQ0kN9RFZDcaHPHj3GF93zwYFhMGpPNGyVmvyNOJupGivsmWN6X0PttGRlfbcMXHPfLhHMEN5_ILi67iZOAwrXObvCvkom59', NULL, 5, 'ACTIVE', NULL),
(177, 'aGEwOWJ5d2EvVER0S3o0U29aclB2T0x3a2hCc3FUTzJaTG1uRExCaUg2RT0=', 'Mansa Ram', '', 'mansaram884@gmail.com', '4WQ9CQXc', 1, '9023509014', '+91', 3, '', '.png', 'social', 'facebook', '520845248409784', '2019-02-09 22:39:58', '2019-02-09 15:39:58', 'eRtzQEuAj5M:APA91bHcDZMFImuYsBARAcbkf93snpWZJk2XDo3CoZ4Tu7B6_WrHL8tJ5vpcJYgHu2zRzst8MhE4cETwnCdFL3bF1nEz9V1VFefbS6xwzex_SMMmhqklQ_HhLfCnGcynTHL0LlnjDfHy', '2.0', 'android', 'eRtzQEuAj5M:APA91bHcDZMFImuYsBARAcbkf93snpWZJk2XDo3CoZ4Tu7B6_WrHL8tJ5vpcJYgHu2zRzst8MhE4cETwnCdFL3bF1nEz9V1VFefbS6xwzex_SMMmhqklQ_HhLfCnGcynTHL0LlnjDfHy', NULL, 5, 'ACTIVE', NULL),
(178, 'SExQYkx6TWt1Z0JOOUJrRS9Yem1NNVR1Skh6cFNLeU9qZW02T05OclVTbz0=', 'Chinedu', 'Ofor', 'c@chhhh.com', 'cccccc', 1, '07030296746', '+234', 3, '', '.png', 'email', '', '', '2019-02-10 09:48:23', '2019-02-10 02:48:23', 'fP9ZcpsxgA0:APA91bGfoGB1sAV5xP2jZ4WF6PVcdvvT0CWZopocLNc38VpE9FxG6zuBQ4YGedNyIMRUPfiSBUJbVD9w9SFaE-XjpGtU7u-I-d5wnZCj_6389ytuNe8LTBIkLrxFhk5WjuU7iXeCWhL8', '2.0', 'android', 'fP9ZcpsxgA0:APA91bGfoGB1sAV5xP2jZ4WF6PVcdvvT0CWZopocLNc38VpE9FxG6zuBQ4YGedNyIMRUPfiSBUJbVD9w9SFaE-XjpGtU7u-I-d5wnZCj_6389ytuNe8LTBIkLrxFhk5WjuU7iXeCWhL8', NULL, 5, 'ACTIVE', NULL),
(179, 'Q203MGRjbzZtOC9LYXdqZDJqdmczUXRESzJXSjVSK1F3QmRCOWRYYzNvTT0=', 'eve duchadeau', '', 'sc.duchadeau.eve@gmail.com', 'jdbUMAl4', 1, '626978658', '+33', 3, '', '.png', 'social', 'google', '109930868070335451852', '2019-02-12 18:18:17', '2019-02-12 11:18:17', 'dQiBBBJS7FE:APA91bG83nGzTq2HrAu86Nf1Ch8f8e9XstmXsWQph1XFE9pWJt369k-v0UqfRSSiPJtgqBMSjlEJJkWcJnV_NbnibSpOqy-1WQaU5sDvLO6W-rSWVWObHT05GazDz-z1KhBohPdd-Tvi', '2.0', 'android', 'dQiBBBJS7FE:APA91bG83nGzTq2HrAu86Nf1Ch8f8e9XstmXsWQph1XFE9pWJt369k-v0UqfRSSiPJtgqBMSjlEJJkWcJnV_NbnibSpOqy-1WQaU5sDvLO6W-rSWVWObHT05GazDz-z1KhBohPdd-Tvi', NULL, 5, 'ACTIVE', NULL),
(180, 'Ky9kekpya2hEeDlJTnpRWVcvYThvRkhSaXB0TFZzbjU3S0xIYldYMHEzQT0=', 'Vishal Roy', '', 'vishal101499@gmail.com', 'mDjouYRg', 1, '7973843697', '+91', 3, '', '.png', 'social', 'google', '102909311324633876901', '2019-02-16 12:51:16', '2019-02-16 05:51:16', '', '2.0', 'android', '', NULL, 5, 'ACTIVE', NULL),
(182, '8d13237d56255b9a75450f8a02e51b4812803bf6b59a8697a0b3aac2b91cbad5', 'Oluwaseun', 'Owonikoko', 's_odunayo@yahoo.com', 'owonikoko', 1, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, '2019-02-20 21:42:34', '2019-02-20 15:11:37', NULL, NULL, NULL, NULL, NULL, 2, 'ACTIVE', ''),
(183, NULL, 'Me', 'you', 'me@gmail.com', 'pass', 1, NULL, NULL, NULL, NULL, NULL, 'email', NULL, NULL, '2019-02-21 21:34:45', '2019-02-21 14:34:45', NULL, NULL, NULL, NULL, NULL, 4, 'ACTIVE', NULL),
(184, NULL, 'a', 'b', 'a@b.com', 'pass', 1, NULL, NULL, 4, NULL, NULL, 'email', NULL, NULL, '2019-02-21 22:03:36', '2019-02-21 15:03:36', NULL, NULL, NULL, NULL, NULL, 4, 'ACTIVE', NULL),
(185, 'UXdWUEYzZnVDWkl0dG5mQ1JPam5hb09DRGdPWm1Za0xEY1JWSFhpU21zTT0=', 'Chinedu', 'Ofor', 'c@e.com', 'cccccc', 0, '07030296746', 'nigeria', 5, '', '.png', 'email', 'email', NULL, '2019-02-22 04:03:51', '2019-02-21 21:03:51', 'cJlsR2F3_xU:APA91bHoYCq3uMtzFhLZYIpf45CF1idBD1FwkSvuCNdpd0YBEaReckYhevBp_zCymQQWIMm9vF1Fw1KnBEdqjnkiSYb1hKnSUl-rb_BKOKyEY2EPA7RCbYq8GnS2Nadz9KecGhkMeGZT', '2.0', 'iOS', NULL, NULL, 5, 'ACTIVE', NULL),
(186, 'UXdWUEYzZnVDWkl0dG5mQ1JPam5haURjdTY2N05FL05qMXhRcFVPWmc0bz0=', 'Chinedu', 'Ofor', 'c@3.com', 'cccccc', 0, '00000000000', 'nigeria', 5, '', '.png', 'email', 'email', NULL, '2019-02-22 04:06:52', '2019-02-21 21:06:52', 'cJlsR2F3_xU:APA91bHoYCq3uMtzFhLZYIpf45CF1idBD1FwkSvuCNdpd0YBEaReckYhevBp_zCymQQWIMm9vF1Fw1KnBEdqjnkiSYb1hKnSUl-rb_BKOKyEY2EPA7RCbYq8GnS2Nadz9KecGhkMeGZT', '2.0', 'iOS', NULL, NULL, 5, 'ACTIVE', NULL),
(187, 'QU5MdHVWWlliby9rT0pNbWxSMHdlZTNJWEV2d1RTT1BaTEtQbS95K1BIZz0=', 'Dipo ', 'Adekanbi', 's@s.com', 'Deepsea_1', 0, '00000000000', 'nigeria', 5, '', '.png', 'email', 'email', NULL, '2019-02-22 23:07:29', '2019-02-22 16:07:29', 'cfq1Bsilb6A:APA91bFbncWAy7ezuMGJcsOvDIwX0B0LohMb1DJwGY6vPR56vAubvvHD-AMUH9kDR5vJ4b1oG3_swpdDr8NnRaXAm3kX0DJQRoFRwTv4hR74-hvyjVLgSHI84mTU8TT4n71zadyr4kKT', '2.0', 'iOS', NULL, NULL, 5, 'ACTIVE', NULL),
(188, 'OUdSc1FwaE5PUEYzbDdJeU5SakVzZWJ2MGNVYml3eXVjN1REY1phdEpOTT0=', 'Chinedu', 'Ofor', 'c@zx.com', 'cccccc', 1, '07030296746', '+234', 4, 'male', 'male.png', 'email', 'email', 'email', '2019-02-23 03:43:59', '2019-02-22 20:44:48', 'cb9Rt00zcJY:APA91bEEkXpRlZdnosNJPmf8K5UGNZMG-9A4a_IynrVBFQFIq-4YJvMFKLNqh1FES4OA24Vv6_9EHAGNMxkkRKDqAongjiNBB-qn3IEcpg2xc2oZkPn99lUtZQhiPKlroXY5HonBmPfj', '1.02', 'android', 'cb9Rt00zcJY:APA91bEEkXpRlZdnosNJPmf8K5UGNZMG-9A4a_IynrVBFQFIq-4YJvMFKLNqh1FES4OA24Vv6_9EHAGNMxkkRKDqAongjiNBB-qn3IEcpg2xc2oZkPn99lUtZQhiPKlroXY5HonBmPfj', NULL, 5, 'ACTIVE', NULL),
(189, 'MlVJb1JYcytrTUcySHBEUVlFY0lPWHVLb0VDbkdsK0JwdUJxT2o5SHdMcz0=', 'Nathan Balderson', '', 'wilson-909@hotmail.com', 'Nc0M2TRj', 1, '0433904252', '+61', 3, '', '.png', 'social', 'facebook', '10157047321844806', '2019-02-25 02:15:37', '2019-02-24 19:15:37', '', '2.0', 'android', '', NULL, 5, 'ACTIVE', NULL),
(190, 'L2tJV3Zhc0VrNGtSb05jZUpUU01yUjN5MXFPa3BEc0hzZmRDNGpUbFBFND0=', 'Maxwell ', 'Ogar', 'maxy525@gmail.com', 'maxy123', 3, '70823390388', '+234', 5, '', '.png', 'email', '', '', '2019-02-26 02:49:17', '2019-02-25 19:49:17', NULL, '2.0', 'android', 'cZ5Qs3eYphs:APA91bE5s3wyO6A_BDbIFdQmziHDndhMry_pbXGbuALuiDW0a8Hqgd-0oQOEltSEA-uqP3bBhQqfnEO6xZQ6ffhYBWvDFW9XJpfbEpGfAS7XkAmJVJYyh8ZGiWUiNEfU8I68tBrUu9rF', NULL, 5, 'ACTIVE', NULL),
(191, 'RWwwa2dlSFlPK2srUFlJWXFGRTRiakpyNHNySCtCMU5TeXNkY0RhbzhVND0=', 'Chinedu', 'Ofor', 'b@b.com', 'cccccc', 1, '07030296746', '+234', 3, '', '.png', 'email', '', '', '2019-02-26 21:57:37', '2019-02-26 14:57:37', NULL, '2.0', 'android', 'cbfS_toVNcs:APA91bEtT2EDOdLOZ4N_9t7wcLwUbwV_sF3DbnTmwxQJiM1RB6WfuMck9bEpbg1Mdf74Bychob3suRZQrJQYTDMZG-Xcgb9BvqBta8yobCgF-Rf5VlhuSlvZ__O5QFUk1v7QTVFyEeF_', NULL, 5, 'ACTIVE', NULL),
(192, 'RWwwa2dlSFlPK2srUFlJWXFGRTRidFB2eWo4Q3piYVZhNlhPL0MrVFI1Yz0=', 'FirstName', 'LastName', 'mail@gmail.com', 'password', 1, '02837737377', '+234', 3, 'male', 'male.png', 'social', 'google', '109865542683774906972', '2019-02-27 00:57:07', '2019-02-26 17:57:07', 'fH_PbBDiljY:APA91bEcO6hJxzBdeDTnzEUPaOb9Qk7O7xLjnBYufQ2l9pl2wN17KCxXPn0_t19NTKZeDPzKOU4q7zSqPVUe1sXSqKjIBmkT1tzK2byp1Xv9q_-pjyzSU3uC3kj4zT9E3RRRIVc2E15S', '2.0', 'android', 'fH_PbBDiljY:APA91bEcO6hJxzBdeDTnzEUPaOb9Qk7O7xLjnBYufQ2l9pl2wN17KCxXPn0_t19NTKZeDPzKOU4q7zSqPVUe1sXSqKjIBmkT1tzK2byp1Xv9q_-pjyzSU3uC3kj4zT9E3RRRIVc2E15S', NULL, 5, 'ACTIVE', NULL),
(193, 'RWwwa2dlSFlPK2srUFlJWXFGRTRiaDBISnJPQ0tmTG94RkhMMUlqNkpLbz0=', 'Ejemen', 'Anenih', 'ejemen@gmail.com', '12345', 2, '8066428500', '+234', 3, '', '.png', 'email', '', '', '2019-02-27 05:54:39', '2019-02-26 22:54:39', NULL, '2.0', 'android', 'fHm9ShYRviE:APA91bHCviu4bVNy1m6ZSKZoW9sffxC774zmuyRg2SOef9vw-taYSr6odWQmTjiKEsQETOs85vD5s5WTF4603mS-vVsOGfl1Uj1716awhSmkzL8ckKzM-wWGBqjEKIIpLt755RPIKsc0', NULL, 5, 'ACTIVE', NULL),
(194, 'V0huU0tPejJlU0xDSUNoRGFpZTd4VFpvTk5HWlNwcnB6c2cwTFFIZmQ5RT0=', 'assess', 'sdsd', 'sdsds@w.com', 'dddddd', 0, '00000000000', 'nigeria', 5, '', '.png', 'email', 'email', NULL, '2019-02-27 07:46:29', '2019-02-27 00:46:29', 'ftdqXwfJUZU:APA91bFsQhtNPHnU-DD4VfLihnHkIB0IYqYHEk8VvEm8RAwp3302dpNfp7EkB1lpCKgPAeCekfn_rI0mLF5_JkcmfvVT1TVOvct8V4fe1SAyHo4vhpfsR_FybqOrhdbSGFI7iKXX5EJV', '2.0', 'iOS', NULL, NULL, 5, 'ACTIVE', NULL),
(195, 'V0huU0tPejJlU0xDSUNoRGFpZTd4Y3crS3I0dm5qMnByK25hSmxBMEpmRT0=', 'chinedu', 'ofor', 'c@c1.com', '11111', 0, '1234567890', 'Nigeria', 5, '', '.png', 'facebook', 'facebook', NULL, '2019-02-27 08:03:30', '2019-02-27 01:03:30', '32323', '2.0', 'iOS', NULL, NULL, 5, 'ACTIVE', NULL),
(196, 'V0huU0tPejJlU0xDSUNoRGFpZTd4VzBYUHJwajhNRWFIeWhhMzZCOGFmaz0=', 'dad', 'sdsds', 'd@d.com', 'cccccc', 0, '00000000000', 'nigeria', 5, '', '.png', 'email', 'email', NULL, '2019-02-27 09:05:38', '2019-02-27 02:05:38', 'e9NLGuTK4dY:APA91bGNCYoSf9MvYOFavrviSuT5ejGll041d-tFeuYpeHra3prt9kb1IvPRm5hYZe2Dj3H2gXQCMIBjWgFenAqPWNbLxToVWKfxb_W62KkretM7SpnUYCNq1EPPisxZbI6YKNcj4I_-', '2.0', 'iOS', NULL, NULL, 5, 'ACTIVE', NULL),
(197, 'V0huU0tPejJlU0xDSUNoRGFpZTd4Y0ZqTkF5bnF3T0xBcmtZYUtoNUJTcz0=', 'FirstName', 'LastName', 'mail1@gmail.com', 'password', 1, '02837737377', '+234', 3, 'male', 'male.png', 'social', 'google', '109865542683774906972', '2019-02-27 18:35:54', '2019-02-27 11:35:54', 'fH_PbBDiljY:APA91bEcO6hJxzBdeDTnzEUPaOb9Qk7O7xLjnBYufQ2l9pl2wN17KCxXPn0_t19NTKZeDPzKOU4q7zSqPVUe1sXSqKjIBmkT1tzK2byp1Xv9q_-pjyzSU3uC3kj4zT9E3RRRIVc2E15S', '2.0', 'android', 'fH_PbBDiljY:APA91bEcO6hJxzBdeDTnzEUPaOb9Qk7O7xLjnBYufQ2l9pl2wN17KCxXPn0_t19NTKZeDPzKOU4q7zSqPVUe1sXSqKjIBmkT1tzK2byp1Xv9q_-pjyzSU3uC3kj4zT9E3RRRIVc2E15S', NULL, 5, 'ACTIVE', NULL),
(199, 'V0huU0tPejJlU0xDSUNoRGFpZTd4VW1kdURMeW1sRkU2UTBZTnY3K0Zkcz0=', 'Chinedu', 'Ofor', 'oforchinedu12@gmail.com', '114265640112944727681', 0, '00000000000', 'nigeria', 5, '', '.png', 'email', 'email', NULL, '2019-02-28 06:24:21', '2019-02-27 23:24:21', 'fJxks-QL_lk:APA91bEh__Zfc0WBQG0m8qFz9uiVZsHWzVPLCjrJcYG638xndaOoXi48SFXk2q7yO9J_KCahXU5fqtggtgPSie3AbwA-5snhiEGaUqrM5vbgP8HSat6DMHUgHmKB1PKIKIGPuZeI6nzG', '2.0', 'iOS', NULL, NULL, 5, 'ACTIVE', NULL),
(200, 'b1c3MU5xckNla2FmNnRrUjlOQmNZOTBndUYzQ1NkUTVWUWlxVWFTWC9mRT0=', 'Ifiok Idiang', '', 'ifiok.idiang@gmail.com', 'cKU43bo0', 1, '8130648311', '+234', 3, '', '.png', 'social', 'google', '114181361808175259556', '2019-02-28 20:20:01', '2019-02-28 13:20:01', 'cKGZObaQY9E:APA91bH_Cp4AWDu-PHlInlkVTLDgLq5KkphNs4LEs7zTfP4lbCdkQ2WIn9uIlWNmeFY-SAJJV01J4f8NTae7VulepC6gbSPBJSA3MCPsnRqMVb2339agC7nwWIuJseXsL6G1rTqoSeGa', '2.0', 'android', 'cKGZObaQY9E:APA91bH_Cp4AWDu-PHlInlkVTLDgLq5KkphNs4LEs7zTfP4lbCdkQ2WIn9uIlWNmeFY-SAJJV01J4f8NTae7VulepC6gbSPBJSA3MCPsnRqMVb2339agC7nwWIuJseXsL6G1rTqoSeGa', NULL, 5, 'ACTIVE', NULL),
(201, 'VDNoczdLZmJBL0V6MnhNWlNRZllTTlJ4OXFsdTl3N1FpM0R0dHJxeDRxcz0=', 'First', 'Sur', 'firstsur@gmail.com', 'Deepsea_1', 2, '8181122520', '+234', 3, '', '.png', 'email', '', '', '2019-02-28 21:25:20', '2019-03-02 18:58:38', 'eKyRqKqQdxo:APA91bExEO84Lzqm1t1Wwk3gaseamVbBxKorKeR7rlUvVHBniP8Wrw5FzeC1BMAIvlwYtWh3H2aFeXgElnJPLwg9R7oGwvvGdcVInxDQ0w6kAGUZhmAG-rPhMhkZktGUKCltb3BUvUjJ', '2.0', 'android', 'eKyRqKqQdxo:APA91bExEO84Lzqm1t1Wwk3gaseamVbBxKorKeR7rlUvVHBniP8Wrw5FzeC1BMAIvlwYtWh3H2aFeXgElnJPLwg9R7oGwvvGdcVInxDQ0w6kAGUZhmAG-rPhMhkZktGUKCltb3BUvUjJ', NULL, 5, 'ACTIVE', NULL),
(202, 'MFBoaXZKcXl4eDE5RHNCRHpLNW5RUVJSY002Z2x0djA2VHJZVDJoeU1OST0=', 'Favour', 'Eze', 'ezefavour1999@gmail.com', 'ccccc', 2, '8137273893', '+234', 3, '', '.png', 'email', '', '', '2019-03-01 22:36:18', '2019-03-01 15:45:17', 'cbfS_toVNcs:APA91bEtT2EDOdLOZ4N_9t7wcLwUbwV_sF3DbnTmwxQJiM1RB6WfuMck9bEpbg1Mdf74Bychob3suRZQrJQYTDMZG-Xcgb9BvqBta8yobCgF-Rf5VlhuSlvZ__O5QFUk1v7QTVFyEeF_', '2.0', 'android', 'cbfS_toVNcs:APA91bEtT2EDOdLOZ4N_9t7wcLwUbwV_sF3DbnTmwxQJiM1RB6WfuMck9bEpbg1Mdf74Bychob3suRZQrJQYTDMZG-Xcgb9BvqBta8yobCgF-Rf5VlhuSlvZ__O5QFUk1v7QTVFyEeF_', NULL, 5, 'ACTIVE', NULL),
(203, 'N1AvZzBEOFM2bVlZazFSYS9jeENzTHhoOGxOTG1YditQd1BrbUgzUG9QUT0=', 'temidayo', 'ajakaiye', 'temmydd@gmail.com', 'olayemi13', 2, '8033002125', '+234', 3, '', '.png', 'email', '', '', '2019-03-02 01:24:08', '2019-03-01 18:24:08', NULL, '2.0', 'android', 'd8wLcBNEwIw:APA91bEEKi-XWLUr54X8BB2yJRH3zVsUIigIMi4_ujAqekgzSbgcEQH_fDpqC1WyOWL9VzXHmBYMhcdPEKgpdMpesBWziizzev8TaWiG_4djoXSx5SYK5TB4H6s1A4KupgdSwK_fe3yR', NULL, 5, 'ACTIVE', NULL),
(204, 'dno5cWduSmxnVmU0KzZ1ZnV0NVpBRlcwM3daV1oxRGFhTlhobWdIQ0RVTT0=', 'Chinedu', 'Ofor', 'chinedu.ofor@andela.com', '101491976424361212858', 0, '00000000000', 'nigeria', 5, '', '.png', 'email', 'email', NULL, '2019-03-02 16:44:05', '2019-03-02 09:44:05', 'clHlztDw4ME:APA91bHEslopMoH91zdTtWkxsTsaUSDPsFldMsfJ-TPHr0uTzL805bP2_ea6du_LyYVMEZKGSouIf5zQtc98UxImowIbcNE12XgZubAI7Cyswvzbe_v6DDcSwvoH5TqbKbCw1Rd3Xjsg', '2.0', 'iOS', NULL, NULL, 5, 'ACTIVE', NULL),
(205, 'dno5cWduSmxnVmU0KzZ1ZnV0NVpBTzl0eGc5R0JlRFQrd3hhSjIzMnVGOD0=', 'Chi', 'Ofor', 'chi@ofor.com', 'cccccc', 2, '07030296746', '+234', 3, 'null', 'null.png', 'email', NULL, NULL, '2019-03-02 18:27:04', '2019-03-02 11:27:04', 'dzETNxtZ2O4:APA91bH5I2CfnpBeW9KFbCqJLgxG7kFGsghzQsVnzmcgr1mzc5ds3YRVxiw56t8fKoEEkGewBAZIVUYOnUAKBgoh30i6W4Jux0s-oO6xX-jKEGYW0ftHpmZ2AO6jdh92BPfqbqhwOmAl', '2.0', 'iOS', 'dzETNxtZ2O4:APA91bH5I2CfnpBeW9KFbCqJLgxG7kFGsghzQsVnzmcgr1mzc5ds3YRVxiw56t8fKoEEkGewBAZIVUYOnUAKBgoh30i6W4Jux0s-oO6xX-jKEGYW0ftHpmZ2AO6jdh92BPfqbqhwOmAl', NULL, 5, 'ACTIVE', NULL),
(206, 'dno5cWduSmxnVmU0KzZ1ZnV0NVpBTFMwWkhxNzh3Z243T0xEMVl2T1JkRT0=', 'Chinese', 'Ofor', 'c@e1.com', 'cccccc', 2, '07030296746', '+234', 3, 'null', 'null.png', 'email', NULL, NULL, '2019-03-02 18:28:31', '2019-03-02 11:28:31', 'dzETNxtZ2O4:APA91bH5I2CfnpBeW9KFbCqJLgxG7kFGsghzQsVnzmcgr1mzc5ds3YRVxiw56t8fKoEEkGewBAZIVUYOnUAKBgoh30i6W4Jux0s-oO6xX-jKEGYW0ftHpmZ2AO6jdh92BPfqbqhwOmAl', '2.0', 'iOS', 'dzETNxtZ2O4:APA91bH5I2CfnpBeW9KFbCqJLgxG7kFGsghzQsVnzmcgr1mzc5ds3YRVxiw56t8fKoEEkGewBAZIVUYOnUAKBgoh30i6W4Jux0s-oO6xX-jKEGYW0ftHpmZ2AO6jdh92BPfqbqhwOmAl', NULL, 5, 'ACTIVE', NULL),
(207, 'dno5cWduSmxnVmU0KzZ1ZnV0NVpBSGFObWVhN09jdXRxVW9FNml3NzJmVT0=', 'Chinese', 'Ofor', 'chinex4chicks@yahoo.com', 'cccccc', 2, '07030296746', '+234', 3, 'null', 'null.png', 'email', NULL, NULL, '2019-03-02 18:29:38', '2019-03-02 11:29:38', 'dzETNxtZ2O4:APA91bH5I2CfnpBeW9KFbCqJLgxG7kFGsghzQsVnzmcgr1mzc5ds3YRVxiw56t8fKoEEkGewBAZIVUYOnUAKBgoh30i6W4Jux0s-oO6xX-jKEGYW0ftHpmZ2AO6jdh92BPfqbqhwOmAl', '2.0', 'iOS', 'dzETNxtZ2O4:APA91bH5I2CfnpBeW9KFbCqJLgxG7kFGsghzQsVnzmcgr1mzc5ds3YRVxiw56t8fKoEEkGewBAZIVUYOnUAKBgoh30i6W4Jux0s-oO6xX-jKEGYW0ftHpmZ2AO6jdh92BPfqbqhwOmAl', NULL, 5, 'ACTIVE', NULL),
(208, 'dno5cWduSmxnVmU0KzZ1ZnV0NVpBS2o4M1lSbi9DcHkzMVV0RUtMNFV4Yz0=', 'test', 'test', 'tested@gmail.com', 'test123', 1, '1234567890', '+234', 5, '', '.png', 'email', '', '', '2019-03-02 20:31:21', '2019-03-02 13:31:21', NULL, '2.0', 'android', 'cZXe2PGWHXM:APA91bEi47hjgG3pkQxHXAJk6izTGtm3OEGpS46lc3x2g1TVQLCQ5R_mxRYDdAB66IyN7DJCm3DcaFQAxo_sGBEFuaKyavH24ic3afOLEnEEVc8Pc2Gvs_WQWGvmWc0YoH9vhIA2sm6z', NULL, 5, 'ACTIVE', NULL),
(209, 'cTJsWlNSbFphci85blovTS9XOXlyb1JyWEROTXFwQm1qNlBYT0FMNGdYND0=', 'Chinedu', 'Ofor', 'fg@xc.com', 'cccccc', 1, '08033047770', '+234', 4, 'male', 'male.png', 'email', 'email', 'email', '2019-03-03 00:12:56', '2019-03-02 17:13:40', 'cb9Rt00zcJY:APA91bEEkXpRlZdnosNJPmf8K5UGNZMG-9A4a_IynrVBFQFIq-4YJvMFKLNqh1FES4OA24Vv6_9EHAGNMxkkRKDqAongjiNBB-qn3IEcpg2xc2oZkPn99lUtZQhiPKlroXY5HonBmPfj', '1.02', 'android', 'cb9Rt00zcJY:APA91bEEkXpRlZdnosNJPmf8K5UGNZMG-9A4a_IynrVBFQFIq-4YJvMFKLNqh1FES4OA24Vv6_9EHAGNMxkkRKDqAongjiNBB-qn3IEcpg2xc2oZkPn99lUtZQhiPKlroXY5HonBmPfj', NULL, 5, 'ACTIVE', NULL),
(210, 'UlIwQ0xiTk04NXhMeStLUVU0UUkyeXNmeFpRUndVOW43MktuNE1XZnY2UT0=', 'chinedu', 'Ofor', 'gg@gg.com', 'cccccc', 1, '078704648125', '+234', 4, 'female', 'female.png', 'email', 'email', 'email', '2019-03-03 00:16:42', '2019-03-02 17:17:09', 'cb9Rt00zcJY:APA91bEEkXpRlZdnosNJPmf8K5UGNZMG-9A4a_IynrVBFQFIq-4YJvMFKLNqh1FES4OA24Vv6_9EHAGNMxkkRKDqAongjiNBB-qn3IEcpg2xc2oZkPn99lUtZQhiPKlroXY5HonBmPfj', '1.02', 'android', 'cb9Rt00zcJY:APA91bEEkXpRlZdnosNJPmf8K5UGNZMG-9A4a_IynrVBFQFIq-4YJvMFKLNqh1FES4OA24Vv6_9EHAGNMxkkRKDqAongjiNBB-qn3IEcpg2xc2oZkPn99lUtZQhiPKlroXY5HonBmPfj', NULL, 5, 'ACTIVE', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_login_logs`
--

CREATE TABLE `user_login_logs` (
  `ull_id` int(11) NOT NULL,
  `ull_user_id` int(11) NOT NULL,
  `ull_login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ull_logout_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ull_device_id` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_login_logs`
--

INSERT INTO `user_login_logs` (`ull_id`, `ull_user_id`, `ull_login_time`, `ull_logout_time`, `ull_device_id`) VALUES
(1, 1, '2018-09-20 11:55:10', '2018-09-20 07:25:10', 'fNiygai8zwI:APA91bFUMDovvnhQ0WVs-uwiyu5d9JerEYZiv5bb1Qoa4GY5DhhuSrTtiO2nkyob3XPgKzzbS4-W6RG73iMQkGFlUgBKQpv7JG10jIBhP89CrKmSz91QD1CkAJz3WboIrXavfzhthMO8'),
(2, 1, '2018-09-20 11:59:47', '2018-09-20 07:29:47', 'fNiygai8zwI:APA91bFUMDovvnhQ0WVs-uwiyu5d9JerEYZiv5bb1Qoa4GY5DhhuSrTtiO2nkyob3XPgKzzbS4-W6RG73iMQkGFlUgBKQpv7JG10jIBhP89CrKmSz91QD1CkAJz3WboIrXavfzhthMO8'),
(3, 1, '2018-09-20 13:54:56', '2018-09-20 09:24:56', '82c263f4d10e598931230546a8884f85c1de992750f68ae88f84030a9dd4df88'),
(4, 1, '2018-09-20 14:00:15', '2018-09-20 09:30:15', 'fNiygai8zwI:APA91bFUMDovvnhQ0WVs-uwiyu5d9JerEYZiv5bb1Qoa4GY5DhhuSrTtiO2nkyob3XPgKzzbS4-W6RG73iMQkGFlUgBKQpv7JG10jIBhP89CrKmSz91QD1CkAJz3WboIrXavfzhthMO8'),
(5, 4, '2018-09-20 14:00:52', '2018-09-20 09:30:52', '4c8ac3f5541f101fa5757ce72007d2d58718e82c9fa2febb177dc7ab5c2ae990'),
(6, 1, '2018-09-20 14:12:04', '2018-09-20 09:42:04', 'fNiygai8zwI:APA91bFUMDovvnhQ0WVs-uwiyu5d9JerEYZiv5bb1Qoa4GY5DhhuSrTtiO2nkyob3XPgKzzbS4-W6RG73iMQkGFlUgBKQpv7JG10jIBhP89CrKmSz91QD1CkAJz3WboIrXavfzhthMO8'),
(7, 1, '2018-09-20 15:47:01', '2018-09-20 11:17:01', '82c263f4d10e598931230546a8884f85c1de992750f68ae88f84030a9dd4df88'),
(8, 7, '2018-09-20 16:18:55', '2018-09-20 11:48:55', '82c263f4d10e598931230546a8884f85c1de992750f68ae88f84030a9dd4df88'),
(9, 1, '2018-09-20 16:33:09', '2018-09-20 12:03:09', 'fNiygai8zwI:APA91bFUMDovvnhQ0WVs-uwiyu5d9JerEYZiv5bb1Qoa4GY5DhhuSrTtiO2nkyob3XPgKzzbS4-W6RG73iMQkGFlUgBKQpv7JG10jIBhP89CrKmSz91QD1CkAJz3WboIrXavfzhthMO8'),
(10, 1, '2018-09-21 10:33:50', '2018-09-21 06:03:50', 'cJ3wR1csNyk:APA91bGvH8Z0Gph20ADK9kjHNlH5TXqytiw-0uT3oeULM03wJSOHiy8wfkPbBuh_-KRFfkZoU1wS8LbEXSOEOj-mnFmRWp50TPCzQQu8gLaZZbn8DSyXSQn45vb0GUMTf1lw2zvYfOD6458KnxEfmOrXD1AFPuDdsg'),
(11, 1, '2018-09-21 13:46:02', '2018-09-21 09:16:02', 'fnVMN7JJClI:APA91bGNrVxoKTaxIbBM5ECjXJCiYN0xFu8hK5wdenPLUmkNeEWh7fdvI3uL7UOnYYZE-2ML8sRE-6e1Nki76qhYdxrfbtDM1ZaUD--udwFOUsDSheXwXeNigbIiiI1NwabgwLC2sG2RWUAF95HDDrkEEcqjBetOXg'),
(12, 4, '2018-09-21 15:59:10', '2018-09-21 11:29:10', 'd91ff3d879afcc1e434f85b291308e8fd6efa43ae61174c2e799ccb1945086e3'),
(13, 7, '2018-09-21 18:05:40', '2018-09-21 13:35:40', '77099257dba40369baf9c1dd315e4ace00f63f7e84869b4301de30c599fac47c'),
(14, 1, '2018-09-21 18:14:36', '2018-09-21 13:44:36', ''),
(15, 1, '2018-09-21 18:17:06', '2018-09-21 13:47:06', '77099257dba40369baf9c1dd315e4ace00f63f7e84869b4301de30c599fac47c'),
(16, 11, '2018-09-21 18:25:05', '2018-09-21 13:55:05', ''),
(17, 11, '2018-09-21 18:40:31', '2018-09-21 14:10:31', 'fzXLtc0fTLg:APA91bEYROpRw5YLrFMSDVAvV7JkL_sDNARPIBrbmXpkuaRNPWob3DFxD4U80npYd33-FQnm0IAAX0EPzvPK0n1qDclSomaIUrfgfaGBpmg1Em8DREPcx8YqegeL6Ri75Ti9761qrZlT'),
(18, 13, '2018-09-21 19:27:15', '2018-09-21 14:57:15', '263e5ce2948edde5ad7fbf2118c44d092d7090e5652ae691e866ce872f05d99a'),
(19, 13, '2018-09-22 19:50:10', '2018-09-22 15:20:10', 'dFwC2hhOfg0:APA91bHQy3y5dbMDG85ZayhUsIPy_-BEy4dCK0DeKrokVNaNxq2zIUf9eQbbriHfcYpoIKl8DJPNjGN443cIdKMPG34O3VZN4ExYrVem51dmM881pi_ftMP2FvALkSQDJDDgek-OC7lJ'),
(20, 1, '2018-09-24 11:01:41', '2018-09-24 06:31:41', 'fNiygai8zwI:APA91bFUMDovvnhQ0WVs-uwiyu5d9JerEYZiv5bb1Qoa4GY5DhhuSrTtiO2nkyob3XPgKzzbS4-W6RG73iMQkGFlUgBKQpv7JG10jIBhP89CrKmSz91QD1CkAJz3WboIrXavfzhthMO8'),
(21, 4, '2018-09-24 11:15:45', '2018-09-24 06:45:45', '98289adecd76f635d1aeea210bebdfcab21dab76a28e32f5d60640f18600171e'),
(22, 25, '2018-09-25 12:37:51', '2018-09-25 08:07:51', 'cJ3wR1csNyk:APA91bGvH8Z0Gph20ADK9kjHNlH5TXqytiw-0uT3oeULM03wJSOHiy8wfkPbBuh_-KRFfkZoU1wS8LbEXSOEOj-mnFmRWp50TPCzQQu8gLaZZbn8DSyXSQn45vb0GUMTf1lw2zvYfOD6458KnxEfmOrXD1AFPuDdsg'),
(23, 25, '2018-09-25 14:06:44', '2018-09-25 09:36:44', 'cJ3wR1csNyk:APA91bGvH8Z0Gph20ADK9kjHNlH5TXqytiw-0uT3oeULM03wJSOHiy8wfkPbBuh_-KRFfkZoU1wS8LbEXSOEOj-mnFmRWp50TPCzQQu8gLaZZbn8DSyXSQn45vb0GUMTf1lw2zvYfOD6458KnxEfmOrXD1AFPuDdsg'),
(24, 11, '2018-09-25 17:16:33', '2018-09-25 12:46:33', ''),
(25, 25, '2018-09-25 18:17:13', '2018-09-25 13:47:13', 'ab123456'),
(26, 25, '2018-09-25 18:18:01', '2018-09-25 13:48:01', 'fNiygai8zwI:APA91bFUMDovvnhQ0WVs-uwiyu5d9JerEYZiv5bb1Qoa4GY5DhhuSrTtiO2nkyob3XPgKzzbS4-W6RG73iMQkGFlUgBKQpv7JG10jIBhP89CrKmSz91QD1CkAJz3WboIrXavfzhthMO8'),
(27, 28, '2018-09-26 10:54:59', '2018-09-26 06:24:59', ''),
(28, 4, '2018-09-26 12:38:14', '2018-09-26 08:08:14', 'fUVenPrdsa0:APA91bG6zC3PWqpXm8ObZ5Qxkg8UdqiKCkMh6i2r7KHRPx90C8FszzWmff59rNI9ADmrcnc3d8UlOk9802Ho5WzBjyVt3jOMnppSwhEGPVCh2McQrcMIypO0FPZOoBDmSarl3vXvqh7n'),
(29, 25, '2018-09-26 13:19:01', '2018-09-26 08:49:01', ''),
(30, 4, '2018-09-26 14:52:02', '2018-09-26 10:22:02', 'ab123456'),
(31, 25, '2018-09-26 17:13:08', '2018-09-26 12:43:08', '82c263f4d10e598931230546a8884f85c1de992750f68ae88f84030a9dd4df88'),
(32, 4, '2018-09-26 17:22:56', '2018-09-26 12:52:56', '4c8ac3f5541f101fa5757ce72007d2d58718e82c9fa2febb177dc7ab5c2ae990'),
(33, 25, '2018-09-26 17:24:35', '2018-09-26 12:54:35', '82c263f4d10e598931230546a8884f85c1de992750f68ae88f84030a9dd4df88'),
(34, 11, '2018-09-26 17:25:06', '2018-09-26 12:55:06', 'fUVenPrdsa0:APA91bG6zC3PWqpXm8ObZ5Qxkg8UdqiKCkMh6i2r7KHRPx90C8FszzWmff59rNI9ADmrcnc3d8UlOk9802Ho5WzBjyVt3jOMnppSwhEGPVCh2McQrcMIypO0FPZOoBDmSarl3vXvqh7n'),
(35, 4, '2018-09-26 17:49:47', '2018-09-26 13:19:47', '4c8ac3f5541f101fa5757ce72007d2d58718e82c9fa2febb177dc7ab5c2ae990'),
(36, 4, '2018-09-26 18:00:46', '2018-09-26 13:30:46', 'dyaOzXn_AnQ:APA91bEFVuV6vyWJw6ufFX8KSA7CY8LFB4NtWXVFtANscmIULu1_Q5SNS5gUr5yVFcNenEqqDheLEPkmMYEI9X-dsM8voOfZprmbudbRCW1rhQ6VNanD-4ObrqRf8PxDgTwpDH_FFc_3'),
(37, 43, '2018-09-26 19:16:33', '2018-09-26 14:46:33', 'cvel39Esh5M:APA91bGtqa1ygqc4TIYnUyHXHL_qoqtS-PlDp8ZiIFMcTSJRrOrzzhnDX07YrG19gNGTg83IQKtltYHBcYaqzm-6PPnHjfqwA73q63wFfyCJ-0Z1eyUp__Pom6NBGurBqn5TuvQA2GgW'),
(38, 44, '2018-09-26 19:16:57', '2018-09-26 14:46:57', 'cvel39Esh5M:APA91bGtqa1ygqc4TIYnUyHXHL_qoqtS-PlDp8ZiIFMcTSJRrOrzzhnDX07YrG19gNGTg83IQKtltYHBcYaqzm-6PPnHjfqwA73q63wFfyCJ-0Z1eyUp__Pom6NBGurBqn5TuvQA2GgW'),
(39, 13, '2018-09-26 19:47:54', '2018-09-26 15:17:54', 'dAyNtomEA2A:APA91bFAD_0Rh4En_EF-meMAC-ZTHDEVXFODpZj-f8vlaBmmjD4S7nAgAADNJkrPkRz_w9PwQ4tAV3mk19CE7XXPN0HncQtQq-LlRbVFbkgsKpb1fkZziGkj2bmdE8_9_sIkq9wxIDVN'),
(40, 13, '2018-09-26 19:55:28', '2018-09-26 15:25:28', 'f_BxWMBmtZM:APA91bHn7QArXn68eq6SZHVUkW85mlAsUqBkgYwSEn3oXbuxYTELxRnXNZaxQp4ntIMU2tljsya4FC98cLb3xmmyozf1ScA2AmCcYlRVmTyLM5bGnyI_IXwbaUpWwC9dY-j8FJKtopgK'),
(41, 50, '2018-09-27 08:59:52', '2018-09-27 04:29:52', 'fNiygai8zwI:APA91bFUMDovvnhQ0WVs-uwiyu5d9JerEYZiv5bb1Qoa4GY5DhhuSrTtiO2nkyob3XPgKzzbS4-W6RG73iMQkGFlUgBKQpv7JG10jIBhP89CrKmSz91QD1CkAJz3WboIrXavfzhthMO8'),
(42, 25, '2018-09-27 09:00:22', '2018-09-27 04:30:22', 'fNiygai8zwI:APA91bFUMDovvnhQ0WVs-uwiyu5d9JerEYZiv5bb1Qoa4GY5DhhuSrTtiO2nkyob3XPgKzzbS4-W6RG73iMQkGFlUgBKQpv7JG10jIBhP89CrKmSz91QD1CkAJz3WboIrXavfzhthMO8'),
(43, 50, '2018-09-27 09:02:22', '2018-09-27 04:32:22', 'ab123456'),
(44, 25, '2018-09-27 09:22:43', '2018-09-27 04:52:43', 'fNiygai8zwI:APA91bFUMDovvnhQ0WVs-uwiyu5d9JerEYZiv5bb1Qoa4GY5DhhuSrTtiO2nkyob3XPgKzzbS4-W6RG73iMQkGFlUgBKQpv7JG10jIBhP89CrKmSz91QD1CkAJz3WboIrXavfzhthMO8'),
(45, 4, '2018-09-27 10:17:19', '2018-09-27 05:47:19', '4c8ac3f5541f101fa5757ce72007d2d58718e82c9fa2febb177dc7ab5c2ae990'),
(46, 4, '2018-09-27 10:18:35', '2018-09-27 05:48:35', '4c8ac3f5541f101fa5757ce72007d2d58718e82c9fa2febb177dc7ab5c2ae990'),
(47, 25, '2018-09-27 12:34:09', '2018-09-27 08:04:09', 'fNiygai8zwI:APA91bFUMDovvnhQ0WVs-uwiyu5d9JerEYZiv5bb1Qoa4GY5DhhuSrTtiO2nkyob3XPgKzzbS4-W6RG73iMQkGFlUgBKQpv7JG10jIBhP89CrKmSz91QD1CkAJz3WboIrXavfzhthMO8'),
(48, 52, '2018-09-27 14:18:24', '2018-09-27 09:48:24', 'fNiygai8zwI:APA91bFUMDovvnhQ0WVs-uwiyu5d9JerEYZiv5bb1Qoa4GY5DhhuSrTtiO2nkyob3XPgKzzbS4-W6RG73iMQkGFlUgBKQpv7JG10jIBhP89CrKmSz91QD1CkAJz3WboIrXavfzhthMO8'),
(49, 25, '2018-09-27 14:22:49', '2018-09-27 09:52:49', 'fNiygai8zwI:APA91bFUMDovvnhQ0WVs-uwiyu5d9JerEYZiv5bb1Qoa4GY5DhhuSrTtiO2nkyob3XPgKzzbS4-W6RG73iMQkGFlUgBKQpv7JG10jIBhP89CrKmSz91QD1CkAJz3WboIrXavfzhthMO8'),
(50, 25, '2018-09-27 14:26:50', '2018-09-27 09:56:50', ''),
(51, 52, '2018-09-27 14:45:47', '2018-09-27 10:15:47', 'fNiygai8zwI:APA91bFUMDovvnhQ0WVs-uwiyu5d9JerEYZiv5bb1Qoa4GY5DhhuSrTtiO2nkyob3XPgKzzbS4-W6RG73iMQkGFlUgBKQpv7JG10jIBhP89CrKmSz91QD1CkAJz3WboIrXavfzhthMO8'),
(52, 52, '2018-09-27 14:59:04', '2018-09-27 10:29:04', 'fNiygai8zwI:APA91bFUMDovvnhQ0WVs-uwiyu5d9JerEYZiv5bb1Qoa4GY5DhhuSrTtiO2nkyob3XPgKzzbS4-W6RG73iMQkGFlUgBKQpv7JG10jIBhP89CrKmSz91QD1CkAJz3WboIrXavfzhthMO8'),
(53, 25, '2018-09-27 14:59:25', '2018-09-27 10:29:25', 'fNiygai8zwI:APA91bFUMDovvnhQ0WVs-uwiyu5d9JerEYZiv5bb1Qoa4GY5DhhuSrTtiO2nkyob3XPgKzzbS4-W6RG73iMQkGFlUgBKQpv7JG10jIBhP89CrKmSz91QD1CkAJz3WboIrXavfzhthMO8'),
(54, 52, '2018-09-27 15:13:45', '2018-09-27 10:43:45', 'fNiygai8zwI:APA91bFUMDovvnhQ0WVs-uwiyu5d9JerEYZiv5bb1Qoa4GY5DhhuSrTtiO2nkyob3XPgKzzbS4-W6RG73iMQkGFlUgBKQpv7JG10jIBhP89CrKmSz91QD1CkAJz3WboIrXavfzhthMO8'),
(55, 52, '2018-09-27 16:27:01', '2018-09-27 11:57:01', 'fNiygai8zwI:APA91bFUMDovvnhQ0WVs-uwiyu5d9JerEYZiv5bb1Qoa4GY5DhhuSrTtiO2nkyob3XPgKzzbS4-W6RG73iMQkGFlUgBKQpv7JG10jIBhP89CrKmSz91QD1CkAJz3WboIrXavfzhthMO8'),
(56, 52, '2018-09-27 16:48:37', '2018-09-27 12:18:37', 'fNiygai8zwI:APA91bFUMDovvnhQ0WVs-uwiyu5d9JerEYZiv5bb1Qoa4GY5DhhuSrTtiO2nkyob3XPgKzzbS4-W6RG73iMQkGFlUgBKQpv7JG10jIBhP89CrKmSz91QD1CkAJz3WboIrXavfzhthMO8'),
(57, 25, '2018-09-27 16:59:24', '2018-09-27 12:29:24', 'fNiygai8zwI:APA91bFUMDovvnhQ0WVs-uwiyu5d9JerEYZiv5bb1Qoa4GY5DhhuSrTtiO2nkyob3XPgKzzbS4-W6RG73iMQkGFlUgBKQpv7JG10jIBhP89CrKmSz91QD1CkAJz3WboIrXavfzhthMO8'),
(58, 52, '2018-09-27 17:29:17', '2018-09-27 12:59:17', 'ce7584c5cfe3afad301648b471a7623fe0e5ed8678a801966b9b62ee21b07d13'),
(59, 52, '2018-09-27 17:38:09', '2018-09-27 13:08:09', 'fNiygai8zwI:APA91bFUMDovvnhQ0WVs-uwiyu5d9JerEYZiv5bb1Qoa4GY5DhhuSrTtiO2nkyob3XPgKzzbS4-W6RG73iMQkGFlUgBKQpv7JG10jIBhP89CrKmSz91QD1CkAJz3WboIrXavfzhthMO8'),
(60, 52, '2018-09-27 17:52:59', '2018-09-27 13:22:59', 'ce7584c5cfe3afad301648b471a7623fe0e5ed8678a801966b9b62ee21b07d13'),
(61, 4, '2018-09-27 17:56:01', '2018-09-27 13:26:01', 'ab123456'),
(62, 4, '2018-09-27 17:56:27', '2018-09-27 13:26:27', 'fUVenPrdsa0:APA91bG6zC3PWqpXm8ObZ5Qxkg8UdqiKCkMh6i2r7KHRPx90C8FszzWmff59rNI9ADmrcnc3d8UlOk9802Ho5WzBjyVt3jOMnppSwhEGPVCh2McQrcMIypO0FPZOoBDmSarl3vXvqh7n'),
(63, 52, '2018-09-27 18:03:07', '2018-09-27 13:33:07', 'fNiygai8zwI:APA91bFUMDovvnhQ0WVs-uwiyu5d9JerEYZiv5bb1Qoa4GY5DhhuSrTtiO2nkyob3XPgKzzbS4-W6RG73iMQkGFlUgBKQpv7JG10jIBhP89CrKmSz91QD1CkAJz3WboIrXavfzhthMO8'),
(64, 54, '2018-09-27 19:10:12', '2018-09-27 14:40:12', 'cuazwYyu_5Y:APA91bFb3tMO3BtGZFGHstpr6FRXzJ8BeI6i2dcjlMLBg4AtPgJDLaf4m2fa1r0k7NyVqW-A80LKGWOTnkQbp63OYVOTr44z3C-X0MaYUiKG60zR0ogsuDm-PHbWeTUo2juusVRiPXBn'),
(65, 59, '2018-09-28 12:50:07', '2018-09-28 08:20:07', 'dgByDezeAro:APA91bFFZsbZ_FxIYGknTC-9Lkrode5hLdsktiO8-ph47aJAG6iVK8Cdi88w9_jkF5NTd1GbCpVsBdxqKSRbjt3uvVJFqV7x2wYlsykgAXQgij1JabNcZORW2knDSipqYfc2HloBsDrT'),
(66, 61, '2018-09-28 13:12:51', '2018-09-28 08:42:51', '263e5ce2948edde5ad7fbf2118c44d092d7090e5652ae691e866ce872f05d99a'),
(67, 4, '2018-09-28 12:33:18', '2018-09-28 12:33:18', 'dyaOzXn_AnQ:APA91bEFVuV6vyWJw6ufFX8KSA7CY8LFB4NtWXVFtANscmIULu1_Q5SNS5gUr5yVFcNenEqqDheLEPkmMYEI9X-dsM8voOfZprmbudbRCW1rhQ6VNanD-4ObrqRf8PxDgTwpDH_FFc_3'),
(68, 4, '2018-09-28 12:48:46', '2018-09-28 12:48:46', '4c8ac3f5541f101fa5757ce72007d2d58718e82c9fa2febb177dc7ab5c2ae990'),
(69, 11, '2018-09-28 12:56:03', '2018-09-28 12:56:03', 'dyaOzXn_AnQ:APA91bEFVuV6vyWJw6ufFX8KSA7CY8LFB4NtWXVFtANscmIULu1_Q5SNS5gUr5yVFcNenEqqDheLEPkmMYEI9X-dsM8voOfZprmbudbRCW1rhQ6VNanD-4ObrqRf8PxDgTwpDH_FFc_3'),
(70, 4, '2018-10-01 11:23:38', '2018-10-01 11:23:38', '263dd4e9b606ff4e6e33de360b406d77d22e4aabbca767998755c765142f9cd1'),
(71, 4, '2018-10-03 04:34:42', '2018-10-03 04:34:42', 'd89824b16a4ac9b5cba5876b94ebac3537d696faf179a2939c939fb019965f3d'),
(72, 4, '2018-10-03 04:35:46', '2018-10-03 04:35:46', 'd89824b16a4ac9b5cba5876b94ebac3537d696faf179a2939c939fb019965f3d'),
(73, 4, '2018-10-03 04:38:40', '2018-10-03 04:38:40', '927b1f9b72efd51aceca7c6bd0d8945f7026940c9fcb3dc5f226b8ceedd7e984'),
(74, 4, '2018-10-03 04:42:39', '2018-10-03 04:42:39', 'dd26f59bf7a8783e79bc866980729fda42b87d9ac0f87c57fb0ad353fac78d5b'),
(75, 4, '2018-10-03 04:48:55', '2018-10-03 04:48:55', '8d3af120bff5a63c6d9226f86a8f6ee10ecfad5e00c5405e51fd267a504f3631'),
(76, 25, '2018-10-03 04:57:09', '2018-10-03 04:57:09', ''),
(77, 4, '2018-10-03 05:02:03', '2018-10-03 05:02:03', ''),
(78, 4, '2018-10-03 05:03:37', '2018-10-03 05:03:37', '262c8f0d486c18e73f91a88bf8df36e850c5a98b5fed41053b1e532bb11dc162'),
(79, 4, '2018-10-03 05:11:55', '2018-10-03 05:11:55', '974bc166bbcc01ec3e0f6b7e164be4378c5bcac2aca6e817f8160d67a32285fb'),
(80, 4, '2018-10-03 10:38:01', '2018-10-03 10:38:01', ''),
(81, 4, '2018-10-03 10:39:24', '2018-10-03 10:39:24', '262c8f0d486c18e73f91a88bf8df36e850c5a98b5fed41053b1e532bb11dc162'),
(82, 62, '2018-10-03 13:12:28', '2018-10-03 13:12:28', 'dgByDezeAro:APA91bFFZsbZ_FxIYGknTC-9Lkrode5hLdsktiO8-ph47aJAG6iVK8Cdi88w9_jkF5NTd1GbCpVsBdxqKSRbjt3uvVJFqV7x2wYlsykgAXQgij1JabNcZORW2knDSipqYfc2HloBsDrT'),
(83, 4, '2018-10-03 13:12:58', '2018-10-03 13:12:58', '262c8f0d486c18e73f91a88bf8df36e850c5a98b5fed41053b1e532bb11dc162'),
(84, 4, '2018-10-04 04:51:04', '2018-10-04 04:51:04', '0e69204c9cfa2e26e064a342375b823d24fec14ce275a3e68f7cc73f263e8e2a'),
(85, 25, '2018-10-04 09:08:50', '2018-10-04 09:08:50', 'dgByDezeAro:APA91bFFZsbZ_FxIYGknTC-9Lkrode5hLdsktiO8-ph47aJAG6iVK8Cdi88w9_jkF5NTd1GbCpVsBdxqKSRbjt3uvVJFqV7x2wYlsykgAXQgij1JabNcZORW2knDSipqYfc2HloBsDrT'),
(86, 4, '2018-10-04 11:20:00', '2018-10-04 11:20:00', '0e69204c9cfa2e26e064a342375b823d24fec14ce275a3e68f7cc73f263e8e2a'),
(87, 4, '2018-10-04 11:23:31', '2018-10-04 11:23:31', '87b4c557ae3c4b41d1b53622c5b7d008fa89225f3391f62b39b237e0946bf674'),
(88, 25, '2018-10-04 11:24:23', '2018-10-04 11:24:23', 'd3238b5d6166ede0b52b3485041e1d7ac9d9a9724f05728710911c975b8f445d'),
(89, 25, '2018-10-04 11:58:34', '2018-10-04 11:58:34', 'd3238b5d6166ede0b52b3485041e1d7ac9d9a9724f05728710911c975b8f445d'),
(90, 25, '2018-10-04 11:59:34', '2018-10-04 11:59:34', 'd3238b5d6166ede0b52b3485041e1d7ac9d9a9724f05728710911c975b8f445d'),
(91, 12, '2018-10-04 12:41:08', '2018-10-04 12:41:08', '87b4c557ae3c4b41d1b53622c5b7d008fa89225f3391f62b39b237e0946bf674'),
(92, 4, '2018-10-04 13:24:29', '2018-10-04 13:24:29', 'cbb9cd0bfe548b4462c02fd4276c67f65b3d884eb8106e6b91c1a26323605080'),
(93, 4, '2018-10-05 08:46:46', '2018-10-05 08:46:46', 'f4a800e32653dc89eb4439e3924c2d230826a2eb74411ebf27842633673a1164'),
(94, 69, '2018-10-05 09:53:10', '2018-10-05 09:53:10', 'c9d7ca18442e62a11dcb2da8334777b8ea4868d3b081db8ca0d0ef1aa659560d'),
(95, 25, '2018-10-08 11:55:27', '2018-10-08 11:55:27', 'dgByDezeAro:APA91bFFZsbZ_FxIYGknTC-9Lkrode5hLdsktiO8-ph47aJAG6iVK8Cdi88w9_jkF5NTd1GbCpVsBdxqKSRbjt3uvVJFqV7x2wYlsykgAXQgij1JabNcZORW2knDSipqYfc2HloBsDrT'),
(96, 69, '2018-10-09 09:02:24', '2018-10-09 09:02:24', '3cf9f387fee68d326de2abcd47bd68d7b5b8ca69f73906d185272542f7decd4a'),
(97, 69, '2018-10-09 13:22:08', '2018-10-09 13:22:08', '00c2e6bb8cd611a15f53095ce016be4d049930174f7faf255cd646230a02877a'),
(98, 4, '2018-10-09 14:43:39', '2018-10-09 14:43:39', 'f4a800e32653dc89eb4439e3924c2d230826a2eb74411ebf27842633673a1164'),
(99, 13, '2018-10-09 17:10:12', '2018-10-09 17:10:12', 'cYwxucFzpow:APA91bH7bh_0jDG5H4Lv7akFlbrzxsf2QCFtHdeEiyZhNQ8HaqyFzsPNmfzb7ov-LDt91HPu7Dz6ZzwLd2WRajAu9r57IFlwwCFlqqRkAlo_TDMWJPgj2J5g8uS9H_-uJKNQ24T040Wy'),
(100, 5, '2018-10-09 21:35:21', '2018-10-09 21:35:21', '6b773a167ddd15a84c572485aff7f3027b97c32985e962202d0935a75beb3e93'),
(101, 4, '2018-10-10 04:41:09', '2018-10-10 04:41:09', 'e6jXs499_Zw:APA91bHLLXF8TQGU7y5ORBSJIt280226TvoL2G4ha956icjUw8c0TJ0B0svZPAlMpC9Tfzxk7OREWVFXvJyWg3ba4QxxP4DcJBdikN9pkxtw_Hjj-pLUuIJdOzpdhR_JuzsMBO8BHnAj'),
(102, 4, '2018-10-10 06:22:32', '2018-10-10 06:22:32', 'e6jXs499_Zw:APA91bHLLXF8TQGU7y5ORBSJIt280226TvoL2G4ha956icjUw8c0TJ0B0svZPAlMpC9Tfzxk7OREWVFXvJyWg3ba4QxxP4DcJBdikN9pkxtw_Hjj-pLUuIJdOzpdhR_JuzsMBO8BHnAj'),
(103, 5, '2018-10-12 17:43:28', '2018-10-12 17:43:28', '6d0de82783c28fd30544f4cd19f59f73545960666b9e8db2ee6e1b39ee076052'),
(104, 73, '2018-10-13 19:05:38', '2018-10-13 19:05:38', 'cRF3fL7CdUM:APA91bEO7MtYcFYsUbmyoyUaf8REi26laO6NGgfN_ubrjVYiWoGnRnMpWTk7d6sgb05LHzOrCi1ksQKi0ekr__AIJLAzne-jnxzJtNeyUH7gD6C-ZBK2TwnGZyvaZDBjDbuEyVGiPSVR'),
(105, 11, '2018-10-15 04:15:10', '2018-10-15 04:15:10', 'f5sNLSC4cCo:APA91bGrqg5dIswrmyyGx6Cx-MWwbfPsdVWvLioul-ZRpVFxhRf8y-5p240KuisJNRZrZRva2VtrrwOaHxHiLVFj-ieOcC4lKpQWqVT8CdboMU9v582zz3AbN-GUSi8d67G-VXJzaOBA'),
(106, 11, '2018-10-15 04:18:46', '2018-10-15 04:18:46', 'eZLLyVQ7LkA:APA91bGdM1oqhlVsRHrdMbY8JCjab_1-hSKT97q29JMRiNxKGsoWTWiuv17JH4xjNALdQUElsBp3HzcVINLVAV8rlUoiBGyenmyOt4xpoDRqeRtodhXMAvESxCKyBSOnFMOVW5HSiffO'),
(107, 11, '2018-10-15 04:26:43', '2018-10-15 04:26:43', 'cCxcv6EW-Mg:APA91bHPx7NNHoOdlCi4SRHpgb7bnK2sbDh9dtAtzczgg0hmoJJ3aLEq5k44kpdl89Q_mbVsVYxqbAq7DV5gxxMEq_z0dUGZ3qs76ZcXLAuIwda95n4QvRtzBxdUrs_6lT5smzl0zO3J'),
(108, 11, '2018-10-15 04:29:20', '2018-10-15 04:29:20', ''),
(109, 11, '2018-10-15 04:36:45', '2018-10-15 04:36:45', 'e2TIaRpy118:APA91bEhNAdShlj6qxihlFthoGceZ6Lv-AxnRHQtiGr9aYPPT_sgLUWNgep24fkwx1jLJU1DeduRzpOAMGrRSGzTdfKaYzfMHrRUI00H53pOc-AFTK8ZhKXZoZD5wsUEio6zGGYqYEpP'),
(110, 11, '2018-10-15 04:39:08', '2018-10-15 04:39:08', 'dXbSZYkY7ls:APA91bFXDOTwUAum3NusVaXsjW91xGB3PlslPuUMJmYQARMiMhK7zAJuor0LlDsC3EE1EHHObcOVTLL-KSaCrYcVqLFyNR5OAh1FIZRhi78JRtC7a-z1Fqa_K9HQLLFP1Tu1UIoL7yMt'),
(111, 11, '2018-10-15 04:40:45', '2018-10-15 04:40:45', 'fvstn-mZOVg:APA91bGZm5edAkLN564sWier0lxcK3S4krHwzBu7ZP1DqkPTSQlEmJI3Rbx6nvQG80hFTlRRM-2x_A5Wjz3Wy_sgJDZnE7fbiQYVKIJi-CURI5OSeFgJLhd7dxLhWF_g-XWT7FLU0Jsq'),
(112, 9, '2018-10-15 11:30:00', '2018-10-15 11:30:00', 'cd0gK5rB-CM:APA91bH6Vn4nB8xKJVUqFexCL4yPOPeOUTaSmLT6aYoqF8mqPYX8ZAbJ1nrwoUPPfUZ4PF1AXOdGswHVtMaeOllqW8Ljll9EEOheH2Ly-2qT1EbmswwxalPWmQb2Zku2_m59bY4oCuWE'),
(113, 9, '2018-10-15 11:31:05', '2018-10-15 11:31:05', 'cjSVvhg8qY4:APA91bHXnLXUqq_Pzdlz_K5MYk4kUIEWwDk5N9GObvhhF5XTGxaDHO9oNwlpdXWel8huTnT_rgDxhh9tyI7mtulSeXa-drOnNdw8fe40fvmVYjJngj_vEuVuOY3F905c49WPAIrzlWui'),
(114, 73, '2018-10-15 12:05:22', '2018-10-15 12:05:22', 'd1qOCA3JC4o:APA91bH99QOE5HfGfXqp0wlqPaRw7RsDsRIqHsivPKDDJ-1RAup6hv7Foo9h_lKuD7uSYim_wgL6Wipm-XXciM1lwIcdXGEW0OrLkHyoOUhcQn0u7d1GgJcYIYwt8t_lDIQ-sLgf-TOq'),
(115, 4, '2018-10-17 12:32:05', '2018-10-17 12:32:05', 'dOyFkVzaFtI:APA91bFrZwej5uI4Hz5qdjmw6HSNwftQdIr_Bi8NmFui6O0KMOtxv4VsIR2CP3nssS4SrTre1dvp0Ha1AQKBUx5CWhBVbVOcqP14OdEVnZa2KPxiVWngUe9sNK69POJ57TGB6wPYrznE'),
(116, 4, '2018-10-17 12:32:09', '2018-10-17 12:32:09', 'dOyFkVzaFtI:APA91bFrZwej5uI4Hz5qdjmw6HSNwftQdIr_Bi8NmFui6O0KMOtxv4VsIR2CP3nssS4SrTre1dvp0Ha1AQKBUx5CWhBVbVOcqP14OdEVnZa2KPxiVWngUe9sNK69POJ57TGB6wPYrznE'),
(117, 25, '2018-10-17 12:33:12', '2018-10-17 12:33:12', 'dgByDezeAro:APA91bFFZsbZ_FxIYGknTC-9Lkrode5hLdsktiO8-ph47aJAG6iVK8Cdi88w9_jkF5NTd1GbCpVsBdxqKSRbjt3uvVJFqV7x2wYlsykgAXQgij1JabNcZORW2knDSipqYfc2HloBsDrT'),
(118, 9, '2018-11-04 17:06:52', '2018-11-04 17:06:52', 'd8_16AiBX30:APA91bEiHXzgSahgqYr4jo2QzaNIxCnCH5MVazAo0-UYOmJgDk_ZLGoibcLcV3t476sxh1FFwGCaxsBdBBS40OMyoHOIAViUi-xflCiG-6kk-T_iGf8j0EohbATiQC_I11mD7Ttwyq7B'),
(119, 82, '2018-11-05 06:38:53', '2018-11-05 06:38:53', 'dsTNb8Z_srQ:APA91bH8GeJN2Y3bjuE5BWBtydfuWR2PJuLGUXz3JU6OOZ6dcFiNW1ibzyYRwQ31xvinpkD-y4AsTrBGIX9b7BmgilZy0s6_DIJn0WQcp5T-4qazkq5Ni3W22dSM0GxK0BSzzTVgycCc'),
(120, 86, '2018-11-08 05:53:41', '2018-11-08 05:53:41', 'e_HUPPzingg:APA91bEIaTW-EOo-xjeexLKPvDPHYi4AB1PMJNGOV-URMoZiXjPfMFUVw6BhfptJOsy9YLG_SwAYLFCvU64rgoEl4s77NdcWM-4EJiBda-PQOcgXU2TZ3eWoWzOPAs-Z-3XWRC_5VYQV'),
(121, 91, '2018-11-08 19:18:21', '2018-11-08 19:18:21', 'd8_16AiBX30:APA91bEiHXzgSahgqYr4jo2QzaNIxCnCH5MVazAo0-UYOmJgDk_ZLGoibcLcV3t476sxh1FFwGCaxsBdBBS40OMyoHOIAViUi-xflCiG-6kk-T_iGf8j0EohbATiQC_I11mD7Ttwyq7B'),
(122, 91, '2018-11-08 19:21:31', '2018-11-08 19:21:31', 'd8_16AiBX30:APA91bEiHXzgSahgqYr4jo2QzaNIxCnCH5MVazAo0-UYOmJgDk_ZLGoibcLcV3t476sxh1FFwGCaxsBdBBS40OMyoHOIAViUi-xflCiG-6kk-T_iGf8j0EohbATiQC_I11mD7Ttwyq7B'),
(123, 91, '2018-11-08 19:23:12', '2018-11-08 19:23:12', 'd8_16AiBX30:APA91bEiHXzgSahgqYr4jo2QzaNIxCnCH5MVazAo0-UYOmJgDk_ZLGoibcLcV3t476sxh1FFwGCaxsBdBBS40OMyoHOIAViUi-xflCiG-6kk-T_iGf8j0EohbATiQC_I11mD7Ttwyq7B'),
(124, 93, '2018-11-08 19:27:56', '2018-11-08 19:27:56', 'd8_16AiBX30:APA91bEiHXzgSahgqYr4jo2QzaNIxCnCH5MVazAo0-UYOmJgDk_ZLGoibcLcV3t476sxh1FFwGCaxsBdBBS40OMyoHOIAViUi-xflCiG-6kk-T_iGf8j0EohbATiQC_I11mD7Ttwyq7B'),
(125, 94, '2018-11-08 19:41:23', '2018-11-08 19:41:23', 'dQEOm1Ptw7w:APA91bGibDC1NctgwCSv4CPbst4AfKk4I7U0SRAaIyXoUwU7gDhrRLXOOiVHn1vuR2y7XMKDSYigvXC7csRM143NAiwxQwHYQ7ZTcDOejf2yKnQXtiNY9LI3cArgaj3J1hlqr2VIazYA'),
(126, 94, '2018-11-08 19:41:25', '2018-11-08 19:41:25', 'dQEOm1Ptw7w:APA91bGibDC1NctgwCSv4CPbst4AfKk4I7U0SRAaIyXoUwU7gDhrRLXOOiVHn1vuR2y7XMKDSYigvXC7csRM143NAiwxQwHYQ7ZTcDOejf2yKnQXtiNY9LI3cArgaj3J1hlqr2VIazYA'),
(127, 94, '2018-11-08 19:41:27', '2018-11-08 19:41:27', 'dQEOm1Ptw7w:APA91bGibDC1NctgwCSv4CPbst4AfKk4I7U0SRAaIyXoUwU7gDhrRLXOOiVHn1vuR2y7XMKDSYigvXC7csRM143NAiwxQwHYQ7ZTcDOejf2yKnQXtiNY9LI3cArgaj3J1hlqr2VIazYA'),
(128, 94, '2018-11-08 19:41:36', '2018-11-08 19:41:36', 'dQEOm1Ptw7w:APA91bGibDC1NctgwCSv4CPbst4AfKk4I7U0SRAaIyXoUwU7gDhrRLXOOiVHn1vuR2y7XMKDSYigvXC7csRM143NAiwxQwHYQ7ZTcDOejf2yKnQXtiNY9LI3cArgaj3J1hlqr2VIazYA'),
(129, 49, '2018-11-08 19:44:14', '2018-11-08 19:44:14', 'dQEOm1Ptw7w:APA91bGibDC1NctgwCSv4CPbst4AfKk4I7U0SRAaIyXoUwU7gDhrRLXOOiVHn1vuR2y7XMKDSYigvXC7csRM143NAiwxQwHYQ7ZTcDOejf2yKnQXtiNY9LI3cArgaj3J1hlqr2VIazYA'),
(130, 97, '2018-11-08 19:47:08', '2018-11-08 19:47:08', 'd8_16AiBX30:APA91bEiHXzgSahgqYr4jo2QzaNIxCnCH5MVazAo0-UYOmJgDk_ZLGoibcLcV3t476sxh1FFwGCaxsBdBBS40OMyoHOIAViUi-xflCiG-6kk-T_iGf8j0EohbATiQC_I11mD7Ttwyq7B'),
(131, 99, '2018-11-09 14:04:36', '2018-11-09 14:04:36', 'cemkmD29cJ8:APA91bGEfP6c8hvOP8a-CwSbsZvnPLV6mSkHDBpyuhndbU2LpvbDJl4Hn8VnWNXDB-XJ38ukyzpHVvrkZALqJXUTqXBOeUNVr3xc5n8mQYTogd3lXbJUN3yjEjFD3vlJsr1AOByF3uVo'),
(132, 100, '2018-11-12 17:38:20', '2018-11-12 17:38:20', '7db898984291fc79d9a5ba75676f01ba4fe5cc454b24f7edcdd5cc8db49ea201'),
(133, 100, '2018-11-12 17:39:35', '2018-11-12 17:39:35', '7db898984291fc79d9a5ba75676f01ba4fe5cc454b24f7edcdd5cc8db49ea201'),
(134, 100, '2018-11-12 17:40:48', '2018-11-12 17:40:48', 'cd0a37d73697ac57a80d5610b4e1eb2441004f76687d3267181668494c327e1f'),
(135, 9, '2018-11-13 02:26:09', '2018-11-13 02:26:09', '7db898984291fc79d9a5ba75676f01ba4fe5cc454b24f7edcdd5cc8db49ea201'),
(136, 109, '2018-11-23 20:46:40', '2018-11-23 20:46:40', ''),
(137, 113, '2018-11-30 18:00:16', '2018-11-30 18:00:16', 'cz9D6H8rtPE:APA91bGnG4AVtpcvCVXE6xsT7x_GYyw68DH2y0xjsX9UC9_QSqEO_ivKNPtZ4_qXgMDoQypUdDh2rRgT7LnyQU8G5N6GJy380Md3GI4PWKyVSk5y57Zus49_C_YctxLMrxTX1iAXphWX'),
(138, 115, '2018-11-30 18:19:35', '2018-11-30 18:19:35', ''),
(139, 115, '2018-11-30 18:38:07', '2018-11-30 18:38:07', 'dPMKnCcb5FA:APA91bHS9CBdJszBy5SZ62JL_-9XJypVeoXzYFUhkcI-C_VlHaOAAkTvJO-smBPR06mdrfR_MYMesuQbv_spCKgCecto3_sdhPM2Z7nh4qA-fyScQxmiwnlLlUmKNbmGktp2CqkXNSQK'),
(140, 115, '2018-11-30 19:57:29', '2018-11-30 19:57:29', 'dPMKnCcb5FA:APA91bHS9CBdJszBy5SZ62JL_-9XJypVeoXzYFUhkcI-C_VlHaOAAkTvJO-smBPR06mdrfR_MYMesuQbv_spCKgCecto3_sdhPM2Z7nh4qA-fyScQxmiwnlLlUmKNbmGktp2CqkXNSQK'),
(141, 113, '2018-11-30 21:45:54', '2018-11-30 21:45:54', ''),
(142, 116, '2018-11-30 23:22:58', '2018-11-30 23:22:58', 'dKK8MpmRu_U:APA91bHinWGnh6DBkjfDH8FEF2Pj_DqGcIaiqyEHTuaWuQDPYC0368MU5zptrr6cLUAwsWorTS3MHLVDjGhVv-nkjYDY_8WBFWaTLXC1kpA9280fE8tt1BNKKMmZiIBXOwHY73jz4NvC'),
(143, 115, '2018-12-01 11:12:48', '2018-12-01 11:12:48', 'dgFC_S09uzs:APA91bHzejiMmBSf4-jbub9M1gKbE8-cNBLBam_BTOJPCQiqylE8-AJ6t-JgQ3G3BBS5BURjOCRGwQQVgzA3STbEIZBGgHULy-JzlcFcpNw0x4_pqGkHmFgpE7ABW2In5r7ZpQEm47Zr'),
(144, 115, '2018-12-01 11:51:59', '2018-12-01 11:51:59', 'c58oURhNL9w:APA91bGOC63o9_ZYMHsGmQ6udNbvSHwjFzTTqoEvzsHeU87FfdUfkn0kaymDmR1jCTV0HZvQGxyBPdyNYhDNj5f11BLJlXp0u61dBdrKzrOc6S-vXmpdbgZpaI7cFVTsFmJRLIMvPZis'),
(145, 118, '2018-12-01 14:38:26', '2018-12-01 14:38:26', 'eZwcnmFCkek:APA91bE2wxjDug7zMbGBpUWi5AVcKbEjLtIE7gWmix_wZbw53mfWW9cqN9dVvNzwWCTlhjtLSJe0yoIVcEP7Zx6WmekLNzfxA5V5jmprTclDINZ2pV-fIHlpZgJS4_8KSibdMO8ll7fw'),
(146, 118, '2018-12-01 14:39:13', '2018-12-01 14:39:13', 'eZwcnmFCkek:APA91bE2wxjDug7zMbGBpUWi5AVcKbEjLtIE7gWmix_wZbw53mfWW9cqN9dVvNzwWCTlhjtLSJe0yoIVcEP7Zx6WmekLNzfxA5V5jmprTclDINZ2pV-fIHlpZgJS4_8KSibdMO8ll7fw'),
(147, 118, '2018-12-01 14:43:19', '2018-12-01 14:43:19', 'eZwcnmFCkek:APA91bE2wxjDug7zMbGBpUWi5AVcKbEjLtIE7gWmix_wZbw53mfWW9cqN9dVvNzwWCTlhjtLSJe0yoIVcEP7Zx6WmekLNzfxA5V5jmprTclDINZ2pV-fIHlpZgJS4_8KSibdMO8ll7fw'),
(148, 118, '2018-12-01 14:46:08', '2018-12-01 14:46:08', 'eZwcnmFCkek:APA91bE2wxjDug7zMbGBpUWi5AVcKbEjLtIE7gWmix_wZbw53mfWW9cqN9dVvNzwWCTlhjtLSJe0yoIVcEP7Zx6WmekLNzfxA5V5jmprTclDINZ2pV-fIHlpZgJS4_8KSibdMO8ll7fw'),
(149, 118, '2018-12-01 15:33:19', '2018-12-01 15:33:19', 'd4ALLq8YJPc:APA91bFCXe4hOGS23w8AJfjR5zAyNI4Q1n_xs2tpBq6ZxkrIIBmuadPuUn9zweTycEfg7E9g-t2mR_o4fPnoW0VQ6DiG5Ognz9FPPRJ07hC5dnS6FSwKJgvEf3jdzq1Lhe2dLANnPz9o'),
(150, 118, '2018-12-01 15:36:17', '2018-12-01 15:36:17', 'd4ALLq8YJPc:APA91bFCXe4hOGS23w8AJfjR5zAyNI4Q1n_xs2tpBq6ZxkrIIBmuadPuUn9zweTycEfg7E9g-t2mR_o4fPnoW0VQ6DiG5Ognz9FPPRJ07hC5dnS6FSwKJgvEf3jdzq1Lhe2dLANnPz9o'),
(151, 118, '2018-12-01 15:50:47', '2018-12-01 15:50:47', 'd4ALLq8YJPc:APA91bFCXe4hOGS23w8AJfjR5zAyNI4Q1n_xs2tpBq6ZxkrIIBmuadPuUn9zweTycEfg7E9g-t2mR_o4fPnoW0VQ6DiG5Ognz9FPPRJ07hC5dnS6FSwKJgvEf3jdzq1Lhe2dLANnPz9o'),
(152, 118, '2018-12-01 16:14:38', '2018-12-01 16:14:38', 'd4ALLq8YJPc:APA91bFCXe4hOGS23w8AJfjR5zAyNI4Q1n_xs2tpBq6ZxkrIIBmuadPuUn9zweTycEfg7E9g-t2mR_o4fPnoW0VQ6DiG5Ognz9FPPRJ07hC5dnS6FSwKJgvEf3jdzq1Lhe2dLANnPz9o'),
(153, 118, '2018-12-01 16:16:33', '2018-12-01 16:16:33', 'd4ALLq8YJPc:APA91bFCXe4hOGS23w8AJfjR5zAyNI4Q1n_xs2tpBq6ZxkrIIBmuadPuUn9zweTycEfg7E9g-t2mR_o4fPnoW0VQ6DiG5Ognz9FPPRJ07hC5dnS6FSwKJgvEf3jdzq1Lhe2dLANnPz9o'),
(154, 118, '2018-12-01 16:20:41', '2018-12-01 16:20:41', 'd4ALLq8YJPc:APA91bFCXe4hOGS23w8AJfjR5zAyNI4Q1n_xs2tpBq6ZxkrIIBmuadPuUn9zweTycEfg7E9g-t2mR_o4fPnoW0VQ6DiG5Ognz9FPPRJ07hC5dnS6FSwKJgvEf3jdzq1Lhe2dLANnPz9o'),
(155, 118, '2018-12-01 16:31:10', '2018-12-01 16:31:10', 'd4ALLq8YJPc:APA91bFCXe4hOGS23w8AJfjR5zAyNI4Q1n_xs2tpBq6ZxkrIIBmuadPuUn9zweTycEfg7E9g-t2mR_o4fPnoW0VQ6DiG5Ognz9FPPRJ07hC5dnS6FSwKJgvEf3jdzq1Lhe2dLANnPz9o'),
(156, 118, '2018-12-01 16:32:34', '2018-12-01 16:32:34', 'd4ALLq8YJPc:APA91bFCXe4hOGS23w8AJfjR5zAyNI4Q1n_xs2tpBq6ZxkrIIBmuadPuUn9zweTycEfg7E9g-t2mR_o4fPnoW0VQ6DiG5Ognz9FPPRJ07hC5dnS6FSwKJgvEf3jdzq1Lhe2dLANnPz9o'),
(157, 118, '2018-12-01 16:54:06', '2018-12-01 16:54:06', 'd4ALLq8YJPc:APA91bFCXe4hOGS23w8AJfjR5zAyNI4Q1n_xs2tpBq6ZxkrIIBmuadPuUn9zweTycEfg7E9g-t2mR_o4fPnoW0VQ6DiG5Ognz9FPPRJ07hC5dnS6FSwKJgvEf3jdzq1Lhe2dLANnPz9o'),
(158, 118, '2018-12-01 16:55:21', '2018-12-01 16:55:21', 'd4ALLq8YJPc:APA91bFCXe4hOGS23w8AJfjR5zAyNI4Q1n_xs2tpBq6ZxkrIIBmuadPuUn9zweTycEfg7E9g-t2mR_o4fPnoW0VQ6DiG5Ognz9FPPRJ07hC5dnS6FSwKJgvEf3jdzq1Lhe2dLANnPz9o'),
(159, 118, '2018-12-01 16:57:32', '2018-12-01 16:57:32', 'fgZH_IphZ1A:APA91bE9Ss55oqS4tDdi5nQ8nYu-K242RY-PIYMrspClqzshTS4oCNMICXt6lWmL-_eVXRuCHOmyCMUU-FapFBZPs49OoUHyNs45PRL6EVBsUGzfWWAe2q4mPUPZdjcMTzy1sg0r0xQs'),
(160, 118, '2018-12-01 17:06:22', '2018-12-01 17:06:22', 'd4ALLq8YJPc:APA91bFCXe4hOGS23w8AJfjR5zAyNI4Q1n_xs2tpBq6ZxkrIIBmuadPuUn9zweTycEfg7E9g-t2mR_o4fPnoW0VQ6DiG5Ognz9FPPRJ07hC5dnS6FSwKJgvEf3jdzq1Lhe2dLANnPz9o'),
(161, 118, '2018-12-01 17:06:52', '2018-12-01 17:06:52', 'eZwcnmFCkek:APA91bE2wxjDug7zMbGBpUWi5AVcKbEjLtIE7gWmix_wZbw53mfWW9cqN9dVvNzwWCTlhjtLSJe0yoIVcEP7Zx6WmekLNzfxA5V5jmprTclDINZ2pV-fIHlpZgJS4_8KSibdMO8ll7fw'),
(162, 118, '2018-12-01 17:07:21', '2018-12-01 17:07:21', 'fgZH_IphZ1A:APA91bE9Ss55oqS4tDdi5nQ8nYu-K242RY-PIYMrspClqzshTS4oCNMICXt6lWmL-_eVXRuCHOmyCMUU-FapFBZPs49OoUHyNs45PRL6EVBsUGzfWWAe2q4mPUPZdjcMTzy1sg0r0xQs'),
(163, 118, '2018-12-01 17:08:02', '2018-12-01 17:08:02', 'eoImsMThEDM:APA91bGoiazgxT7p_og0CsAGvw7AwaShgdEdI2RerxQ22LcxhaOoXfQUESM0Q856NfS3slNJ1JMPDzSQsNNvwkf7dwzRCFe8TMqp0LHyPVPlTLuitoN7TpW3vY5bvvGr8iZlZ-suAno7'),
(164, 118, '2018-12-01 17:23:08', '2018-12-01 17:23:08', 'd4ALLq8YJPc:APA91bFCXe4hOGS23w8AJfjR5zAyNI4Q1n_xs2tpBq6ZxkrIIBmuadPuUn9zweTycEfg7E9g-t2mR_o4fPnoW0VQ6DiG5Ognz9FPPRJ07hC5dnS6FSwKJgvEf3jdzq1Lhe2dLANnPz9o'),
(165, 118, '2018-12-01 18:01:34', '2018-12-01 18:01:34', 'd4ALLq8YJPc:APA91bFCXe4hOGS23w8AJfjR5zAyNI4Q1n_xs2tpBq6ZxkrIIBmuadPuUn9zweTycEfg7E9g-t2mR_o4fPnoW0VQ6DiG5Ognz9FPPRJ07hC5dnS6FSwKJgvEf3jdzq1Lhe2dLANnPz9o'),
(166, 118, '2018-12-02 17:14:05', '2018-12-02 17:14:05', 'd4ALLq8YJPc:APA91bFCXe4hOGS23w8AJfjR5zAyNI4Q1n_xs2tpBq6ZxkrIIBmuadPuUn9zweTycEfg7E9g-t2mR_o4fPnoW0VQ6DiG5Ognz9FPPRJ07hC5dnS6FSwKJgvEf3jdzq1Lhe2dLANnPz9o'),
(167, 118, '2018-12-03 10:57:36', '2018-12-03 10:57:36', 'd4ALLq8YJPc:APA91bFCXe4hOGS23w8AJfjR5zAyNI4Q1n_xs2tpBq6ZxkrIIBmuadPuUn9zweTycEfg7E9g-t2mR_o4fPnoW0VQ6DiG5Ognz9FPPRJ07hC5dnS6FSwKJgvEf3jdzq1Lhe2dLANnPz9o'),
(168, 115, '2018-12-04 12:41:59', '2018-12-04 12:41:59', 'cuRcHKbtY0c:APA91bE7qFjKQExH3m4znvwQ0myIWnhAvVza5y-MSak2CvWqiVHHl8RiWeZ4N6jdcFmuhr7jXPx1g9oViNEeZPJeZ5xsFwWCQlH2ckmRp0wAoyshu4eRz1Q5QDUqyvxQaAUis9HOvf8Z'),
(169, 115, '2018-12-04 12:45:25', '2018-12-04 12:45:25', 'cuRcHKbtY0c:APA91bE7qFjKQExH3m4znvwQ0myIWnhAvVza5y-MSak2CvWqiVHHl8RiWeZ4N6jdcFmuhr7jXPx1g9oViNEeZPJeZ5xsFwWCQlH2ckmRp0wAoyshu4eRz1Q5QDUqyvxQaAUis9HOvf8Z'),
(170, 118, '2018-12-04 17:39:51', '2018-12-04 17:39:51', 'eVtSuF95xvw:APA91bGaVIapi6f3aReg6E2igRpsBjj6ShC7j2ONnV6clb6W45uGK3hUVD5m-taG12AHmqMGmIBsRLd9OpTDjYfMfbJfwwDEUxJdphYeQ63rlqsWiQSL4AYrYrD7x0s4Wn9YcuDvqyQW'),
(171, 118, '2018-12-04 17:41:18', '2018-12-04 17:41:18', 'eoImsMThEDM:APA91bGoiazgxT7p_og0CsAGvw7AwaShgdEdI2RerxQ22LcxhaOoXfQUESM0Q856NfS3slNJ1JMPDzSQsNNvwkf7dwzRCFe8TMqp0LHyPVPlTLuitoN7TpW3vY5bvvGr8iZlZ-suAno7'),
(172, 120, '2018-12-05 16:19:22', '2018-12-05 16:19:22', 'ac1de27e3fe3f063c24e03efdab45c0357895b314670211328aaa55128dc7ef8'),
(173, 120, '2018-12-05 16:19:52', '2018-12-05 16:19:52', 'ac1de27e3fe3f063c24e03efdab45c0357895b314670211328aaa55128dc7ef8'),
(174, 115, '2018-12-05 19:00:32', '2018-12-05 19:00:32', 'f47DjIRmnk0:APA91bE4kXZy0EjxbxiXhsKdAwPjOi1U7EQv5QE47mctFgfK1x9VrMIXJraFT8yqOl_8Fmni7czjKm-BllS5UITwi4Od8-ribOdgH3PNpMGYYdCuDENnQEQgqPkYp2eXjalZaOGvaMTE'),
(175, 118, '2018-12-05 19:03:10', '2018-12-05 19:03:10', 'cs_n0uJWF1Y:APA91bEyfMmMqXmTmTmIknaFR3A9knDt46R1oQEQrAkwGemRg8XLLTdB3_6NFbOIS-Z-uVEWE3nXRu89_k1YEaEy4HkR7QqQItbtO2FNWUlnKD_k1Xhn3aAXZ0oDRrMzgLQ7EM_H6nKt'),
(176, 118, '2018-12-05 19:06:05', '2018-12-05 19:06:05', 'cs_n0uJWF1Y:APA91bEyfMmMqXmTmTmIknaFR3A9knDt46R1oQEQrAkwGemRg8XLLTdB3_6NFbOIS-Z-uVEWE3nXRu89_k1YEaEy4HkR7QqQItbtO2FNWUlnKD_k1Xhn3aAXZ0oDRrMzgLQ7EM_H6nKt'),
(177, 120, '2018-12-06 09:43:39', '2018-12-06 09:43:39', ''),
(178, 120, '2018-12-06 10:00:18', '2018-12-06 10:00:18', ''),
(179, 120, '2018-12-06 10:50:04', '2018-12-06 10:50:04', ''),
(180, 120, '2018-12-06 11:42:45', '2018-12-06 11:42:45', ''),
(181, 118, '2018-12-07 03:02:19', '2018-12-07 03:02:19', 'fsBOnc6Vl_Y:APA91bE0p8dr8hGE3RTnfXNdyu7C5D7o_3y2iAkIkWOWBloXuOyJcRCEZku9vCo9JFdFvV9wvywPi-iagSiDzQedxsi4R1CIq0R0IiMwLtMMELNCKvEEDS0fk_It36ouLjPs-cLZTMsM'),
(182, 118, '2018-12-07 16:57:55', '2018-12-07 16:57:55', 'cs_n0uJWF1Y:APA91bEyfMmMqXmTmTmIknaFR3A9knDt46R1oQEQrAkwGemRg8XLLTdB3_6NFbOIS-Z-uVEWE3nXRu89_k1YEaEy4HkR7QqQItbtO2FNWUlnKD_k1Xhn3aAXZ0oDRrMzgLQ7EM_H6nKt'),
(183, 118, '2018-12-07 17:37:16', '2018-12-07 17:37:16', 'cs_n0uJWF1Y:APA91bEyfMmMqXmTmTmIknaFR3A9knDt46R1oQEQrAkwGemRg8XLLTdB3_6NFbOIS-Z-uVEWE3nXRu89_k1YEaEy4HkR7QqQItbtO2FNWUlnKD_k1Xhn3aAXZ0oDRrMzgLQ7EM_H6nKt'),
(184, 120, '2018-12-07 22:02:44', '2018-12-07 22:02:44', ''),
(185, 118, '2018-12-08 14:14:47', '2018-12-08 14:14:47', 'fsBOnc6Vl_Y:APA91bE0p8dr8hGE3RTnfXNdyu7C5D7o_3y2iAkIkWOWBloXuOyJcRCEZku9vCo9JFdFvV9wvywPi-iagSiDzQedxsi4R1CIq0R0IiMwLtMMELNCKvEEDS0fk_It36ouLjPs-cLZTMsM'),
(186, 118, '2018-12-08 14:18:55', '2018-12-08 14:18:55', 'fsBOnc6Vl_Y:APA91bE0p8dr8hGE3RTnfXNdyu7C5D7o_3y2iAkIkWOWBloXuOyJcRCEZku9vCo9JFdFvV9wvywPi-iagSiDzQedxsi4R1CIq0R0IiMwLtMMELNCKvEEDS0fk_It36ouLjPs-cLZTMsM'),
(187, 115, '2018-12-10 10:59:59', '2018-12-10 10:59:59', ''),
(188, 9, '2018-12-10 11:06:03', '2018-12-10 11:06:03', ''),
(189, 115, '2018-12-10 14:07:10', '2018-12-10 14:07:10', ''),
(190, 115, '2018-12-10 14:14:10', '2018-12-10 14:14:10', ''),
(191, 115, '2018-12-10 14:16:50', '2018-12-10 14:16:50', ''),
(192, 115, '2018-12-10 14:21:29', '2018-12-10 14:21:29', ''),
(193, 124, '2018-12-10 16:29:04', '2018-12-10 16:29:04', '5e0e6475176f8b8c99963dea196a60a4986f9c4f5778aa83b18003eaace409a9'),
(194, 118, '2018-12-13 14:40:42', '2018-12-13 14:40:42', 'fsBOnc6Vl_Y:APA91bE0p8dr8hGE3RTnfXNdyu7C5D7o_3y2iAkIkWOWBloXuOyJcRCEZku9vCo9JFdFvV9wvywPi-iagSiDzQedxsi4R1CIq0R0IiMwLtMMELNCKvEEDS0fk_It36ouLjPs-cLZTMsM'),
(195, 9, '2018-12-14 11:26:02', '2018-12-14 11:26:02', 'e147qskuEc0:APA91bFdt5MHityHiJ6wamMHmqbPe3Fm53cy_o4znHIDLTeiLLi3uJREWZBeeiHVL6dMRNPZlZFapFWe_HGmMc31RkA1-sdu_bvXOZ_PzBITMuLFH6Pk484Kr1gIuCfub04v6Mtv6-8D'),
(196, 9, '2018-12-14 12:28:24', '2018-12-14 12:28:24', 'e147qskuEc0:APA91bFdt5MHityHiJ6wamMHmqbPe3Fm53cy_o4znHIDLTeiLLi3uJREWZBeeiHVL6dMRNPZlZFapFWe_HGmMc31RkA1-sdu_bvXOZ_PzBITMuLFH6Pk484Kr1gIuCfub04v6Mtv6-8D'),
(197, 118, '2018-12-17 11:00:04', '2018-12-17 11:00:04', 'cnJK-PwEYSE:APA91bFcP2DNuhUjclp3RPDwLMJh0JbfGrNGfE1fASsaKAqPjukIkEVlnmGYjnvG4MLFLg6VTDoxw0HmKsRN98NlKlK3WXxzDnFxlepIbq9UGPGWesBluc1F1mcq8XMOsaiXAjb0vLBm'),
(198, 118, '2018-12-17 11:00:47', '2018-12-17 11:00:47', 'd927Bh7mICE:APA91bG2vUQSxVLeBf6FdM6gv4gaNOvNoXNzw60CexbSShayeArSIY8C5MkOBi7g7qxLAREREZL1z7D1zHVyrTWXoAzIg8SLbPvB6JhpFHzXMv5DvcH6RJ8bCZ6PWK3PeDOeTYL0j2yd'),
(199, 118, '2018-12-18 17:25:30', '2018-12-18 17:25:30', 'dpo1snz4BYU:APA91bE9UYfWZYCXz5-JkkESMiMx_w7fbFP5sds-BzbV7Q2B336Tco3CgamvLDS6VFpHf8ZBZj4WGvmz5IYQpgS3i_buIrjB8d64q7oM3VVv2yFti33YOv1hKOg5_K2_4eYSF6nRvfeH'),
(200, 118, '2018-12-19 16:04:13', '2018-12-19 16:04:13', 'cYlIQyT_8Hc:APA91bHgmT171WJn6I9jfD4TbBbAev-qhSpAO2cI5VBWUIDHCVBbHCgVUjB1j4i09famtwRE2bPkIldVEwTBBP3xbS8rcsb7NCF2vcneQLD021f1o9Q-n1pjB0o0awo1pC_Xv_WEi3Ik'),
(201, 118, '2018-12-20 21:54:06', '2018-12-20 21:54:06', 'c2VsIRxk_98:APA91bF7LSY9Nk5NkuGhpvClB3zD7xdQWMLmZ_KMBUMxXfZQu4WfFNsO3VSsoG7ZLiT4nVNUrpTAcyLPhB65t3sfDKHLPyFmC8_HU-fw0Axi3-U8nMMvVxlVNkqMBqpgkOalK2As9wuy'),
(202, 118, '2018-12-20 21:54:47', '2018-12-20 21:54:47', 'erM9UdLD1WY:APA91bFhu5qTzVDHFfdINAS6xgVrIrnStQ8jY2G3vncFpytSzpbhFwRxsq0zPyv5QXlmcxwyhaKlLX3JsGwGY875gUg_Rax-9PIaiTyCXgxYrklG6U19r1r-zfQBUq_1oZrWL3bm_hW0'),
(203, 118, '2018-12-21 12:09:49', '2018-12-21 12:09:49', 'elOw4oxmtlk:APA91bE6m3Z__-3Tf4dV6ge-y2ew_Ldm1R-XxNURKNVcViPMlzbAl51BWmoGe7jjv5LcXRATCWZ87tvTmPmfiTa9BESPBTVuxXMAnA4Ewfauus3ix1qY6L3wlA2mDeAMsGLIcEdFF1SK'),
(204, 140, '2019-01-09 16:48:47', '2019-01-09 08:48:47', 'f7Bu0tnwb3c:APA91bGcjwOV__GtJnqpuKd0fQH6FGtAIc2wyfRaeYPAiloCXHxtvlJj1ejl3XX4CcZbyqIY-E02Fa9p8CsZ-3-UwPQs0y3LpMgsynGKUv2K-0Hx_f_pC8nD0l8OeiQTLKpufE5AV2eA'),
(205, 9, '2019-01-09 23:20:15', '2019-01-09 15:20:15', 'fH_PbBDiljY:APA91bEcO6hJxzBdeDTnzEUPaOb9Qk7O7xLjnBYufQ2l9pl2wN17KCxXPn0_t19NTKZeDPzKOU4q7zSqPVUe1sXSqKjIBmkT1tzK2byp1Xv9q_-pjyzSU3uC3kj4zT9E3RRRIVc2E15S'),
(206, 9, '2019-01-10 22:37:42', '2019-01-10 14:37:42', 'fH_PbBDiljY:APA91bEcO6hJxzBdeDTnzEUPaOb9Qk7O7xLjnBYufQ2l9pl2wN17KCxXPn0_t19NTKZeDPzKOU4q7zSqPVUe1sXSqKjIBmkT1tzK2byp1Xv9q_-pjyzSU3uC3kj4zT9E3RRRIVc2E15S'),
(207, 9, '2019-01-18 17:05:16', '2019-01-18 09:05:16', 'cX7Uopfr6-U:APA91bGWRWnvsZTH4DYU21IjNvsz-54QYbbr98Q6ptMpUyl00nIFUfqhp8Vta2TQY0aDtWHmREmplG8JD5lZCwJ4IHDH82gUX3MhnPA9--k5N6SaqP5gioY6eJ3w7fbnT1JrcqlXME8g'),
(208, 49, '2019-01-24 21:54:10', '2019-01-24 13:54:10', 'dC0yYWnhNMw:APA91bF2q33fXMaQLc7ew8uuHYgBVYJEeMYzXBO4oH_P_-xtSE0KBemcpgkJuYVhIAlq3SvoAQGTA7GqUiPm5wtPHYiOCeP6OUV1sFoNCxb8fsg0maLn1ntyy0XxGnLsyxhGzIXGfMgm'),
(209, 49, '2019-01-25 01:28:36', '2019-01-24 17:28:36', 'dC0yYWnhNMw:APA91bF2q33fXMaQLc7ew8uuHYgBVYJEeMYzXBO4oH_P_-xtSE0KBemcpgkJuYVhIAlq3SvoAQGTA7GqUiPm5wtPHYiOCeP6OUV1sFoNCxb8fsg0maLn1ntyy0XxGnLsyxhGzIXGfMgm'),
(210, 49, '2019-01-25 19:36:14', '2019-01-25 11:36:14', 'dwC95uG2U_o:APA91bEaUTYuWYT0h5tCynaQaLwyy-VZu_3NZerlu4yNxWPfn9UGNcBRMdOFrCdeQXlc82ZB9runnLkXg5CrdnSOlQLZsONlBtfQzJVyaEPJwagc_7gzsazt0AfOsKpzh9Pq-KBdlwPM'),
(211, 170, '2019-01-25 21:11:01', '2019-01-25 13:11:01', 'cdQTnxPNl0I:APA91bGB_9nCSJyBPlZQGgCNnn3cX7h6UQpns7xOasoc6AKsKNn0QKfou0brQgy9ITFV-8cu3KqU4xIhwfg_Q00jETTiAKKoGgqPW1FEPPkvEbY2GAQ16TZV6ZvgPatUjFYzG50nVaMP'),
(212, 49, '2019-01-25 21:52:44', '2019-01-25 13:52:44', 'dC0yYWnhNMw:APA91bF2q33fXMaQLc7ew8uuHYgBVYJEeMYzXBO4oH_P_-xtSE0KBemcpgkJuYVhIAlq3SvoAQGTA7GqUiPm5wtPHYiOCeP6OUV1sFoNCxb8fsg0maLn1ntyy0XxGnLsyxhGzIXGfMgm'),
(213, 49, '2019-01-25 21:52:59', '2019-01-25 13:52:59', 'dC0yYWnhNMw:APA91bF2q33fXMaQLc7ew8uuHYgBVYJEeMYzXBO4oH_P_-xtSE0KBemcpgkJuYVhIAlq3SvoAQGTA7GqUiPm5wtPHYiOCeP6OUV1sFoNCxb8fsg0maLn1ntyy0XxGnLsyxhGzIXGfMgm'),
(214, 49, '2019-01-25 21:53:20', '2019-01-25 13:53:20', 'dC0yYWnhNMw:APA91bF2q33fXMaQLc7ew8uuHYgBVYJEeMYzXBO4oH_P_-xtSE0KBemcpgkJuYVhIAlq3SvoAQGTA7GqUiPm5wtPHYiOCeP6OUV1sFoNCxb8fsg0maLn1ntyy0XxGnLsyxhGzIXGfMgm'),
(215, 49, '2019-02-09 23:49:31', '2019-02-09 15:49:31', 'fv1WIHZX4Nk:APA91bEGrslM3M8KxtBD7KaZ13OUDOVWxvWoAYtbA6z3MtMIRrxeHavP6atFJ78QOAnAGEQ9HjJxWznAU4xHsBlwW79lOcThGS4gqpBJcaCNabe2uWTX3L3Yr-bGG7v6kJbWLPS6u6sj'),
(216, 49, '2019-02-10 03:13:13', '2019-02-09 19:13:13', 'dC0yYWnhNMw:APA91bF2q33fXMaQLc7ew8uuHYgBVYJEeMYzXBO4oH_P_-xtSE0KBemcpgkJuYVhIAlq3SvoAQGTA7GqUiPm5wtPHYiOCeP6OUV1sFoNCxb8fsg0maLn1ntyy0XxGnLsyxhGzIXGfMgm'),
(217, 49, '2019-02-18 15:08:18', '2019-02-18 07:08:18', 'dOs-lKbruMw:APA91bHf34E1EN8Ug_uQkO6NCrMoupPHBUHBiJWg6FMamM1eSTC7h5fJtifAhKb-Mxtcfgg9yLe4FVN2cU923zVAzU4o5WXsJbSi6nkIjkCeoBu98X6bZ8l5_Fr5s6WL_wNDqXBWlM5Y'),
(218, 49, '2019-02-19 02:37:46', '2019-02-18 18:37:46', 'dXStTqgTzAE:APA91bGm3aFRRDeiZMJ6_tjpNDjlzgaDuz7miDC37UVUFNFhZWCGa2eK-sDrVRQQOzR_lQHz3W_e2rvWE1NDuxjBXap9bDt32_ieVon84O47A9mN_Iik3BLbUVWlIfdZK1u6H7wIpsf7'),
(219, 49, '2019-02-19 02:39:54', '2019-02-18 18:39:54', 'eXvD9YxOiqE:APA91bHZka8y91TT_TItDPl6P3tnlOyYzZ57qzOex5F8V7dbKXN48fQmPy3h8DU7YaVpEumoNv-Tu1wNu0io2sLCZLJdat16yRbU9z-Et_6McZQ6ZXapa608Gn0a9RTax_P3I32iFqWF'),
(220, 9, '2019-02-19 06:20:29', '2019-02-18 22:20:29', 'cvgN2pd8bgg:APA91bEosP-99Iq9orh_uOfvZFRIbr6UI4mmtNROOUb11inIUiaaV8hx7D3-o7JB4Gso44Fegc-yGRCrvEc3o_W0SwTG2tibeSxjrXB3vHEQ7n5UmtFRrhRhuoHLi-4M9YDpiyVo-MLo'),
(221, 49, '2019-02-19 07:09:47', '2019-02-18 23:09:47', 'fjttws8uwEo:APA91bHxWW38fh1TiTW4HV17dKiLck4A9wa5xuPhwX_YGOLS5KGsWcD_HrnPfTcsj7CaAcYmqOWGwTr5A7JiAEcnbQPjiYuxC3gd1IldurBy92wpUNz_kcxXhKCXH16oxHtnyHgbv8O6'),
(222, 49, '2019-02-19 08:49:34', '2019-02-19 00:49:34', 'cyDd9YHwp2c:APA91bGumRQaL0WKiMnDwIelRWzHerm_jCsm_ueTRwnf93qqjrqGcKQ53hoaxa-rVy20a0rgsDExWvj1Rvq6-gKCIGY9ZuxX2ffD5ygDReVSoAUDw557cEVqxAm1gx-HPPdOlDewax4y'),
(223, 49, '2019-02-20 22:13:49', '2019-02-20 14:13:49', 'eHCBmgMgLHc:APA91bFXKg8B37n7dac_1N-4xX6adJ7Y0CVltTTqBP5vsOw8AgFQZv3DH11f9jyL3SZnS_nQ-tCJ8j1aR4YBOlOxP0tbXXVOskq3Adhu0x2rtDCO2U2BH2VeXorHfMmgNOTAhlPqBphT'),
(224, 9, '2019-02-22 03:29:08', '2019-02-21 19:29:08', 'cJlsR2F3_xU:APA91bHoYCq3uMtzFhLZYIpf45CF1idBD1FwkSvuCNdpd0YBEaReckYhevBp_zCymQQWIMm9vF1Fw1KnBEdqjnkiSYb1hKnSUl-rb_BKOKyEY2EPA7RCbYq8GnS2Nadz9KecGhkMeGZT'),
(225, 9, '2019-02-22 03:31:58', '2019-02-21 19:31:58', 'cJlsR2F3_xU:APA91bHoYCq3uMtzFhLZYIpf45CF1idBD1FwkSvuCNdpd0YBEaReckYhevBp_zCymQQWIMm9vF1Fw1KnBEdqjnkiSYb1hKnSUl-rb_BKOKyEY2EPA7RCbYq8GnS2Nadz9KecGhkMeGZT'),
(226, 9, '2019-02-22 03:34:58', '2019-02-21 19:34:58', 'cJlsR2F3_xU:APA91bHoYCq3uMtzFhLZYIpf45CF1idBD1FwkSvuCNdpd0YBEaReckYhevBp_zCymQQWIMm9vF1Fw1KnBEdqjnkiSYb1hKnSUl-rb_BKOKyEY2EPA7RCbYq8GnS2Nadz9KecGhkMeGZT'),
(227, 9, '2019-02-22 03:36:22', '2019-02-21 19:36:22', 'cJlsR2F3_xU:APA91bHoYCq3uMtzFhLZYIpf45CF1idBD1FwkSvuCNdpd0YBEaReckYhevBp_zCymQQWIMm9vF1Fw1KnBEdqjnkiSYb1hKnSUl-rb_BKOKyEY2EPA7RCbYq8GnS2Nadz9KecGhkMeGZT'),
(228, 9, '2019-02-22 03:38:18', '2019-02-21 19:38:18', 'cJlsR2F3_xU:APA91bHoYCq3uMtzFhLZYIpf45CF1idBD1FwkSvuCNdpd0YBEaReckYhevBp_zCymQQWIMm9vF1Fw1KnBEdqjnkiSYb1hKnSUl-rb_BKOKyEY2EPA7RCbYq8GnS2Nadz9KecGhkMeGZT'),
(229, 9, '2019-02-22 03:40:09', '2019-02-21 19:40:09', 'cJlsR2F3_xU:APA91bHoYCq3uMtzFhLZYIpf45CF1idBD1FwkSvuCNdpd0YBEaReckYhevBp_zCymQQWIMm9vF1Fw1KnBEdqjnkiSYb1hKnSUl-rb_BKOKyEY2EPA7RCbYq8GnS2Nadz9KecGhkMeGZT'),
(230, 9, '2019-02-22 03:41:09', '2019-02-21 19:41:09', 'cJlsR2F3_xU:APA91bHoYCq3uMtzFhLZYIpf45CF1idBD1FwkSvuCNdpd0YBEaReckYhevBp_zCymQQWIMm9vF1Fw1KnBEdqjnkiSYb1hKnSUl-rb_BKOKyEY2EPA7RCbYq8GnS2Nadz9KecGhkMeGZT'),
(231, 9, '2019-02-22 03:41:50', '2019-02-21 19:41:50', 'cJlsR2F3_xU:APA91bHoYCq3uMtzFhLZYIpf45CF1idBD1FwkSvuCNdpd0YBEaReckYhevBp_zCymQQWIMm9vF1Fw1KnBEdqjnkiSYb1hKnSUl-rb_BKOKyEY2EPA7RCbYq8GnS2Nadz9KecGhkMeGZT'),
(232, 9, '2019-02-22 03:42:42', '2019-02-21 19:42:42', 'cJlsR2F3_xU:APA91bHoYCq3uMtzFhLZYIpf45CF1idBD1FwkSvuCNdpd0YBEaReckYhevBp_zCymQQWIMm9vF1Fw1KnBEdqjnkiSYb1hKnSUl-rb_BKOKyEY2EPA7RCbYq8GnS2Nadz9KecGhkMeGZT'),
(233, 9, '2019-02-22 03:43:05', '2019-02-21 19:43:05', 'cJlsR2F3_xU:APA91bHoYCq3uMtzFhLZYIpf45CF1idBD1FwkSvuCNdpd0YBEaReckYhevBp_zCymQQWIMm9vF1Fw1KnBEdqjnkiSYb1hKnSUl-rb_BKOKyEY2EPA7RCbYq8GnS2Nadz9KecGhkMeGZT'),
(234, 9, '2019-02-22 05:08:07', '2019-02-21 21:08:07', 'cJlsR2F3_xU:APA91bHoYCq3uMtzFhLZYIpf45CF1idBD1FwkSvuCNdpd0YBEaReckYhevBp_zCymQQWIMm9vF1Fw1KnBEdqjnkiSYb1hKnSUl-rb_BKOKyEY2EPA7RCbYq8GnS2Nadz9KecGhkMeGZT'),
(235, 9, '2019-02-22 05:11:21', '2019-02-21 21:11:21', 'cJlsR2F3_xU:APA91bHoYCq3uMtzFhLZYIpf45CF1idBD1FwkSvuCNdpd0YBEaReckYhevBp_zCymQQWIMm9vF1Fw1KnBEdqjnkiSYb1hKnSUl-rb_BKOKyEY2EPA7RCbYq8GnS2Nadz9KecGhkMeGZT'),
(236, 9, '2019-02-22 06:37:35', '2019-02-21 22:37:35', 'fXCWjr8kn0A:APA91bHDiZG9s2_53Li-PFDH1BgR3JXKmfQcqNG-BnneGxAcrD_jOXzTONpuClVESkFjaV8fv2MDmunX4o8EdvpvmkUBGHBaaqukYMg0pvkUzWJWaCFKdUG4oMjazrn7iDINuPEo8ybG'),
(237, 9, '2019-02-22 08:17:06', '2019-02-22 00:17:06', 'cJlsR2F3_xU:APA91bHoYCq3uMtzFhLZYIpf45CF1idBD1FwkSvuCNdpd0YBEaReckYhevBp_zCymQQWIMm9vF1Fw1KnBEdqjnkiSYb1hKnSUl-rb_BKOKyEY2EPA7RCbYq8GnS2Nadz9KecGhkMeGZT'),
(238, 9, '2019-02-22 20:07:35', '2019-02-22 12:07:35', 'dz_qR5g5g_4:APA91bFx-DnuWieZNDvWpsNKcIkQHFdhSYVFxB_9-OSXssDs5dVqz1CBgzNF4FS7zfVxN55TlQErLvpym6KTLBmqFISlHlj0MMbHjgddOQzSnochzygSKDb0Dke_tG7o4YjhiitGIuFq'),
(239, 9, '2019-02-22 20:36:49', '2019-02-22 12:36:49', 'dz_qR5g5g_4:APA91bFx-DnuWieZNDvWpsNKcIkQHFdhSYVFxB_9-OSXssDs5dVqz1CBgzNF4FS7zfVxN55TlQErLvpym6KTLBmqFISlHlj0MMbHjgddOQzSnochzygSKDb0Dke_tG7o4YjhiitGIuFq'),
(240, 9, '2019-02-22 23:34:11', '2019-02-22 15:34:11', 'eB3-q336ges:APA91bFsPT6vgkmPLQt0fgCzzvP8gswPQ0pGY-2r2iBP5dOexvqdZOxlCxsmo3yzFnUI5XQHk9VVqZOM6RIqvA91C9JFn2DxcwW3xLRFuZ53KC922twL11feZJ0wTTLdVAHTKuhKQ735'),
(241, 9, '2019-02-22 23:35:22', '2019-02-22 15:35:22', 'eB3-q336ges:APA91bFsPT6vgkmPLQt0fgCzzvP8gswPQ0pGY-2r2iBP5dOexvqdZOxlCxsmo3yzFnUI5XQHk9VVqZOM6RIqvA91C9JFn2DxcwW3xLRFuZ53KC922twL11feZJ0wTTLdVAHTKuhKQ735'),
(242, 9, '2019-02-23 01:02:07', '2019-02-22 17:02:07', 'eEPMKtY9g9A:APA91bEXipby4-mR_l14ATDbS0zQp4-c9jvbOaEpJB8UrOfaqbX-Gzl57o3F4pNxA-blbjhFQzWiae80WHZuIx0Pj4X-VeqNAIa1IdoJ4gvvgHYrmBrRKzQ_HckyUcOM4oo4ASiV4Urh'),
(243, 9, '2019-02-23 01:14:43', '2019-02-22 17:14:43', 'cu8WDtpKUes:APA91bFv0UlPEi_NwAw9LMvwBfFQ2hzRa2WVi3sW8TzZCJ4oDysKDVx4nXQfJERg8pqF36WCnMiuXGzyyJHvdwRPVpluulIBkWn9tA1Skf9z2Trn7KWkbW8MDBAD9vCa0qaAZjohIkoA'),
(244, 13, '2019-02-23 03:12:24', '2019-02-22 19:12:24', 'cYwxucFzpow:APA91bH7bh_0jDG5H4Lv7akFlbrzxsf2QCFtHdeEiyZhNQ8HaqyFzsPNmfzb7ov-LDt91HPu7Dz6ZzwLd2WRajAu9r57IFlwwCFlqqRkAlo_TDMWJPgj2J5g8uS9H_-uJKNQ24T040Wy'),
(245, 188, '2019-02-23 03:44:48', '2019-02-22 19:44:48', 'cb9Rt00zcJY:APA91bEEkXpRlZdnosNJPmf8K5UGNZMG-9A4a_IynrVBFQFIq-4YJvMFKLNqh1FES4OA24Vv6_9EHAGNMxkkRKDqAongjiNBB-qn3IEcpg2xc2oZkPn99lUtZQhiPKlroXY5HonBmPfj'),
(246, 49, '2019-02-23 03:46:41', '2019-02-22 19:46:41', 'cb9Rt00zcJY:APA91bEEkXpRlZdnosNJPmf8K5UGNZMG-9A4a_IynrVBFQFIq-4YJvMFKLNqh1FES4OA24Vv6_9EHAGNMxkkRKDqAongjiNBB-qn3IEcpg2xc2oZkPn99lUtZQhiPKlroXY5HonBmPfj'),
(247, 9, '2019-02-25 05:04:34', '2019-02-24 21:04:34', 'ebvJvxqmK54:APA91bG_URhvJo25rlXXo0C0pixcq-BZOPD4Lrz-6Py4azqucpd8EdyYh4ESssF0GmXf4fCOTPM6cRKyMgOdRx9Uaf2m32JRoc3RQeJTd7jIBRUVRtO6-ZcknQyy6C89XngsocDIizh5'),
(248, 9, '2019-02-25 05:06:00', '2019-02-24 21:06:00', 'ebvJvxqmK54:APA91bG_URhvJo25rlXXo0C0pixcq-BZOPD4Lrz-6Py4azqucpd8EdyYh4ESssF0GmXf4fCOTPM6cRKyMgOdRx9Uaf2m32JRoc3RQeJTd7jIBRUVRtO6-ZcknQyy6C89XngsocDIizh5'),
(249, 9, '2019-02-25 23:20:47', '2019-02-25 15:20:47', 'fTkNkIL4I40:APA91bHzBvrcsYy0_YG8-WkKVbpFJXqAkKSzf_yE7n7Pnnv_oGtLq6EvjO1hhHX8ew9m0OCaaVQ6FEd4t93bEQu67h8wq-o0rDGAuY-RGzg4kks-sp4ITJK4o-9wf-m21z40c5Fdz_Gc'),
(250, 9, '2019-02-26 07:58:42', '2019-02-25 23:58:42', 'eEPMKtY9g9A:APA91bEXipby4-mR_l14ATDbS0zQp4-c9jvbOaEpJB8UrOfaqbX-Gzl57o3F4pNxA-blbjhFQzWiae80WHZuIx0Pj4X-VeqNAIa1IdoJ4gvvgHYrmBrRKzQ_HckyUcOM4oo4ASiV4Urh'),
(251, 76, '2019-02-26 16:17:52', '2019-02-26 08:17:52', 'dwLYSMybnzs:APA91bEMn7yI7Owx7Zrx2qHpk9VwjHUTkisxHoQtPpQSBUNJHSNK3wEYGx4dEz7i_rcSuUGmybxkXe0oENOt0Q1QVWi6hp67z5hVfOy_rPz7tziS6ICQASmXHwfqzVDh7skCpbLRTd6f'),
(252, 9, '2019-02-26 20:15:23', '2019-02-26 12:15:23', 'fWPwm396WYU:APA91bF8dBlBSdf8jW_VQV8_-nMiNjcwyrrtxFy1B7MC3D7GdrVeuqd6bUDIYUl7UElFaTPjo8YxYzhIXc-cC-qIyBMnfNWFHS6v6xUAiRm9G6ZBOhJeRv7vcmaEbtYa7s0exEdgTmwA'),
(253, 9, '2019-02-26 20:26:18', '2019-02-26 12:26:18', 'fWPwm396WYU:APA91bF8dBlBSdf8jW_VQV8_-nMiNjcwyrrtxFy1B7MC3D7GdrVeuqd6bUDIYUl7UElFaTPjo8YxYzhIXc-cC-qIyBMnfNWFHS6v6xUAiRm9G6ZBOhJeRv7vcmaEbtYa7s0exEdgTmwA'),
(254, 9, '2019-02-26 21:56:51', '2019-02-26 13:56:51', 'cbfS_toVNcs:APA91bEtT2EDOdLOZ4N_9t7wcLwUbwV_sF3DbnTmwxQJiM1RB6WfuMck9bEpbg1Mdf74Bychob3suRZQrJQYTDMZG-Xcgb9BvqBta8yobCgF-Rf5VlhuSlvZ__O5QFUk1v7QTVFyEeF_'),
(255, 9, '2019-02-28 21:25:40', '2019-02-28 13:25:40', 'f57bf8425b829744f8fa876e59c13e7a1ac146a4f785294a212ab728850267d7'),
(256, 76, '2019-03-01 16:53:46', '2019-03-01 08:53:46', 'dqDZpg9F2bw:APA91bFTC89uvcHAcu7k3vIt_XiAHeg25Rj-DEZunfjvWioCfSrjoALDqvBXAZoFPBbv4LrxIv06VgO909h6VNyQsmHEXoQ-ot6NueL4qfYZlN886vViIKWUcBW531lCHINkm6t_TONB'),
(257, 201, '2019-03-01 20:33:46', '2019-03-01 12:33:46', 'dpiHpsuk6_A:APA91bEgoCFHmPzNQmSfAX_CHAOviuWyh4-VvuG1LOf6fAezZvEMv7A9oC5jAmeqUJJ4Ll8fqHJIIFS_53JSW0f95O-cguNB99JYQarrN4kSJjm2kqoOQ_O8SDm38f8WKKEa4XYTqCMO'),
(258, 202, '2019-03-01 22:45:17', '2019-03-01 14:45:17', 'cbfS_toVNcs:APA91bEtT2EDOdLOZ4N_9t7wcLwUbwV_sF3DbnTmwxQJiM1RB6WfuMck9bEpbg1Mdf74Bychob3suRZQrJQYTDMZG-Xcgb9BvqBta8yobCgF-Rf5VlhuSlvZ__O5QFUk1v7QTVFyEeF_'),
(259, 201, '2019-03-01 22:48:05', '2019-03-01 14:48:05', 'dpiHpsuk6_A:APA91bEgoCFHmPzNQmSfAX_CHAOviuWyh4-VvuG1LOf6fAezZvEMv7A9oC5jAmeqUJJ4Ll8fqHJIIFS_53JSW0f95O-cguNB99JYQarrN4kSJjm2kqoOQ_O8SDm38f8WKKEa4XYTqCMO'),
(260, 76, '2019-03-01 23:56:11', '2019-03-01 15:56:11', 'fO_AF5iLRo8:APA91bGlYUkTJexzS3g0Nwzf7RPm5IunOkJn8Zl2GJU1n44NcJN3BlP1WmJxYHNA6dgEDUpsZ1qmZ40UxZSz4n1KosHV80CYc666q6P_3IYvb3mS2GFWA4LHmF5MGC2-8CKbghCuPz7N'),
(261, 201, '2019-03-02 01:54:29', '2019-03-01 17:54:29', 'dpiHpsuk6_A:APA91bEgoCFHmPzNQmSfAX_CHAOviuWyh4-VvuG1LOf6fAezZvEMv7A9oC5jAmeqUJJ4Ll8fqHJIIFS_53JSW0f95O-cguNB99JYQarrN4kSJjm2kqoOQ_O8SDm38f8WKKEa4XYTqCMO'),
(262, 201, '2019-03-02 19:20:03', '2019-03-02 11:20:03', 'dA2QB030OTM:APA91bF3_rF44MwF0aTkr1ViAb6nbwkq-sd1qjHH7lMr7XzYewxqSrdxyFTGpUnkP2FYZELSb3Z6GKkrZ6iQif-Sy-LGuX3jH9MsulWetjlF-hnI76-lDgrisZlKKCdS0PzJBjtsJByI'),
(263, 9, '2019-03-02 20:06:01', '2019-03-02 12:06:01', 'dGLfaidJ7sE:APA91bHpnZi3YZv6y0g_qfbTnm8MFrGmVpmIlffHT_Eeo3EYyDWk3D3Ye_2nx4s2v3wCAQduGJrGPI2WKd6obC4yqHhQ0eJ0Y9hZST_x7d1SaTJG0Sbd3oh7abYslTGVcsGJSR5-10Yr'),
(264, 9, '2019-03-02 20:50:58', '2019-03-02 12:50:58', 'dzETNxtZ2O4:APA91bH5I2CfnpBeW9KFbCqJLgxG7kFGsghzQsVnzmcgr1mzc5ds3YRVxiw56t8fKoEEkGewBAZIVUYOnUAKBgoh30i6W4Jux0s-oO6xX-jKEGYW0ftHpmZ2AO6jdh92BPfqbqhwOmAl'),
(265, 9, '2019-03-02 20:57:31', '2019-03-02 12:57:31', 'f2QhpFgeA3s:APA91bHG9jBWtmfqhkmJJdTLkZ_BbIGaPvFTNjMiekAsLGPgG_K7ZPUN-T-AiZMQAc0q0_GBIc1S32tjrBfH2FM7ef8buhsIot0z-hl5SYFftJm9R2hbcJyiZpGKkVBaJIZpcIi24YRa'),
(266, 9, '2019-03-02 20:57:55', '2019-03-02 12:57:55', 'f2QhpFgeA3s:APA91bHG9jBWtmfqhkmJJdTLkZ_BbIGaPvFTNjMiekAsLGPgG_K7ZPUN-T-AiZMQAc0q0_GBIc1S32tjrBfH2FM7ef8buhsIot0z-hl5SYFftJm9R2hbcJyiZpGKkVBaJIZpcIi24YRa'),
(267, 9, '2019-03-02 21:06:20', '2019-03-02 13:06:20', 'dp1v0Q3LgrY:APA91bGQeJUYRp8ptz-Fp29nsTEgfD-Pkxj0NPsIhs5U-3nNR7SfNN-LTcLAw3THQAfKsc2sskgEWynHnydOz_aLjzOXTZX2JlNNEPBp6kZy3ac7yqiCqLXrRP_kZTj5OiJka2ZvU7IQ'),
(268, 9, '2019-03-02 21:07:07', '2019-03-02 13:07:07', 'dp1v0Q3LgrY:APA91bGQeJUYRp8ptz-Fp29nsTEgfD-Pkxj0NPsIhs5U-3nNR7SfNN-LTcLAw3THQAfKsc2sskgEWynHnydOz_aLjzOXTZX2JlNNEPBp6kZy3ac7yqiCqLXrRP_kZTj5OiJka2ZvU7IQ'),
(269, 209, '2019-03-03 00:13:07', '2019-03-02 16:13:07', 'cb9Rt00zcJY:APA91bEEkXpRlZdnosNJPmf8K5UGNZMG-9A4a_IynrVBFQFIq-4YJvMFKLNqh1FES4OA24Vv6_9EHAGNMxkkRKDqAongjiNBB-qn3IEcpg2xc2oZkPn99lUtZQhiPKlroXY5HonBmPfj'),
(270, 209, '2019-03-03 00:13:12', '2019-03-02 16:13:12', 'cb9Rt00zcJY:APA91bEEkXpRlZdnosNJPmf8K5UGNZMG-9A4a_IynrVBFQFIq-4YJvMFKLNqh1FES4OA24Vv6_9EHAGNMxkkRKDqAongjiNBB-qn3IEcpg2xc2oZkPn99lUtZQhiPKlroXY5HonBmPfj'),
(271, 209, '2019-03-03 00:13:33', '2019-03-02 16:13:33', 'cb9Rt00zcJY:APA91bEEkXpRlZdnosNJPmf8K5UGNZMG-9A4a_IynrVBFQFIq-4YJvMFKLNqh1FES4OA24Vv6_9EHAGNMxkkRKDqAongjiNBB-qn3IEcpg2xc2oZkPn99lUtZQhiPKlroXY5HonBmPfj'),
(272, 209, '2019-03-03 00:13:40', '2019-03-02 16:13:40', 'cb9Rt00zcJY:APA91bEEkXpRlZdnosNJPmf8K5UGNZMG-9A4a_IynrVBFQFIq-4YJvMFKLNqh1FES4OA24Vv6_9EHAGNMxkkRKDqAongjiNBB-qn3IEcpg2xc2oZkPn99lUtZQhiPKlroXY5HonBmPfj'),
(273, 210, '2019-03-03 00:17:03', '2019-03-02 16:17:03', 'cb9Rt00zcJY:APA91bEEkXpRlZdnosNJPmf8K5UGNZMG-9A4a_IynrVBFQFIq-4YJvMFKLNqh1FES4OA24Vv6_9EHAGNMxkkRKDqAongjiNBB-qn3IEcpg2xc2oZkPn99lUtZQhiPKlroXY5HonBmPfj'),
(274, 210, '2019-03-03 00:17:09', '2019-03-02 16:17:09', 'cb9Rt00zcJY:APA91bEEkXpRlZdnosNJPmf8K5UGNZMG-9A4a_IynrVBFQFIq-4YJvMFKLNqh1FES4OA24Vv6_9EHAGNMxkkRKDqAongjiNBB-qn3IEcpg2xc2oZkPn99lUtZQhiPKlroXY5HonBmPfj'),
(275, 49, '2019-03-03 00:17:48', '2019-03-02 16:17:48', 'cb9Rt00zcJY:APA91bEEkXpRlZdnosNJPmf8K5UGNZMG-9A4a_IynrVBFQFIq-4YJvMFKLNqh1FES4OA24Vv6_9EHAGNMxkkRKDqAongjiNBB-qn3IEcpg2xc2oZkPn99lUtZQhiPKlroXY5HonBmPfj'),
(276, 49, '2019-03-03 00:18:13', '2019-03-02 16:18:13', 'cb9Rt00zcJY:APA91bEEkXpRlZdnosNJPmf8K5UGNZMG-9A4a_IynrVBFQFIq-4YJvMFKLNqh1FES4OA24Vv6_9EHAGNMxkkRKDqAongjiNBB-qn3IEcpg2xc2oZkPn99lUtZQhiPKlroXY5HonBmPfj'),
(277, 9, '2019-03-03 00:31:46', '2019-03-02 16:31:46', 'fO_AF5iLRo8:APA91bGlYUkTJexzS3g0Nwzf7RPm5IunOkJn8Zl2GJU1n44NcJN3BlP1WmJxYHNA6dgEDUpsZ1qmZ40UxZSz4n1KosHV80CYc666q6P_3IYvb3mS2GFWA4LHmF5MGC2-8CKbghCuPz7N'),
(278, 9, '2019-03-03 00:42:57', '2019-03-02 16:42:57', 'fO_AF5iLRo8:APA91bGlYUkTJexzS3g0Nwzf7RPm5IunOkJn8Zl2GJU1n44NcJN3BlP1WmJxYHNA6dgEDUpsZ1qmZ40UxZSz4n1KosHV80CYc666q6P_3IYvb3mS2GFWA4LHmF5MGC2-8CKbghCuPz7N');
INSERT INTO `user_login_logs` (`ull_id`, `ull_user_id`, `ull_login_time`, `ull_logout_time`, `ull_device_id`) VALUES
(279, 9, '2019-03-03 01:11:40', '2019-03-02 17:11:40', 'fO_AF5iLRo8:APA91bGlYUkTJexzS3g0Nwzf7RPm5IunOkJn8Zl2GJU1n44NcJN3BlP1WmJxYHNA6dgEDUpsZ1qmZ40UxZSz4n1KosHV80CYc666q6P_3IYvb3mS2GFWA4LHmF5MGC2-8CKbghCuPz7N'),
(280, 49, '2019-03-03 01:15:13', '2019-03-02 17:15:13', 'ewWnOp0qjmE:APA91bGGjKROQ5i_w8d2zHz7T8kqEHiv7RczMCodVHIK4aQnCmuy53xENFWTRwFLFZsKtNeKjVInkJNjrJYhLO-WLTwJwbfNo9XlyepIm5FWLq19hOXBsZsCbQvxain270QI-jcb6Ph3'),
(281, 49, '2019-03-03 01:15:13', '2019-03-02 17:15:13', 'ewWnOp0qjmE:APA91bGGjKROQ5i_w8d2zHz7T8kqEHiv7RczMCodVHIK4aQnCmuy53xENFWTRwFLFZsKtNeKjVInkJNjrJYhLO-WLTwJwbfNo9XlyepIm5FWLq19hOXBsZsCbQvxain270QI-jcb6Ph3'),
(282, 49, '2019-03-03 01:16:10', '2019-03-02 17:16:10', 'ewWnOp0qjmE:APA91bGGjKROQ5i_w8d2zHz7T8kqEHiv7RczMCodVHIK4aQnCmuy53xENFWTRwFLFZsKtNeKjVInkJNjrJYhLO-WLTwJwbfNo9XlyepIm5FWLq19hOXBsZsCbQvxain270QI-jcb6Ph3'),
(283, 49, '2019-03-03 01:16:25', '2019-03-02 17:16:25', 'ewWnOp0qjmE:APA91bGGjKROQ5i_w8d2zHz7T8kqEHiv7RczMCodVHIK4aQnCmuy53xENFWTRwFLFZsKtNeKjVInkJNjrJYhLO-WLTwJwbfNo9XlyepIm5FWLq19hOXBsZsCbQvxain270QI-jcb6Ph3'),
(284, 49, '2019-03-03 01:18:07', '2019-03-02 17:18:07', 'ewWnOp0qjmE:APA91bGGjKROQ5i_w8d2zHz7T8kqEHiv7RczMCodVHIK4aQnCmuy53xENFWTRwFLFZsKtNeKjVInkJNjrJYhLO-WLTwJwbfNo9XlyepIm5FWLq19hOXBsZsCbQvxain270QI-jcb6Ph3'),
(285, 49, '2019-03-03 01:18:40', '2019-03-02 17:18:40', 'ewWnOp0qjmE:APA91bGGjKROQ5i_w8d2zHz7T8kqEHiv7RczMCodVHIK4aQnCmuy53xENFWTRwFLFZsKtNeKjVInkJNjrJYhLO-WLTwJwbfNo9XlyepIm5FWLq19hOXBsZsCbQvxain270QI-jcb6Ph3'),
(286, 49, '2019-03-03 01:18:46', '2019-03-02 17:18:46', 'dOs-lKbruMw:APA91bGMgqEvYfNasplfdnx8fBYYF4rBVfRGsYqHJvPUKqyDsG-DWKW1K62mvwv938_xFSmUtQLynaREwzvfjxUzUIB-n-Xwl1Oasmc-DwdN8vftU-Jwp5oOAqk_FT7srH2sjdhSN-Xe'),
(287, 49, '2019-03-03 01:18:52', '2019-03-02 17:18:52', 'ewWnOp0qjmE:APA91bGGjKROQ5i_w8d2zHz7T8kqEHiv7RczMCodVHIK4aQnCmuy53xENFWTRwFLFZsKtNeKjVInkJNjrJYhLO-WLTwJwbfNo9XlyepIm5FWLq19hOXBsZsCbQvxain270QI-jcb6Ph3'),
(288, 49, '2019-03-03 01:19:47', '2019-03-02 17:19:47', 'dOs-lKbruMw:APA91bGMgqEvYfNasplfdnx8fBYYF4rBVfRGsYqHJvPUKqyDsG-DWKW1K62mvwv938_xFSmUtQLynaREwzvfjxUzUIB-n-Xwl1Oasmc-DwdN8vftU-Jwp5oOAqk_FT7srH2sjdhSN-Xe'),
(289, 49, '2019-03-03 01:19:54', '2019-03-02 17:19:54', 'ewWnOp0qjmE:APA91bGGjKROQ5i_w8d2zHz7T8kqEHiv7RczMCodVHIK4aQnCmuy53xENFWTRwFLFZsKtNeKjVInkJNjrJYhLO-WLTwJwbfNo9XlyepIm5FWLq19hOXBsZsCbQvxain270QI-jcb6Ph3'),
(290, 49, '2019-03-03 01:21:38', '2019-03-02 17:21:38', 'cb9Rt00zcJY:APA91bEEkXpRlZdnosNJPmf8K5UGNZMG-9A4a_IynrVBFQFIq-4YJvMFKLNqh1FES4OA24Vv6_9EHAGNMxkkRKDqAongjiNBB-qn3IEcpg2xc2oZkPn99lUtZQhiPKlroXY5HonBmPfj'),
(291, 49, '2019-03-03 01:23:26', '2019-03-02 17:23:26', 'ewWnOp0qjmE:APA91bGGjKROQ5i_w8d2zHz7T8kqEHiv7RczMCodVHIK4aQnCmuy53xENFWTRwFLFZsKtNeKjVInkJNjrJYhLO-WLTwJwbfNo9XlyepIm5FWLq19hOXBsZsCbQvxain270QI-jcb6Ph3'),
(292, 49, '2019-03-03 01:24:18', '2019-03-02 17:24:18', 'ewWnOp0qjmE:APA91bGGjKROQ5i_w8d2zHz7T8kqEHiv7RczMCodVHIK4aQnCmuy53xENFWTRwFLFZsKtNeKjVInkJNjrJYhLO-WLTwJwbfNo9XlyepIm5FWLq19hOXBsZsCbQvxain270QI-jcb6Ph3'),
(293, 49, '2019-03-03 01:24:18', '2019-03-02 17:24:18', 'ewWnOp0qjmE:APA91bGGjKROQ5i_w8d2zHz7T8kqEHiv7RczMCodVHIK4aQnCmuy53xENFWTRwFLFZsKtNeKjVInkJNjrJYhLO-WLTwJwbfNo9XlyepIm5FWLq19hOXBsZsCbQvxain270QI-jcb6Ph3'),
(294, 49, '2019-03-03 01:24:46', '2019-03-02 17:24:46', 'ewWnOp0qjmE:APA91bGGjKROQ5i_w8d2zHz7T8kqEHiv7RczMCodVHIK4aQnCmuy53xENFWTRwFLFZsKtNeKjVInkJNjrJYhLO-WLTwJwbfNo9XlyepIm5FWLq19hOXBsZsCbQvxain270QI-jcb6Ph3'),
(295, 49, '2019-03-03 01:32:18', '2019-03-02 17:32:18', 'diqLtIDtIgw:APA91bHWkqasUwf6I8uWeyk9hkTD0fPVPlcwUDaXcp61bHrBMw6uElchaAQleTHE0cgLps9FVRiYzFkP3SivW7J_iJdWR1HxnMIYaR1eZL6799u4v40FoXIs_h8O_N6Lnefbe_wN6-pb'),
(296, 9, '2019-03-03 01:46:51', '2019-03-02 17:46:51', 'en8YaZl3vbQ:APA91bEi-gNAWykgRE4a6gyuOiSNb6Rwp6GmtKgfGH2BFWlx1gg1bXgYAdm79FPbBzNVX7kwPH9AUs-6YddgHhQNve54YThdxPxzAatBshws-_NS8gvJd7msrf9I8qCWrWPdohI3ljyI'),
(297, 13, '2019-03-03 01:47:06', '2019-03-02 17:47:06', 'eSsbdprP1sc:APA91bFVtHQztCWa13s10QNhzQtzc17FJDEQCN1GDOkjNo3_EOvk82CqIGh12AzpWhp7dUxa7bEhvpcKcsOL_BDBeFxwCfBrzstdVkEYEGuKrGtHY-SGtY0Jkss3fIE8SWfoaJiRqPTp'),
(298, 201, '2019-03-03 01:58:38', '2019-03-02 17:58:38', 'eKyRqKqQdxo:APA91bExEO84Lzqm1t1Wwk3gaseamVbBxKorKeR7rlUvVHBniP8Wrw5FzeC1BMAIvlwYtWh3H2aFeXgElnJPLwg9R7oGwvvGdcVInxDQ0w6kAGUZhmAG-rPhMhkZktGUKCltb3BUvUjJ'),
(299, 13, '2019-03-03 02:06:33', '2019-03-02 18:06:33', 'eSsbdprP1sc:APA91bFVtHQztCWa13s10QNhzQtzc17FJDEQCN1GDOkjNo3_EOvk82CqIGh12AzpWhp7dUxa7bEhvpcKcsOL_BDBeFxwCfBrzstdVkEYEGuKrGtHY-SGtY0Jkss3fIE8SWfoaJiRqPTp');

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

CREATE TABLE `user_type` (
  `ut_id` int(11) NOT NULL,
  `ut_type_name` varchar(20) NOT NULL,
  `ut_type_details` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_type`
--

INSERT INTO `user_type` (`ut_id`, `ut_type_name`, `ut_type_details`) VALUES
(1, 'Admin', 'Moov admin'),
(2, 'Sub Admin', 'Moov'),
(3, 'User', ''),
(4, 'Driver', ''),
(5, 'College', ''),
(6, 'Car owner', '');

-- --------------------------------------------------------

--
-- Table structure for table `wallet`
--

CREATE TABLE `wallet` (
  `w_id` int(11) NOT NULL,
  `w_user_id` int(11) DEFAULT NULL,
  `w_amount` varchar(255) DEFAULT NULL,
  `w_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `w_last_updated` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wallet`
--

INSERT INTO `wallet` (`w_id`, `w_user_id`, `w_amount`, `w_created`, `w_last_updated`) VALUES
(1, 1, '10000', '2019-02-20 14:12:14', '2019-02-20 22:12:14'),
(2, 2, '7200', '2019-03-01 17:29:25', '2019-02-09 23:35:44'),
(3, 3, '13000', '2019-02-20 14:14:19', '2019-02-20 22:14:19'),
(4, 4, '47444.5', '2018-10-03 13:25:33', '2018-10-03 13:17:42'),
(5, 5, '8000', '2019-01-25 12:55:51', '2018-09-20 14:19:25'),
(6, 6, '8000', '2019-01-25 12:55:55', '2018-09-20 16:08:44'),
(7, 7, '8000', '2019-01-25 12:55:58', '2018-09-20 16:18:47'),
(8, 8, '14951906.000000002', '2018-09-21 14:06:37', '2018-09-21 18:36:37'),
(9, 9, '5378', '2019-03-02 17:51:51', '2018-09-20 19:34:16'),
(10, 10, '0', '2018-09-20 21:40:20', '2018-09-20 21:40:20'),
(11, 11, '499941476.42500013', '2018-10-01 04:42:20', '2018-10-01 04:42:20'),
(12, 12, '1708.4000000000003', '2019-03-01 15:40:34', '2019-03-01 23:40:34'),
(13, 13, '88.8', '2019-03-02 12:22:34', '2019-03-02 20:22:34'),
(14, 14, '671.4749999999999', '2019-02-22 14:24:30', '2018-09-28 19:44:12'),
(15, 15, '0', '2018-09-22 19:43:10', '2018-09-22 19:43:10'),
(16, 16, '0', '2018-09-22 19:46:53', '2018-09-22 19:46:53'),
(17, 17, '0', '2018-09-23 22:09:47', '2018-09-23 22:09:47'),
(18, 18, '0', '2018-09-24 17:21:07', '2018-09-24 17:21:07'),
(19, 19, '0', '2018-09-24 17:22:43', '2018-09-24 17:22:43'),
(20, 20, '0', '2018-09-24 17:27:12', '2018-09-24 17:27:12'),
(21, 21, '0', '2018-09-24 17:34:01', '2018-09-24 17:34:01'),
(22, 22, '0', '2018-09-24 17:41:53', '2018-09-24 17:41:53'),
(23, 23, '0', '2018-09-24 17:44:09', '2018-09-24 17:44:09'),
(24, 24, '8000', '2019-01-25 12:56:08', '2018-09-25 09:21:02'),
(25, 25, '8000', '2019-01-25 12:56:05', '2018-09-25 09:34:32'),
(26, 26, '0', '2018-09-25 13:33:19', '2018-09-25 13:33:19'),
(27, 27, '0', '2018-09-25 16:26:22', '2018-09-25 16:26:22'),
(28, 28, '0', '2018-09-25 17:52:39', '2018-09-25 17:52:39'),
(29, 29, '0', '2018-09-26 15:05:57', '2018-09-26 15:05:57'),
(30, 30, '0', '2018-09-26 15:10:25', '2018-09-26 15:10:25'),
(31, 31, '0', '2018-09-26 15:11:09', '2018-09-26 15:11:09'),
(32, 32, '0', '2018-09-26 15:12:39', '2018-09-26 15:12:39'),
(33, 33, '0', '2018-09-26 16:03:27', '2018-09-26 16:03:27'),
(34, 34, '0', '2018-09-26 16:18:24', '2018-09-26 16:18:24'),
(35, 35, '0', '2018-09-26 16:22:34', '2018-09-26 16:22:34'),
(36, 36, '0', '2018-09-26 16:29:09', '2018-09-26 16:29:09'),
(37, 37, '0', '2018-09-26 16:31:52', '2018-09-26 16:31:52'),
(38, 38, '0', '2018-09-26 16:34:12', '2018-09-26 16:34:12'),
(39, 39, '0', '2018-09-26 16:34:17', '2018-09-26 16:34:17'),
(40, 40, '0', '2018-09-26 16:34:47', '2018-09-26 16:34:47'),
(41, 41, '0', '2018-09-26 16:37:02', '2018-09-26 16:37:02'),
(42, 42, '0', '2018-09-26 16:38:09', '2018-09-26 16:38:09'),
(43, 43, '0', '2018-09-26 19:13:09', '2018-09-26 19:13:09'),
(44, 44, '0', '2018-09-26 19:13:44', '2018-09-26 19:13:44'),
(45, 45, '0', '2018-09-26 19:18:41', '2018-09-26 19:18:41'),
(46, 46, '0', '2018-09-26 19:44:01', '2018-09-26 19:44:01'),
(47, 47, '0', '2018-09-26 19:45:55', '2018-09-26 19:45:55'),
(48, 48, '0', '2018-09-26 19:49:53', '2018-09-26 19:49:53'),
(49, 49, '1030.6499999999999', '2019-03-01 15:40:34', '2019-03-01 23:40:34'),
(50, 50, '0', '2018-09-27 08:57:49', '2018-09-27 08:57:49'),
(51, 51, '0', '2018-09-27 11:02:35', '2018-09-27 11:02:35'),
(52, 52, '0', '2018-09-27 12:51:12', '2018-09-27 12:51:12'),
(53, 54, '0', '2018-09-27 18:12:17', '2018-09-27 18:12:17'),
(54, 55, '0', '2018-09-27 18:25:22', '2018-09-27 18:25:22'),
(55, 56, '0', '2018-09-27 18:39:36', '2018-09-27 18:39:36'),
(56, 57, '0', '2018-09-27 19:12:08', '2018-09-27 19:12:08'),
(57, 58, '0', '2018-09-27 19:18:48', '2018-09-27 19:18:48'),
(58, 59, '0', '2018-09-28 09:11:26', '2018-09-28 09:11:26'),
(59, 60, '0', '2018-09-28 12:49:01', '2018-09-28 12:49:01'),
(60, 61, '0', '2018-09-28 12:55:46', '2018-09-28 12:55:46'),
(61, 62, '0', '2018-09-28 14:44:26', '2018-09-28 14:44:26'),
(62, 63, '11381.375', '2018-10-03 12:43:47', '2018-10-03 12:43:47'),
(63, 64, '0', '2018-10-03 13:16:30', '2018-10-03 13:16:30'),
(64, 65, '0', '2018-10-03 13:18:52', '2018-10-03 13:18:52'),
(65, 66, '0', '2018-10-03 13:33:43', '2018-10-03 13:33:43'),
(66, 67, '0', '2018-10-04 13:15:04', '2018-10-04 13:15:04'),
(67, 68, '0', '2018-10-04 13:37:21', '2018-10-04 13:37:21'),
(68, 69, '0', '2018-10-05 09:22:29', '2018-10-05 09:22:29'),
(69, 70, '0', '2018-10-05 10:14:29', '2018-10-05 10:14:29'),
(70, 71, '0', '2018-10-09 04:09:25', '2018-10-09 04:09:25'),
(71, 72, '0', '2018-10-09 13:26:43', '2018-10-09 13:26:43'),
(72, 73, '0', '2018-10-09 13:40:05', '2018-10-09 13:40:05'),
(73, 74, '0', '2018-10-09 21:33:14', '2018-10-09 21:33:14'),
(74, 75, '0', '2018-10-12 19:51:38', '2018-10-12 19:51:38'),
(75, 76, '8000', '2019-02-21 21:28:11', '2018-10-13 13:36:43'),
(76, 77, '0', '2018-10-14 17:57:27', '2018-10-14 17:57:27'),
(77, 78, '0', '2018-10-20 07:57:34', '2018-10-20 07:57:34'),
(78, 79, '0', '2018-10-21 13:11:07', '2018-10-21 13:11:07'),
(79, NULL, '0', '2018-10-27 18:05:37', '2018-10-27 18:05:37'),
(80, NULL, '0', '2018-10-27 18:07:09', '2018-10-27 18:07:09'),
(81, NULL, '0', '2018-11-05 06:31:28', '2018-11-05 06:31:28'),
(82, 83, '0', '2018-11-05 08:11:13', '2018-11-05 08:11:13'),
(83, NULL, '0', '2018-11-05 14:55:42', '2018-11-05 14:55:42'),
(84, NULL, '0', '2018-11-08 05:52:46', '2018-11-08 05:52:46'),
(85, 87, '0', '2018-11-08 18:16:34', '2018-11-08 18:16:34'),
(86, 88, '0', '2018-11-08 18:35:07', '2018-11-08 18:35:07'),
(87, 89, '0', '2018-11-08 18:38:40', '2018-11-08 18:38:40'),
(88, 90, '0', '2018-11-08 18:43:02', '2018-11-08 18:43:02'),
(89, 91, '0', '2018-11-08 19:16:32', '2018-11-08 19:16:32'),
(90, 92, '0', '2018-11-08 19:24:08', '2018-11-08 19:24:08'),
(91, 93, '0', '2018-11-08 19:26:58', '2018-11-08 19:26:58'),
(92, NULL, '0', '2018-11-08 19:40:23', '2018-11-08 19:40:23'),
(93, NULL, '0', '2018-11-08 19:45:22', '2018-11-08 19:45:22'),
(94, NULL, '0', '2018-11-08 19:46:04', '2018-11-08 19:46:04'),
(95, 97, '0', '2018-11-08 19:46:37', '2018-11-08 19:46:37'),
(96, NULL, '0', '2018-11-09 14:03:18', '2018-11-09 14:03:18'),
(97, NULL, '0', '2018-11-09 14:04:19', '2018-11-09 14:04:19'),
(98, NULL, '0', '2018-11-12 17:37:59', '2018-11-12 17:37:59'),
(99, NULL, '0', '2018-11-13 02:25:31', '2018-11-13 02:25:31'),
(100, NULL, '0', '2018-11-15 20:44:58', '2018-11-15 20:44:58'),
(101, NULL, '0', '2018-11-15 20:45:33', '2018-11-15 20:45:33'),
(102, NULL, '0', '2018-11-15 20:46:19', '2018-11-15 20:46:19'),
(103, NULL, '0', '2018-11-18 11:35:14', '2018-11-18 11:35:14'),
(104, NULL, '0', '2018-11-18 11:38:07', '2018-11-18 11:38:07'),
(105, NULL, '0', '2018-11-18 11:42:43', '2018-11-18 11:42:43'),
(106, NULL, '0', '2018-11-22 19:15:40', '2018-11-22 19:15:40'),
(107, NULL, '0', '2018-11-23 20:44:54', '2018-11-23 20:44:54'),
(108, NULL, '0', '2018-11-28 17:21:40', '2018-11-28 17:21:40'),
(109, NULL, '0', '2018-11-28 17:33:08', '2018-11-28 17:33:08'),
(110, NULL, '0', '2018-11-30 17:58:35', '2018-11-30 17:58:35'),
(111, NULL, '0', '2018-11-30 17:59:31', '2018-11-30 17:59:31'),
(112, NULL, '0', '2018-11-30 18:15:20', '2018-11-30 18:15:20'),
(113, NULL, '0', '2018-11-30 18:19:15', '2018-11-30 18:19:15'),
(114, NULL, '0', '2018-11-30 23:22:03', '2018-11-30 23:22:03'),
(115, NULL, '0', '2018-12-01 14:36:57', '2018-12-01 14:36:57'),
(116, NULL, '0', '2018-12-01 14:37:49', '2018-12-01 14:37:49'),
(117, NULL, '0', '2018-12-04 13:49:25', '2018-12-04 13:49:25'),
(118, NULL, '0', '2018-12-05 16:18:01', '2018-12-05 16:18:01'),
(119, NULL, '0', '2018-12-10 13:19:52', '2018-12-10 13:19:52'),
(120, NULL, '0', '2018-12-10 14:01:10', '2018-12-10 14:01:10'),
(121, NULL, '0', '2018-12-10 14:05:56', '2018-12-10 14:05:56'),
(122, NULL, '0', '2018-12-10 16:25:07', '2018-12-10 16:25:07'),
(123, NULL, '0', '2018-12-14 15:11:01', '2018-12-14 15:11:01'),
(124, NULL, '0', '2018-12-14 15:12:45', '2018-12-14 15:12:45'),
(125, NULL, '0', '2018-12-18 21:47:05', '2018-12-18 21:47:05'),
(126, NULL, '0', '2018-12-18 21:47:31', '2018-12-18 21:47:31'),
(127, NULL, '0', '2018-12-18 21:47:49', '2018-12-18 21:47:49'),
(128, NULL, '0', '2018-12-18 21:48:28', '2018-12-18 21:48:28'),
(129, NULL, '0', '2018-12-18 22:43:00', '2018-12-18 22:43:00'),
(130, NULL, '0', '2018-12-19 01:08:42', '2018-12-19 01:08:42'),
(131, NULL, '0', '2018-12-20 19:04:23', '2018-12-20 19:04:23'),
(132, NULL, '0', '2018-12-22 05:52:04', '2018-12-22 05:52:04'),
(133, NULL, '0', '2018-12-22 05:55:52', '2018-12-22 05:55:52'),
(134, NULL, '0', '2018-12-25 03:39:54', '2018-12-25 03:39:54'),
(135, NULL, '0', '2018-12-25 05:58:02', '2018-12-25 05:58:02'),
(136, NULL, '0', '2018-12-25 06:04:05', '2018-12-25 06:04:05'),
(137, NULL, '0', '2019-01-09 16:45:38', '2019-01-09 16:45:38'),
(138, NULL, '0', '2019-01-09 16:48:28', '2019-01-09 16:48:28'),
(139, NULL, '0', '2019-01-09 23:11:20', '2019-01-09 23:11:20'),
(140, NULL, '0', '2019-01-10 00:03:34', '2019-01-10 00:03:34'),
(141, NULL, '0', '2019-01-10 00:09:30', '2019-01-10 00:09:30'),
(142, NULL, '0', '2019-01-10 00:40:09', '2019-01-10 00:40:09'),
(143, NULL, '0', '2019-01-10 00:52:46', '2019-01-10 00:52:46'),
(144, NULL, '0', '2019-01-10 00:54:13', '2019-01-10 00:54:13'),
(145, NULL, '0', '2019-01-10 01:31:13', '2019-01-10 01:31:13'),
(146, NULL, '0', '2019-01-10 08:57:21', '2019-01-10 08:57:21'),
(147, NULL, '0', '2019-01-10 19:42:34', '2019-01-10 19:42:34'),
(148, NULL, '0', '2019-01-10 19:52:23', '2019-01-10 19:52:23'),
(149, NULL, '0', '2019-01-10 21:43:34', '2019-01-10 21:43:34'),
(150, NULL, '0', '2019-01-10 21:52:25', '2019-01-10 21:52:25'),
(151, NULL, '0', '2019-01-10 22:10:53', '2019-01-10 22:10:53'),
(152, NULL, '0', '2019-01-10 22:11:46', '2019-01-10 22:11:46'),
(153, NULL, '0', '2019-01-10 22:12:00', '2019-01-10 22:12:00'),
(154, NULL, '0', '2019-01-10 22:12:49', '2019-01-10 22:12:49'),
(155, NULL, '0', '2019-01-10 22:13:49', '2019-01-10 22:13:49'),
(156, NULL, '0', '2019-01-10 22:14:39', '2019-01-10 22:14:39'),
(157, 159, '57.04999999999848', '2019-03-02 12:22:34', '2019-03-02 20:22:34'),
(158, 160, '400', '2019-02-21 09:11:27', '2019-01-10 23:49:23'),
(159, 162, '0', '2019-01-11 22:47:17', '2019-01-11 22:47:17'),
(160, 163, '0', '2019-01-14 19:07:26', '2019-01-14 19:07:26'),
(161, 164, '0', '2019-01-16 17:34:01', '2019-01-16 17:34:01'),
(162, 165, '0', '2019-01-21 08:10:42', '2019-01-21 08:10:42'),
(163, 166, '0', '2019-02-20 14:25:44', '2019-02-20 22:25:44'),
(164, 167, '0', '2019-01-25 20:45:31', '2019-01-25 20:45:31'),
(165, 168, '0', '2019-01-25 21:06:07', '2019-01-25 21:06:07'),
(166, NULL, '0', '2019-03-02 19:06:26', '2019-01-25 21:09:14'),
(167, NULL, '0', '2019-01-25 21:09:38', '2019-01-25 21:09:38'),
(168, 172, '0', '2019-01-25 22:53:01', '2019-01-25 22:53:01'),
(169, 173, '0', '2019-01-27 21:41:01', '2019-01-27 21:41:01'),
(170, 174, '0', '2019-01-30 03:36:49', '2019-01-30 03:36:49'),
(171, 175, '0', '2019-01-31 18:47:19', '2019-01-31 18:47:19'),
(172, 176, '0', '2019-02-09 22:35:18', '2019-02-09 22:35:18'),
(173, 177, '0', '2019-02-09 22:39:58', '2019-02-09 22:39:58'),
(174, 178, '0', '2019-02-10 09:48:23', '2019-02-10 09:48:23'),
(175, 179, '0', '2019-02-12 18:18:17', '2019-02-12 18:18:17'),
(176, 145, '7000', '2019-02-15 09:24:10', '2019-02-14 19:33:08'),
(177, 180, '0', '2019-02-16 12:51:16', '2019-02-16 12:51:16'),
(178, 182, '0', '2019-02-20 21:42:34', '2019-02-20 21:42:34'),
(179, 183, '0', '2019-02-21 21:34:45', '2019-02-21 21:34:45'),
(180, 184, '0', '2019-02-21 22:03:36', '2019-02-21 22:03:36'),
(181, 185, '0', '2019-02-22 04:03:51', '2019-02-22 04:03:51'),
(182, 186, '0', '2019-02-22 04:06:52', '2019-02-22 04:06:52'),
(183, 187, '0', '2019-02-22 23:07:29', '2019-02-22 23:07:29'),
(184, NULL, '0', '2019-02-23 03:43:59', '2019-02-23 03:43:59'),
(185, 189, '0', '2019-02-25 02:15:37', '2019-02-25 02:15:37'),
(186, 190, '0', '2019-02-26 02:49:17', '2019-02-26 02:49:17'),
(187, 191, '0', '2019-02-26 21:57:37', '2019-02-26 21:57:37'),
(188, 192, '0', '2019-02-27 00:57:07', '2019-02-27 00:57:07'),
(189, 193, '0', '2019-02-27 05:54:39', '2019-02-27 05:54:39'),
(190, 194, '0', '2019-02-27 07:46:29', '2019-02-27 07:46:29'),
(191, 195, '0', '2019-02-27 08:03:30', '2019-02-27 08:03:30'),
(192, 196, '0', '2019-02-27 09:05:38', '2019-02-27 09:05:38'),
(193, 197, '0', '2019-02-27 18:35:54', '2019-02-27 18:35:54'),
(194, 198, '0', '2019-02-27 23:18:06', '2019-02-27 23:18:06'),
(195, 199, '0', '2019-02-28 06:24:21', '2019-02-28 06:24:21'),
(196, 200, '0', '2019-02-28 20:20:01', '2019-02-28 20:20:01'),
(197, 201, '1015', '2019-02-28 13:30:57', '2019-02-28 21:25:20'),
(198, 202, '0', '2019-03-01 22:36:18', '2019-03-01 22:36:18'),
(199, 203, '4975', '2019-03-01 17:29:25', '2019-03-02 01:24:08'),
(200, 204, '0', '2019-03-02 16:44:05', '2019-03-02 16:44:05'),
(201, 205, '0', '2019-03-02 18:27:04', '2019-03-02 18:27:04'),
(202, 206, '0', '2019-03-02 18:28:31', '2019-03-02 18:28:31'),
(203, 207, '0', '2019-03-02 18:29:38', '2019-03-02 18:29:38'),
(204, 208, '0', '2019-03-02 20:31:21', '2019-03-02 20:31:21'),
(205, NULL, '0', '2019-03-03 00:12:56', '2019-03-03 00:12:56'),
(206, NULL, '0', '2019-03-03 00:16:42', '2019-03-03 00:16:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bank_details`
--
ALTER TABLE `bank_details`
  ADD PRIMARY KEY (`bd_id`);

--
-- Indexes for table `cab_rides`
--
ALTER TABLE `cab_rides`
  ADD PRIMARY KEY (`cr_id`),
  ADD KEY `cr_trip_id` (`cr_trip_id`);

--
-- Indexes for table `cab_trip`
--
ALTER TABLE `cab_trip`
  ADD PRIMARY KEY (`ct_id`),
  ADD KEY `ct_driver_id` (`ct_driver_id`);

--
-- Indexes for table `car_model`
--
ALTER TABLE `car_model`
  ADD PRIMARY KEY (`cm_id`);

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `driver_details`
--
ALTER TABLE `driver_details`
  ADD PRIMARY KEY (`dc_id`),
  ADD UNIQUE KEY `dc_driver_id` (`dd_driver_id`),
  ADD KEY `dc_car_model_id` (`dd_car_model_id`);

--
-- Indexes for table `driver_ratings`
--
ALTER TABLE `driver_ratings`
  ADD PRIMARY KEY (`dr_id`);

--
-- Indexes for table `driver_shift`
--
ALTER TABLE `driver_shift`
  ADD PRIMARY KEY (`ds_id`);

--
-- Indexes for table `edu_institution`
--
ALTER TABLE `edu_institution`
  ADD PRIMARY KEY (`ei_id`),
  ADD UNIQUE KEY `ei_email` (`ei_email`);

--
-- Indexes for table `edu_wallet`
--
ALTER TABLE `edu_wallet`
  ADD PRIMARY KEY (`w_id`),
  ADD UNIQUE KEY `edu_id` (`w_edu_id`);

--
-- Indexes for table `moov_logs`
--
ALTER TABLE `moov_logs`
  ADD PRIMARY KEY (`ml_id`);

--
-- Indexes for table `moov_wallet`
--
ALTER TABLE `moov_wallet`
  ADD PRIMARY KEY (`mw_id`);

--
-- Indexes for table `otp_mobile`
--
ALTER TABLE `otp_mobile`
  ADD PRIMARY KEY (`otp_id`);

--
-- Indexes for table `price_share`
--
ALTER TABLE `price_share`
  ADD UNIQUE KEY `school_id_index` (`school_id`);

--
-- Indexes for table `ride_peak_hours`
--
ALTER TABLE `ride_peak_hours`
  ADD PRIMARY KEY (`rph_id`);

--
-- Indexes for table `ride_rates`
--
ALTER TABLE `ride_rates`
  ADD PRIMARY KEY (`rr_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `salary_release`
--
ALTER TABLE `salary_release`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_messages`
--
ALTER TABLE `support_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`u_id`),
  ADD UNIQUE KEY `useremail` (`u_email`);

--
-- Indexes for table `user_login_logs`
--
ALTER TABLE `user_login_logs`
  ADD PRIMARY KEY (`ull_id`),
  ADD KEY `ull_user_id` (`ull_user_id`);

--
-- Indexes for table `user_type`
--
ALTER TABLE `user_type`
  ADD PRIMARY KEY (`ut_id`);

--
-- Indexes for table `wallet`
--
ALTER TABLE `wallet`
  ADD PRIMARY KEY (`w_id`),
  ADD KEY `w_user_id` (`w_user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bank_details`
--
ALTER TABLE `bank_details`
  MODIFY `bd_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `cab_rides`
--
ALTER TABLE `cab_rides`
  MODIFY `cr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=310;

--
-- AUTO_INCREMENT for table `cab_trip`
--
ALTER TABLE `cab_trip`
  MODIFY `ct_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=231;

--
-- AUTO_INCREMENT for table `car_model`
--
ALTER TABLE `car_model`
  MODIFY `cm_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `driver_details`
--
ALTER TABLE `driver_details`
  MODIFY `dc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `driver_ratings`
--
ALTER TABLE `driver_ratings`
  MODIFY `dr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `driver_shift`
--
ALTER TABLE `driver_shift`
  MODIFY `ds_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=433;

--
-- AUTO_INCREMENT for table `edu_institution`
--
ALTER TABLE `edu_institution`
  MODIFY `ei_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `edu_wallet`
--
ALTER TABLE `edu_wallet`
  MODIFY `w_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `moov_logs`
--
ALTER TABLE `moov_logs`
  MODIFY `ml_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `moov_wallet`
--
ALTER TABLE `moov_wallet`
  MODIFY `mw_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `otp_mobile`
--
ALTER TABLE `otp_mobile`
  MODIFY `otp_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ride_peak_hours`
--
ALTER TABLE `ride_peak_hours`
  MODIFY `rph_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ride_rates`
--
ALTER TABLE `ride_rates`
  MODIFY `rr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `salary_release`
--
ALTER TABLE `salary_release`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_messages`
--
ALTER TABLE `support_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=184;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=211;

--
-- AUTO_INCREMENT for table `user_login_logs`
--
ALTER TABLE `user_login_logs`
  MODIFY `ull_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=300;

--
-- AUTO_INCREMENT for table `user_type`
--
ALTER TABLE `user_type`
  MODIFY `ut_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `wallet`
--
ALTER TABLE `wallet`
  MODIFY `w_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
