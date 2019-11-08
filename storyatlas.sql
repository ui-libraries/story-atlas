-- phpMyAdmin SQL Dump
-- version 4.2.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 08, 2019 at 04:40 PM
-- Server version: 5.5.47
-- PHP Version: 5.3.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `storyatlas`
--

-- --------------------------------------------------------

--
-- Table structure for table `collections`
--

CREATE TABLE IF NOT EXISTS `collections` (
`id` int(10) unsigned NOT NULL,
  `public` tinyint(4) NOT NULL,
  `featured` tinyint(4) NOT NULL,
  `added` timestamp NOT NULL DEFAULT '2000-01-01 06:00:00',
  `modified` timestamp NOT NULL DEFAULT '2000-01-01 06:00:00',
  `owner_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `collections`
--

INSERT INTO `collections` (`id`, `public`, `featured`, `added`, `modified`, `owner_id`) VALUES
(1, 1, 0, '2019-11-07 15:46:30', '2019-11-08 22:38:11', 1),
(2, 1, 0, '2019-11-07 17:23:18', '2019-11-07 17:23:18', 1);

-- --------------------------------------------------------

--
-- Table structure for table `csv_import_plus_imported_records`
--

CREATE TABLE IF NOT EXISTS `csv_import_plus_imported_records` (
`id` int(10) unsigned NOT NULL,
  `import_id` int(10) unsigned NOT NULL,
  `record_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `record_id` int(10) unsigned NOT NULL,
  `identifier` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `csv_import_plus_imports`
--

CREATE TABLE IF NOT EXISTS `csv_import_plus_imports` (
`id` int(10) unsigned NOT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `delimiter` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `enclosure` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `row_count` int(10) unsigned NOT NULL,
  `skipped_row_count` int(10) unsigned NOT NULL,
  `skipped_record_count` int(10) unsigned NOT NULL,
  `updated_record_count` int(10) unsigned NOT NULL,
  `file_position` bigint(20) unsigned NOT NULL,
  `original_filename` text COLLATE utf8_unicode_ci NOT NULL,
  `file_path` text COLLATE utf8_unicode_ci NOT NULL,
  `serialized_default_values` text COLLATE utf8_unicode_ci NOT NULL,
  `serialized_column_maps` text COLLATE utf8_unicode_ci NOT NULL,
  `owner_id` int(10) unsigned NOT NULL,
  `added` timestamp NOT NULL DEFAULT '2000-01-01 06:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `csv_import_plus_logs`
--

CREATE TABLE IF NOT EXISTS `csv_import_plus_logs` (
`id` int(10) unsigned NOT NULL,
  `import_id` int(10) unsigned NOT NULL,
  `priority` tinyint(3) unsigned NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `params` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `elements`
--

CREATE TABLE IF NOT EXISTS `elements` (
`id` int(10) unsigned NOT NULL,
  `element_set_id` int(10) unsigned NOT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `comment` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=92 ;

--
-- Dumping data for table `elements`
--

INSERT INTO `elements` (`id`, `element_set_id`, `order`, `name`, `description`, `comment`) VALUES
(1, 3, NULL, 'Text', 'Any textual data included in the document', NULL),
(2, 3, NULL, 'Interviewer', 'The person(s) performing the interview', NULL),
(3, 3, NULL, 'Interviewee', 'The person(s) being interviewed', NULL),
(4, 3, NULL, 'Location', 'The location of the interview', NULL),
(5, 3, NULL, 'Transcription', 'Any written text transcribed from a sound', NULL),
(6, 3, NULL, 'Local URL', 'The URL of the local directory containing all assets of the website', NULL),
(7, 3, NULL, 'Original Format', 'The type of object, such as painting, sculpture, paper, photo, and additional data', NULL),
(10, 3, NULL, 'Physical Dimensions', 'The actual physical size of the original image', NULL),
(11, 3, NULL, 'Duration', 'Length of time involved (seconds, minutes, hours, days, class periods, etc.)', NULL),
(12, 3, NULL, 'Compression', 'Type/rate of compression for moving image file (i.e. MPEG-4)', NULL),
(13, 3, NULL, 'Producer', 'Name (or names) of the person who produced the video', NULL),
(14, 3, NULL, 'Director', 'Name (or names) of the person who produced the video', NULL),
(15, 3, NULL, 'Bit Rate/Frequency', 'Rate at which bits are transferred (i.e. 96 kbit/s would be FM quality audio)', NULL),
(16, 3, NULL, 'Time Summary', 'A summary of an interview given for different time stamps throughout the interview', NULL),
(17, 3, NULL, 'Email Body', 'The main body of the email, including all replied and forwarded text and headers', NULL),
(18, 3, NULL, 'Subject Line', 'The content of the subject line of the email', NULL),
(19, 3, NULL, 'From', 'The name and email address of the person sending the email', NULL),
(20, 3, NULL, 'To', 'The name(s) and email address(es) of the person to whom the email was sent', NULL),
(21, 3, NULL, 'CC', 'The name(s) and email address(es) of the person to whom the email was carbon copied', NULL),
(22, 3, NULL, 'BCC', 'The name(s) and email address(es) of the person to whom the email was blind carbon copied', NULL),
(23, 3, NULL, 'Number of Attachments', 'The number of attachments to the email', NULL),
(24, 3, NULL, 'Standards', '', NULL),
(25, 3, NULL, 'Objectives', '', NULL),
(26, 3, NULL, 'Materials', '', NULL),
(27, 3, NULL, 'Lesson Plan Text', '', NULL),
(28, 3, NULL, 'URL', '', NULL),
(29, 3, NULL, 'Event Type', '', NULL),
(30, 3, NULL, 'Participants', 'Names of individuals or groups participating in the event', NULL),
(31, 3, NULL, 'Birth Date', '', NULL),
(32, 3, NULL, 'Birthplace', '', NULL),
(33, 3, NULL, 'Death Date', '', NULL),
(34, 3, NULL, 'Occupation', '', NULL),
(35, 3, NULL, 'Biographical Text', '', NULL),
(36, 3, NULL, 'Bibliography', '', NULL),
(37, 1, 8, 'Contributor', 'An entity responsible for making contributions to the resource', NULL),
(38, 1, 15, 'Coverage', 'The spatial or temporal topic of the resource, the spatial applicability of the resource, or the jurisdiction under which the resource is relevant', NULL),
(39, 1, 4, 'Creator', 'An entity primarily responsible for making the resource', NULL),
(40, 1, 7, 'Date', 'A point or period of time associated with an event in the lifecycle of the resource', NULL),
(41, 1, 3, 'Description', 'An account of the resource', NULL),
(42, 1, 11, 'Format', 'The file format, physical medium, or dimensions of the resource', NULL),
(43, 1, 14, 'Identifier', 'An unambiguous reference to the resource within a given context', NULL),
(44, 1, 12, 'Language', 'A language of the resource', NULL),
(45, 1, 6, 'Publisher', 'An entity responsible for making the resource available', NULL),
(46, 1, 10, 'Relation', 'A related resource', NULL),
(47, 1, 9, 'Rights', 'Information about rights held in and over the resource', NULL),
(48, 1, 5, 'Source', 'A related resource from which the described resource is derived', NULL),
(49, 1, 2, 'Subject', 'The topic of the resource', NULL),
(50, 1, 1, 'Title', 'A name given to the resource', NULL),
(51, 1, 13, 'Type', 'The nature or genre of the resource', NULL),
(52, 1, NULL, 'Alternative Title', 'An alternative name for the resource. The distinction between titles and alternative titles is application-specific.', NULL),
(53, 1, NULL, 'Abstract', 'A summary of the resource.', NULL),
(54, 1, NULL, 'Table Of Contents', 'A list of subunits of the resource.', NULL),
(55, 1, NULL, 'Date Available', 'Date (often a range) that the resource became or will become available.', NULL),
(56, 1, NULL, 'Date Created', 'Date of creation of the resource.', NULL),
(57, 1, NULL, 'Date Accepted', 'Date of acceptance of the resource. Examples of resources to which a Date Accepted may be relevant are a thesis (accepted by a university department) or an article (accepted by a journal).', NULL),
(58, 1, NULL, 'Date Copyrighted', 'Date of copyright.', NULL),
(59, 1, NULL, 'Date Submitted', 'Date of submission of the resource. Examples of resources to which a Date Submitted may be relevant are a thesis (submitted to a university department) or an article (submitted to a journal).', NULL),
(60, 1, NULL, 'Date Issued', 'Date of formal issuance (e.g., publication) of the resource.', NULL),
(61, 1, NULL, 'Date Modified', 'Date on which the resource was changed.', NULL),
(62, 1, NULL, 'Date Valid', 'Date (often a range) of validity of a resource.', NULL),
(63, 1, NULL, 'Access Rights', 'Information about who can access the resource or an indication of its security status. Access Rights may include information regarding access or restrictions based on privacy, security, or other policies.', NULL),
(64, 1, NULL, 'License', 'A legal document giving official permission to do something with the resource.', NULL),
(65, 1, NULL, 'Conforms To', 'An established standard to which the described resource conforms.', NULL),
(66, 1, NULL, 'Has Format', 'A related resource that is substantially the same as the pre-existing described resource, but in another format.', NULL),
(67, 1, NULL, 'Has Part', 'A related resource that is included either physically or logically in the described resource.', NULL),
(68, 1, NULL, 'Has Version', 'A related resource that is a version, edition, or adaptation of the described resource.', NULL),
(69, 1, NULL, 'Is Format Of', 'A related resource that is substantially the same as the described resource, but in another format.', NULL),
(70, 1, NULL, 'Is Part Of', 'A related resource in which the described resource is physically or logically included.', NULL),
(71, 1, NULL, 'Is Referenced By', 'A related resource that references, cites, or otherwise points to the described resource.', NULL),
(72, 1, NULL, 'Is Replaced By', 'A related resource that supplants, displaces, or supersedes the described resource.', NULL),
(73, 1, NULL, 'Is Required By', 'A related resource that requires the described resource to support its function, delivery, or coherence.', NULL),
(74, 1, NULL, 'Is Version Of', 'A related resource of which the described resource is a version, edition, or adaptation. Changes in version imply substantive changes in content rather than differences in format.', NULL),
(75, 1, NULL, 'References', 'A related resource that is referenced, cited, or otherwise pointed to by the described resource.', NULL),
(76, 1, NULL, 'Replaces', 'A related resource that is supplanted, displaced, or superseded by the described resource.', NULL),
(77, 1, NULL, 'Requires', 'A related resource that is required by the described resource to support its function, delivery, or coherence.', NULL),
(78, 1, NULL, 'Extent', 'The size or duration of the resource.', NULL),
(79, 1, NULL, 'Medium', 'The material or physical carrier of the resource.', NULL),
(80, 1, NULL, 'Bibliographic Citation', 'A bibliographic reference for the resource. Recommended practice is to include sufficient bibliographic detail to identify the resource as unambiguously as possible.', NULL),
(81, 1, NULL, 'Spatial Coverage', 'Spatial characteristics of the resource.', NULL),
(82, 1, NULL, 'Temporal Coverage', 'Temporal characteristics of the resource.', NULL),
(83, 1, NULL, 'Accrual Method', 'The method by which items are added to a collection.', NULL),
(84, 1, NULL, 'Accrual Periodicity', 'The frequency with which items are added to a collection.', NULL),
(85, 1, NULL, 'Accrual Policy', 'The policy governing the addition of items to a collection.', NULL),
(86, 1, NULL, 'Audience', 'A class of entity for whom the resource is intended or useful.', NULL),
(87, 1, NULL, 'Audience Education Level', 'A class of entity, defined in terms of progression through an educational or training context, for which the described resource is intended.', NULL),
(88, 1, NULL, 'Mediator', 'An entity that mediates access to the resource and for whom the resource is intended or useful. In an educational context, a mediator might be a parent, teacher, teaching assistant, or care-giver.', NULL),
(89, 1, NULL, 'Instructional Method', 'A process, used to engender knowledge, attitudes and skills, that the described resource is designed to support. Instructional Method will typically include ways of presenting instructional materials or conducting instructional activities, patterns of learner-to-learner and learner-to-instructor interactions, and mechanisms by which group and individual levels of learning are measured. Instructional methods include all aspects of the instruction and learning processes from planning and implementation through evaluation and feedback.', NULL),
(90, 1, NULL, 'Provenance', 'A statement of any changes in ownership and custody of the resource since its creation that are significant for its authenticity, integrity, and interpretation. The statement may include a description of any changes successive custodians made to the resource.', NULL),
(91, 1, NULL, 'Rights Holder', 'A person or organization owning or managing rights over the resource.', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `element_sets`
--

CREATE TABLE IF NOT EXISTS `element_sets` (
`id` int(10) unsigned NOT NULL,
  `record_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `element_sets`
--

INSERT INTO `element_sets` (`id`, `record_type`, `name`, `description`) VALUES
(1, NULL, 'Dublin Core', 'The Dublin Core metadata element set is common to all Omeka records, including items, files, and collections. For more information see, http://dublincore.org/documents/dces/.'),
(3, 'Item', 'Item Type Metadata', 'The item type metadata element set, consisting of all item type elements bundled with Omeka and all item type elements created by an administrator.');

-- --------------------------------------------------------

--
-- Table structure for table `element_texts`
--

CREATE TABLE IF NOT EXISTS `element_texts` (
`id` int(10) unsigned NOT NULL,
  `record_id` int(10) unsigned NOT NULL,
  `record_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `element_id` int(10) unsigned NOT NULL,
  `html` tinyint(4) NOT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=21 ;

--
-- Dumping data for table `element_texts`
--

INSERT INTO `element_texts` (`id`, `record_id`, `record_type`, `element_id`, `html`, `text`) VALUES
(1, 1, 'Item', 50, 0, 'What is this '),
(5, 2, 'Item', 50, 0, 'Nice Stuff'),
(6, 2, 'Item', 41, 0, 'Loving it'),
(7, 2, 'Collection', 50, 0, 'Coffeezone'),
(8, 2, 'Collection', 41, 0, 'Story Atlas version of CZ'),
(9, 3, 'Item', 50, 0, 'This is coffee'),
(10, 1, 'Item', 41, 1, '<strong>When</strong> American Indians first arrived in what is now Iowa more than 13,000 years ago, they were hunters and gatherers living in a Pleistocene glacial landscape. By the time European explorers and traders visited Iowa, American Indians were largely settled farmers with complex economic, social, and political systems. This transformation happened gradually. During the Archaic period (10,500–2,800 years ago), American Indians adapted to local environments and ecosystems, slowly becoming more sedentary as populations increased.[43] More than 3,000 years ago, during the Late Archaic period, American Indians in Iowa began utilizing domesticated plants. The subsequent Woodland period saw an increased reliance on agriculture and social complexity, with increased use of mounds, ceramics, and specialized subsistence. During the Late Prehistoric period (beginning about AD 900) increased use of maize and social changes led to social flourishing and nucleated settlements.[43] The arrival of European trade goods and diseases in the Protohistoric period led to dramatic population shifts and economic and social upheaval, with the arrival of new tribes and early European explorers and traders. There were numerous Indian tribes living in Iowa at the time of early European exploration. Tribes which were probably descendants of the prehistoric Oneota include the Dakota, Ho-Chunk, Ioway, and Otoe. Tribes which arrived in Iowa in the late prehistoric or protohistoric periods include the Illiniwek, Meskwaki, Omaha, and Sauk.[43]'),
(11, 1, 'Item', 81, 0, '{\r\n"center": [-91.55888, 41.64308],\r\n"zoom": 8.40,\r\n"pitch": 32.00,\r\n"bearing": 0.87\r\n}'),
(12, 2, 'Item', 81, 0, '{"center": [-90.15733, 38.61972],\r\n"zoom": 21,\r\n"pitch": 0.00,\r\n"bearing": 16.80}'),
(13, 1, 'Collection', 42, 0, 'mapbox://styles/mapbox/streets-v11'),
(14, 1, 'Collection', 47, 0, 'pk.eyJ1IjoibXRidXRsZXIiLCJhIjoiY2pjdzFxaHhiNGt0MjJybnh6OTJnZ3h4dyJ9.KlVoNBd74vYAs16sOxN87w'),
(15, 4, 'Item', 50, 0, 'THE FIRE'),
(16, 4, 'Item', 49, 0, 'SECRETES'),
(17, 4, 'Item', 41, 0, 'MADE IT TO THE FIRE'),
(18, 4, 'Item', 81, 0, '{\r\n"center": [-74.00919, 40.73829],\r\n"zoom": 18.91,\r\n"pitch": 60.00,\r\n"bearing": 40.00\r\n}'),
(19, 1, 'Collection', 50, 1, '<h1>COOL SAMPLE STORY MAP</h1>'),
(20, 1, 'Collection', 41, 1, '<h3>Just testing things out here.</h3>');

-- --------------------------------------------------------

--
-- Table structure for table `exhibits`
--

CREATE TABLE IF NOT EXISTS `exhibits` (
`id` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `credits` text COLLATE utf8_unicode_ci,
  `featured` tinyint(1) DEFAULT '0',
  `public` tinyint(1) DEFAULT '0',
  `theme` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `theme_options` text COLLATE utf8_unicode_ci,
  `slug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `added` timestamp NOT NULL DEFAULT '2000-01-01 06:00:00',
  `modified` timestamp NOT NULL DEFAULT '2000-01-01 06:00:00',
  `owner_id` int(10) unsigned DEFAULT NULL,
  `use_summary_page` tinyint(1) DEFAULT '1',
  `cover_image_file_id` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exhibits`
--

INSERT INTO `exhibits` (`id`, `title`, `description`, `credits`, `featured`, `public`, `theme`, `theme_options`, `slug`, `added`, `modified`, `owner_id`, `use_summary_page`, `cover_image_file_id`) VALUES
(1, 'Bike Map of Iowa City', '<p>This is a cool place for text</p>\n<p></p>', '', 0, 1, '', NULL, 'bike-map-of-iowa-city', '2019-11-07 15:38:40', '2019-11-07 15:40:22', 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exhibit_block_attachments`
--

CREATE TABLE IF NOT EXISTS `exhibit_block_attachments` (
`id` int(10) unsigned NOT NULL,
  `block_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `file_id` int(10) unsigned DEFAULT NULL,
  `caption` text COLLATE utf8_unicode_ci,
  `order` smallint(5) unsigned DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exhibit_block_attachments`
--

INSERT INTO `exhibit_block_attachments` (`id`, `block_id`, `item_id`, `file_id`, `caption`, `order`) VALUES
(1, 2, 1, 1, '<p>I love it</p>', 1);

-- --------------------------------------------------------

--
-- Table structure for table `exhibit_pages`
--

CREATE TABLE IF NOT EXISTS `exhibit_pages` (
`id` int(10) unsigned NOT NULL,
  `exhibit_id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `short_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `order` smallint(5) unsigned DEFAULT NULL,
  `added` timestamp NOT NULL DEFAULT '2000-01-01 06:00:00',
  `modified` timestamp NOT NULL DEFAULT '2000-01-01 06:00:00'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `exhibit_pages`
--

INSERT INTO `exhibit_pages` (`id`, `exhibit_id`, `parent_id`, `title`, `short_title`, `slug`, `order`, `added`, `modified`) VALUES
(1, 1, NULL, 'First Chapter of the Cool Story', '', 'first-chapter-of-the-cool-stor', 0, '2019-11-07 15:39:42', '2019-11-07 15:40:22'),
(2, 1, NULL, 'Chapter One', '', 'phoenix-command', 2, '2019-11-07 15:40:44', '2019-11-07 15:40:58');

-- --------------------------------------------------------

--
-- Table structure for table `exhibit_page_blocks`
--

CREATE TABLE IF NOT EXISTS `exhibit_page_blocks` (
`id` int(10) unsigned NOT NULL,
  `page_id` int(10) unsigned NOT NULL,
  `layout` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `options` text COLLATE utf8_unicode_ci,
  `text` mediumtext COLLATE utf8_unicode_ci,
  `order` smallint(5) unsigned DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `exhibit_page_blocks`
--

INSERT INTO `exhibit_page_blocks` (`id`, `page_id`, `layout`, `options`, `text`, `order`) VALUES
(1, 1, 'gallery', '{"showcase-position":"none","gallery-position":"left","gallery-file-size":"square_thumbnail","captions-position":"center"}', NULL, 1),
(2, 2, 'file-text', '{"file-position":"left","file-size":"fullsize","captions-position":"center"}', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE IF NOT EXISTS `files` (
`id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned NOT NULL,
  `has_derivative_image` tinyint(1) NOT NULL,
  `authentication` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mime_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_os` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filename` text COLLATE utf8_unicode_ci NOT NULL,
  `original_filename` text COLLATE utf8_unicode_ci NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `added` timestamp NOT NULL DEFAULT '2000-01-01 06:00:00',
  `stored` tinyint(1) NOT NULL DEFAULT '0',
  `metadata` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `item_id`, `order`, `size`, `has_derivative_image`, `authentication`, `mime_type`, `type_os`, `filename`, `original_filename`, `modified`, `added`, `stored`, `metadata`) VALUES
(1, 1, NULL, 1141799, 1, 'fa739dd4941dde0147b8be36a37ea1e2', 'image/jpeg', 'JPEG image data, EXIF standard', '716ddebbee4b07afcbfd327dada2257b.jpg', 'phoenix-command-cover.jpg', '2019-11-08 21:21:12', '2019-11-07 15:40:08', 1, '{"mime_type":"image\\/jpeg","video":{"dataformat":"jpg","lossless":false,"bits_per_sample":24,"pixel_aspect_ratio":1,"resolution_x":2550,"resolution_y":3300,"compression_ratio":0.04522871855813},"comments":{"IPTCEnvelope":{"CodedCharacterSet":["\\u001b%G"]},"IPTCApplication":{"ApplicationRecordVersion":[""]}},"comments_html":{"IPTCEnvelope":{"CodedCharacterSet":["\\u001b%G"]},"IPTCApplication":{"ApplicationRecordVersion":[""]}},"iptc":{"comments":{"IPTCEnvelope":{"CodedCharacterSet":["\\u001b%G"]},"IPTCApplication":{"ApplicationRecordVersion":["\\u0000\\u0000"]}},"encoding":"ISO-8859-1"},"jpg":{"exif":{"FILE":{"FileName":"716ddebbee4b07afcbfd327dada2257b.jpg","FileDateTime":1573141208,"FileSize":1141799,"FileType":2,"MimeType":"image\\/jpeg","SectionsFound":"ANY_TAG, IFD0, THUMBNAIL, EXIF"},"COMPUTED":{"html":"width=\\"2550\\" height=\\"3300\\"","Height":3300,"Width":2550,"IsColor":1,"ByteOrderMotorola":1,"Thumbnail.FileType":2,"Thumbnail.MimeType":"image\\/jpeg"},"IFD0":{"Orientation":1,"XResolution":300,"YResolution":300,"ResolutionUnit":2,"Software":"Adobe Photoshop CC 2019 (Macintosh)","DateTime":"2019:08:29 15:07:39","Exif_IFD_Pointer":172},"THUMBNAIL":{"Compression":6,"XResolution":72,"YResolution":72,"ResolutionUnit":2,"JPEGInterchangeFormat":310,"JPEGInterchangeFormatLength":7616},"EXIF":{"ColorSpace":1,"ExifImageWidth":2550,"ExifImageLength":3300}}}}'),
(2, 2, NULL, 42427, 1, 'fdf4cb35f1e4eee6fe6d50ee9a7c2778', 'image/jpeg', 'JPEG image data, JFIF standard 1.01', 'f9d7d58c43504ea1b63ae6300b05de84.jpg', '51dPIgj6MXL._SX336_BO1,204,203,200_.jpg', '2019-11-08 20:27:07', '2019-11-07 16:53:07', 1, '{"mime_type":"image\\/jpeg","video":{"dataformat":"jpg","lossless":false,"bits_per_sample":24,"pixel_aspect_ratio":1,"resolution_x":338,"resolution_y":499,"compression_ratio":0.083850146051472}}'),
(3, 3, NULL, 13812, 1, '7a27e4edd90c9ad33e6d5d686fbee3ee', 'image/jpeg', 'JPEG image data, JFIF standard 1.01', '826ca5ddf72dbf21dd937992ab9c53d2.jpeg', 'coffee.jpeg', '2019-11-07 17:24:07', '2019-11-07 17:24:07', 1, '{"mime_type":"image\\/jpeg","video":{"dataformat":"jpg","lossless":false,"bits_per_sample":24,"pixel_aspect_ratio":1,"resolution_x":275,"resolution_y":183,"compression_ratio":0.091485345255837}}'),
(4, 4, NULL, 994559, 1, 'ee0fb3a35e2b86c8f4edf10e96bd8b3c', 'image/jpeg', 'JPEG image data, JFIF standard 1.01', '9adb78f6cdd466e0979d138379c680d0.jpg', '20190519_004948.jpg', '2019-11-08 22:15:29', '2019-11-08 22:15:26', 1, '{"mime_type":"image\\/jpeg","video":{"dataformat":"jpg","lossless":false,"bits_per_sample":24,"pixel_aspect_ratio":1,"resolution_x":4032,"resolution_y":1960,"compression_ratio":0.041950071199115},"jpg":{"exif":{"FILE":{"FileName":"9adb78f6cdd466e0979d138379c680d0.jpg","FileDateTime":1573251326,"FileSize":994559,"FileType":2,"MimeType":"image\\/jpeg","SectionsFound":"ANY_TAG, IFD0, THUMBNAIL, EXIF, GPS, INTEROP"},"COMPUTED":{"html":"width=\\"4032\\" height=\\"1960\\"","Height":1960,"Width":4032,"IsColor":1,"ByteOrderMotorola":0,"ApertureFNumber":"f\\/1.7","UserComment":"\\n","UserCommentEncoding":"ASCII","Thumbnail.FileType":2,"Thumbnail.MimeType":"image\\/jpeg","Thumbnail.Height":240,"Thumbnail.Width":496},"IFD0":{"ImageWidth":4032,"ImageLength":1960,"Make":"samsung","Model":"SM-G950U","Orientation":1,"XResolution":72,"YResolution":72,"ResolutionUnit":2,"Software":"G950USQS5CSB1","DateTime":"2019:05:19 00:49:48","YCbCrPositioning":1,"Exif_IFD_Pointer":238,"GPS_IFD_Pointer":6274},"THUMBNAIL":{"ImageWidth":496,"ImageLength":240,"Compression":6,"Orientation":1,"XResolution":72,"YResolution":72,"ResolutionUnit":2,"JPEGInterchangeFormat":6610,"JPEGInterchangeFormatLength":11517},"EXIF":{"ExposureTime":0.033333333333333,"FNumber":1.7,"ExposureProgram":2,"ISOSpeedRatings":640,"ExifVersion":220,"DateTimeOriginal":"2019:05:19 00:49:48","DateTimeDigitized":"2019:05:19 00:49:48","ComponentsConfiguration":"\\u0001\\u0002\\u0003\\u0000","ShutterSpeedValue":4.903,"ApertureValue":1.53,"BrightnessValue":"-130\\/100","ExposureBiasValue":0,"MaxApertureValue":1.53,"MeteringMode":2,"LightSource":0,"Flash":0,"FocalLength":4.25,"MakerNote":"\\u0007\\u0000\\u0001\\u0000\\u0007\\u0000\\u0004\\u0000\\u0000\\u00000100\\u0002\\u0000\\u0004\\u0000\\u0001\\u0000\\u0000\\u0000\\u0000 \\u0001\\u0000\\f\\u0000\\u0004\\u0000\\u0001\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0010\\u0000\\u0005\\u0000\\u0001\\u0000\\u0000\\u0000Z\\u0000\\u0000\\u0000@\\u0000\\u0004\\u0000\\u0001\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000P\\u0000\\u0004\\u0000\\u0001\\u0000\\u0000\\u0000\\u0001\\u0000\\u0000\\u0000\\u0000\\u0001\\u0003\\u0000\\u0001\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000\\u0000","UserComment":null,"FlashPixVersion":100,"ColorSpace":1,"ExifImageWidth":4032,"ExifImageLength":1960,"InteroperabilityOffset":6244,"SensingMethod":2,"SceneType":"\\u0001","ExposureMode":0,"WhiteBalance":0,"FocalLengthIn35mmFilm":26,"SceneCaptureType":0,"ImageUniqueID":"F12QSJA00SM F12QSKB01SB"},"GPS":{"GPSVersion":"\\u0002\\u0002\\u0000\\u0000","GPSLatitudeRef":"N","GPSLatitude":["40\\/1","44\\/1","175257\\/10000"],"GPSLongitudeRef":"W","GPSLongitude":["74\\/1","0\\/1","333554\\/10000"],"GPSAltitudeRef":1,"GPSAltitude":"27299\\/1000","GPSTimeStamp":["4\\/1","49\\/1","31\\/1"],"GPSDateStamp":"2019:05:19","computed":{"version":"v2.2.0.0","timestamp":943937371,"latitude":40.738201583333,"longitude":-74.009265388889,"altitude":-27.299}},"INTEROP":{"InterOperabilityIndex":"R98","InterOperabilityVersion":"0100"}}}}');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE IF NOT EXISTS `items` (
`id` int(10) unsigned NOT NULL,
  `item_type_id` int(10) unsigned DEFAULT NULL,
  `collection_id` int(10) unsigned DEFAULT NULL,
  `featured` tinyint(4) NOT NULL,
  `public` tinyint(4) NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `added` timestamp NOT NULL DEFAULT '2000-01-01 06:00:00',
  `owner_id` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `item_type_id`, `collection_id`, `featured`, `public`, `modified`, `added`, `owner_id`) VALUES
(1, NULL, 1, 0, 1, '2019-11-08 21:21:12', '2019-11-07 15:40:08', 1),
(2, NULL, 1, 0, 1, '2019-11-08 20:27:07', '2019-11-07 16:53:06', 1),
(3, NULL, 2, 0, 1, '2019-11-07 17:24:07', '2019-11-07 17:24:07', 1),
(4, NULL, 1, 0, 1, '2019-11-08 22:15:29', '2019-11-08 22:15:14', 1);

-- --------------------------------------------------------

--
-- Table structure for table `item_types`
--

CREATE TABLE IF NOT EXISTS `item_types` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=18 ;

--
-- Dumping data for table `item_types`
--

INSERT INTO `item_types` (`id`, `name`, `description`) VALUES
(1, 'Text', 'A resource consisting primarily of words for reading. Examples include books, letters, dissertations, poems, newspapers, articles, archives of mailing lists. Note that facsimiles or images of texts are still of the genre Text.'),
(3, 'Moving Image', 'A series of visual representations imparting an impression of motion when shown in succession. Examples include animations, movies, television programs, videos, zoetropes, or visual output from a simulation.'),
(4, 'Oral History', 'A resource containing historical information obtained in interviews with persons having firsthand knowledge.'),
(5, 'Sound', 'A resource primarily intended to be heard. Examples include a music playback file format, an audio compact disc, and recorded speech or sounds.'),
(6, 'Still Image', 'A static visual representation. Examples include paintings, drawings, graphic designs, plans and maps. Recommended best practice is to assign the type Text to images of textual materials.'),
(7, 'Website', 'A resource comprising of a web page or web pages and all related assets ( such as images, sound and video files, etc. ).'),
(8, 'Event', 'A non-persistent, time-based occurrence. Metadata for an event provides descriptive information that is the basis for discovery of the purpose, location, duration, and responsible agents associated with an event. Examples include an exhibition, webcast, conference, workshop, open day, performance, battle, trial, wedding, tea party, conflagration.'),
(9, 'Email', 'A resource containing textual messages and binary attachments sent electronically from one person to another or one person to many people.'),
(10, 'Lesson Plan', 'A resource that gives a detailed description of a course of instruction.'),
(11, 'Hyperlink', 'A link, or reference, to another resource on the Internet.'),
(12, 'Person', 'An individual.'),
(13, 'Interactive Resource', 'A resource requiring interaction from the user to be understood, executed, or experienced. Examples include forms on Web pages, applets, multimedia learning objects, chat services, or virtual reality environments.'),
(14, 'Dataset', 'Data encoded in a defined structure. Examples include lists, tables, and databases. A dataset may be useful for direct machine processing.'),
(15, 'Physical Object', 'An inanimate, three-dimensional object or substance. Note that digital representations of, or surrogates for, these objects should use Moving Image, Still Image, Text or one of the other types.'),
(16, 'Service', 'A system that provides one or more functions. Examples include a photocopying service, a banking service, an authentication service, interlibrary loans, a Z39.50 or Web server.'),
(17, 'Software', 'A computer program in source or compiled form. Examples include a C source file, MS-Windows .exe executable, or Perl script.');

-- --------------------------------------------------------

--
-- Table structure for table `item_types_elements`
--

CREATE TABLE IF NOT EXISTS `item_types_elements` (
`id` int(10) unsigned NOT NULL,
  `item_type_id` int(10) unsigned NOT NULL,
  `element_id` int(10) unsigned NOT NULL,
  `order` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=48 ;

--
-- Dumping data for table `item_types_elements`
--

INSERT INTO `item_types_elements` (`id`, `item_type_id`, `element_id`, `order`) VALUES
(1, 1, 7, NULL),
(2, 1, 1, NULL),
(3, 6, 7, NULL),
(6, 6, 10, NULL),
(7, 3, 7, NULL),
(8, 3, 11, NULL),
(9, 3, 12, NULL),
(10, 3, 13, NULL),
(11, 3, 14, NULL),
(12, 3, 5, NULL),
(13, 5, 7, NULL),
(14, 5, 11, NULL),
(15, 5, 15, NULL),
(16, 5, 5, NULL),
(17, 4, 7, NULL),
(18, 4, 11, NULL),
(19, 4, 15, NULL),
(20, 4, 5, NULL),
(21, 4, 2, NULL),
(22, 4, 3, NULL),
(23, 4, 4, NULL),
(24, 4, 16, NULL),
(25, 9, 17, NULL),
(26, 9, 18, NULL),
(27, 9, 20, NULL),
(28, 9, 19, NULL),
(29, 9, 21, NULL),
(30, 9, 22, NULL),
(31, 9, 23, NULL),
(32, 10, 24, NULL),
(33, 10, 25, NULL),
(34, 10, 26, NULL),
(35, 10, 11, NULL),
(36, 10, 27, NULL),
(37, 7, 6, NULL),
(38, 11, 28, NULL),
(39, 8, 29, NULL),
(40, 8, 30, NULL),
(41, 8, 11, NULL),
(42, 12, 31, NULL),
(43, 12, 32, NULL),
(44, 12, 33, NULL),
(45, 12, 34, NULL),
(46, 12, 35, NULL),
(47, 12, 36, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `keys`
--

CREATE TABLE IF NOT EXISTS `keys` (
`id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `key` char(40) COLLATE utf8_unicode_ci NOT NULL,
  `ip` varbinary(16) DEFAULT NULL,
  `accessed` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE IF NOT EXISTS `options` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=61 ;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `name`, `value`) VALUES
(1, 'omeka_version', '2.7'),
(2, 'administrator_email', 'matthew-butler@uiowa.edu'),
(3, 'copyright', '2019'),
(4, 'site_title', 'Story Atlas'),
(5, 'author', 'Matthew Butler'),
(6, 'description', ''),
(7, 'thumbnail_constraint', '200'),
(8, 'square_thumbnail_constraint', '200'),
(9, 'fullsize_constraint', '800'),
(10, 'per_page_admin', '10'),
(11, 'per_page_public', '10'),
(12, 'show_empty_elements', '0'),
(13, 'path_to_convert', '/usr/bin'),
(14, 'admin_theme', 'default'),
(15, 'public_theme', 'default'),
(16, 'file_extension_whitelist', 'aac,aif,aiff,asf,asx,avi,bmp,c,cc,class,css,divx,doc,docx,exe,gif,gz,gzip,h,ico,j2k,jp2,jpe,jpeg,jpg,m4a,m4v,mdb,mid,midi,mov,mp2,mp3,mp4,mpa,mpe,mpeg,mpg,mpp,odb,odc,odf,odg,odp,ods,odt,ogg,opus,pdf,png,pot,pps,ppt,pptx,qt,ra,ram,rtf,rtx,swf,tar,tif,tiff,txt,wav,wax,webm,wma,wmv,wmx,wri,xla,xls,xlsx,xlt,xlw,zip'),
(17, 'file_mime_type_whitelist', 'application/msword,application/ogg,application/pdf,application/rtf,application/vnd.ms-access,application/vnd.ms-excel,application/vnd.ms-powerpoint,application/vnd.ms-project,application/vnd.ms-write,application/vnd.oasis.opendocument.chart,application/vnd.oasis.opendocument.database,application/vnd.oasis.opendocument.formula,application/vnd.oasis.opendocument.graphics,application/vnd.oasis.opendocument.presentation,application/vnd.oasis.opendocument.spreadsheet,application/vnd.oasis.opendocument.text,application/x-ms-wmp,application/x-ogg,application/x-gzip,application/x-msdownload,application/x-shockwave-flash,application/x-tar,application/zip,audio/aac,audio/aiff,audio/mid,audio/midi,audio/mp3,audio/mp4,audio/mpeg,audio/mpeg3,audio/ogg,audio/wav,audio/wma,audio/x-aac,audio/x-aiff,audio/x-m4a,audio/x-midi,audio/x-mp3,audio/x-mp4,audio/x-mpeg,audio/x-mpeg3,audio/x-mpegaudio,audio/x-ms-wax,audio/x-realaudio,audio/x-wav,audio/x-wma,image/bmp,image/gif,image/icon,image/jpeg,image/pjpeg,image/png,image/tiff,image/x-icon,image/x-ms-bmp,text/css,text/plain,text/richtext,text/rtf,video/asf,video/avi,video/divx,video/mp4,video/mpeg,video/msvideo,video/ogg,video/quicktime,video/webm,video/x-m4v,video/x-ms-wmv,video/x-msvideo'),
(18, 'disable_default_file_validation', ''),
(20, 'display_system_info', '1'),
(21, 'html_purifier_is_enabled', '1'),
(22, 'html_purifier_allowed_html_elements', 'p,br,strong,em,span,div,ul,ol,li,a,h1,h2,h3,h4,h5,h6,address,pre,table,tr,td,blockquote,thead,tfoot,tbody,th,dl,dt,dd,q,small,strike,sup,sub,b,i,big,small,tt'),
(23, 'html_purifier_allowed_html_attributes', '*.style,*.class,a.href,a.title,a.target'),
(24, 'tag_delimiter', ','),
(25, 'public_navigation_main', '[{"can_delete":false,"uid":"\\/storyatlas\\/items\\/browse","label":"Browse Items","fragment":null,"id":null,"class":null,"title":null,"target":null,"accesskey":null,"rel":[],"rev":[],"customHtmlAttribs":[],"order":1,"resource":null,"privilege":null,"active":false,"visible":true,"type":"Omeka_Navigation_Page_Mvc","pages":[],"action":"browse","controller":"items","module":null,"params":[],"route":"default","reset_params":true,"encodeUrl":true,"scheme":null},{"can_delete":false,"uid":"\\/storyatlas\\/collections\\/browse","label":"Browse Collections","fragment":null,"id":null,"class":null,"title":null,"target":null,"accesskey":null,"rel":[],"rev":[],"customHtmlAttribs":[],"order":2,"resource":null,"privilege":null,"active":false,"visible":true,"type":"Omeka_Navigation_Page_Mvc","pages":[],"action":"browse","controller":"collections","module":null,"params":[],"route":"default","reset_params":true,"encodeUrl":true,"scheme":null}]'),
(26, 'search_record_types', 'a:3:{s:4:"Item";s:4:"Item";s:4:"File";s:4:"File";s:10:"Collection";s:10:"Collection";}'),
(29, 'show_element_set_headings', '1'),
(30, 'use_square_thumbnail', '1'),
(32, 'api_enable', '1'),
(33, 'api_filter_element_texts', ''),
(34, 'api_per_page', '50'),
(35, 'dublin_core_extended_refinements', 'a:55:{i:50;a:2:{i:50;s:5:"Title";i:52;s:17:"Alternative Title";}i:52;a:1:{i:52;s:17:"Alternative Title";}i:49;a:1:{i:49;s:7:"Subject";}i:41;a:3:{i:41;s:11:"Description";i:53;s:8:"Abstract";i:54;s:17:"Table Of Contents";}i:53;a:1:{i:53;s:8:"Abstract";}i:54;a:1:{i:54;s:17:"Table Of Contents";}i:39;a:1:{i:39;s:7:"Creator";}i:48;a:1:{i:48;s:6:"Source";}i:45;a:1:{i:45;s:9:"Publisher";}i:40;a:9:{i:40;s:4:"Date";i:55;s:14:"Date Available";i:56;s:12:"Date Created";i:57;s:13:"Date Accepted";i:58;s:16:"Date Copyrighted";i:59;s:14:"Date Submitted";i:60;s:11:"Date Issued";i:61;s:13:"Date Modified";i:62;s:10:"Date Valid";}i:55;a:1:{i:55;s:14:"Date Available";}i:56;a:1:{i:56;s:12:"Date Created";}i:57;a:1:{i:57;s:13:"Date Accepted";}i:58;a:1:{i:58;s:16:"Date Copyrighted";}i:59;a:1:{i:59;s:14:"Date Submitted";}i:60;a:1:{i:60;s:11:"Date Issued";}i:61;a:1:{i:61;s:13:"Date Modified";}i:62;a:1:{i:62;s:10:"Date Valid";}i:37;a:1:{i:37;s:11:"Contributor";}i:47;a:3:{i:47;s:6:"Rights";i:63;s:13:"Access Rights";i:64;s:7:"License";}i:63;a:1:{i:63;s:13:"Access Rights";}i:64;a:1:{i:64;s:7:"License";}i:46;a:14:{i:46;s:8:"Relation";i:65;s:11:"Conforms To";i:66;s:10:"Has Format";i:67;s:8:"Has Part";i:68;s:11:"Has Version";i:69;s:12:"Is Format Of";i:70;s:10:"Is Part Of";i:71;s:16:"Is Referenced By";i:72;s:14:"Is Replaced By";i:73;s:14:"Is Required By";i:74;s:13:"Is Version Of";i:75;s:10:"References";i:76;s:8:"Replaces";i:77;s:8:"Requires";}i:65;a:1:{i:65;s:11:"Conforms To";}i:66;a:1:{i:66;s:10:"Has Format";}i:67;a:1:{i:67;s:8:"Has Part";}i:68;a:1:{i:68;s:11:"Has Version";}i:69;a:1:{i:69;s:12:"Is Format Of";}i:70;a:1:{i:70;s:10:"Is Part Of";}i:71;a:1:{i:71;s:16:"Is Referenced By";}i:72;a:1:{i:72;s:14:"Is Replaced By";}i:73;a:1:{i:73;s:14:"Is Required By";}i:74;a:1:{i:74;s:13:"Is Version Of";}i:75;a:1:{i:75;s:10:"References";}i:76;a:1:{i:76;s:8:"Replaces";}i:77;a:1:{i:77;s:8:"Requires";}i:42;a:3:{i:42;s:6:"Format";i:78;s:6:"Extent";i:79;s:6:"Medium";}i:78;a:1:{i:78;s:6:"Extent";}i:79;a:1:{i:79;s:6:"Medium";}i:44;a:1:{i:44;s:8:"Language";}i:51;a:1:{i:51;s:4:"Type";}i:43;a:2:{i:43;s:10:"Identifier";i:80;s:22:"Bibliographic Citation";}i:80;a:1:{i:80;s:22:"Bibliographic Citation";}i:38;a:3:{i:38;s:8:"Coverage";i:81;s:16:"Spatial Coverage";i:82;s:17:"Temporal Coverage";}i:81;a:1:{i:81;s:16:"Spatial Coverage";}i:82;a:1:{i:82;s:17:"Temporal Coverage";}i:83;a:1:{i:83;s:14:"Accrual Method";}i:84;a:1:{i:84;s:19:"Accrual Periodicity";}i:85;a:1:{i:85;s:14:"Accrual Policy";}i:86;a:3:{i:86;s:8:"Audience";i:87;s:24:"Audience Education Level";i:88;s:8:"Mediator";}i:87;a:1:{i:87;s:24:"Audience Education Level";}i:88;a:1:{i:88;s:8:"Mediator";}i:89;a:1:{i:89;s:20:"Instructional Method";}i:90;a:1:{i:90;s:10:"Provenance";}i:91;a:1:{i:91;s:13:"Rights Holder";}}'),
(37, 'dublin_core_extended_refines', '1'),
(38, 'install_plugin', 'Save Changes'),
(39, 'csrf_token', '70e4eb49ba961ecd1e094835903774e2'),
(40, 'csv_import_plus_memory_limit', ''),
(41, 'csv_import_plus_php_path', ''),
(42, 'csv_import_plus_identifier_field', 'table id'),
(43, 'csv_import_plus_column_delimiter', ','),
(44, 'csv_import_plus_enclosure', '"'),
(45, 'csv_import_plus_element_delimiter', ''),
(46, 'csv_import_plus_tag_delimiter', ','),
(47, 'csv_import_plus_file_delimiter', ','),
(48, 'csv_import_plus_html_elements', ''),
(49, 'csv_import_plus_extra_data', 'manual'),
(56, 'csv_import_plus_allow_roles', 'a:4:{i:0;s:5:"super";i:1;s:5:"admin";i:2;s:10:"researcher";i:3;s:11:"contributor";}'),
(57, 'csv_import_plus_slow_process', '0'),
(58, 'csv_import_plus_repeat_amazon_s3', '100'),
(59, 'exhibit_builder_sort_browse', 'added'),
(60, 'omeka_update', 'a:2:{s:14:"latest_version";s:4:"2.7\n";s:12:"last_updated";i:1573237123;}');

-- --------------------------------------------------------

--
-- Table structure for table `plugins`
--

CREATE TABLE IF NOT EXISTS `plugins` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(4) NOT NULL,
  `version` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `plugins`
--

INSERT INTO `plugins` (`id`, `name`, `active`, `version`) VALUES
(1, 'DublinCoreExtended', 1, '2.2'),
(2, 'CsvImportPlus', 1, '2.3.3'),
(3, 'ExhibitBuilder', 1, '3.4.2'),
(4, 'SimplePages', 1, '3.1.2');

-- --------------------------------------------------------

--
-- Table structure for table `processes`
--

CREATE TABLE IF NOT EXISTS `processes` (
`id` int(10) unsigned NOT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `pid` int(10) unsigned DEFAULT NULL,
  `status` enum('starting','in progress','completed','paused','error','stopped') COLLATE utf8_unicode_ci NOT NULL,
  `args` text COLLATE utf8_unicode_ci NOT NULL,
  `started` timestamp NOT NULL DEFAULT '2000-01-01 06:00:00',
  `stopped` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `records_tags`
--

CREATE TABLE IF NOT EXISTS `records_tags` (
`id` int(10) unsigned NOT NULL,
  `record_id` int(10) unsigned NOT NULL,
  `record_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tag_id` int(10) unsigned NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `schema_migrations`
--

CREATE TABLE IF NOT EXISTS `schema_migrations` (
  `version` varchar(16) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('20100401000000'),
('20100810120000'),
('20110113000000'),
('20110124000001'),
('20110301103900'),
('20110328192100'),
('20110426181300'),
('20110601112200'),
('20110627223000'),
('20110824110000'),
('20120112100000'),
('20120220000000'),
('20120221000000'),
('20120224000000'),
('20120224000001'),
('20120402000000'),
('20120516000000'),
('20120612112000'),
('20120623095000'),
('20120710000000'),
('20120723000000'),
('20120808000000'),
('20120808000001'),
('20120813000000'),
('20120914000000'),
('20121007000000'),
('20121015000000'),
('20121015000001'),
('20121018000001'),
('20121110000000'),
('20121218000000'),
('20130422000000'),
('20130426000000'),
('20130429000000'),
('20130701000000'),
('20130809000000'),
('20140304131700'),
('20150211000000'),
('20150310141100'),
('20150814155100'),
('20151118214800'),
('20151209103299'),
('20151209103300'),
('20161209171900'),
('20170331084000'),
('20170405125800');

-- --------------------------------------------------------

--
-- Table structure for table `search_texts`
--

CREATE TABLE IF NOT EXISTS `search_texts` (
`id` int(10) unsigned NOT NULL,
  `record_type` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `record_id` int(10) unsigned NOT NULL,
  `public` tinyint(1) NOT NULL,
  `title` mediumtext COLLATE utf8_unicode_ci,
  `text` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `search_texts`
--

INSERT INTO `search_texts` (`id`, `record_type`, `record_id`, `public`, `title`, `text`) VALUES
(1, 'SimplePagesPage', 1, 1, 'About', 'About <p>This is an example page. Feel free to replace this content, or delete the page and start from scratch.</p> '),
(2, 'Exhibit', 1, 1, 'Bike Map of Iowa City', 'Bike Map of Iowa City <p>This is a cool place for text</p>\n<p></p> '),
(3, 'ExhibitPage', 1, 1, 'First Chapter of the Cool Story', ' First Chapter of the Cool Story '),
(4, 'Item', 1, 1, 'What is this ', 'What is this  <strong>When</strong> American Indians first arrived in what is now Iowa more than 13,000 years ago, they were hunters and gatherers living in a Pleistocene glacial landscape. By the time European explorers and traders visited Iowa, American Indians were largely settled farmers with complex economic, social, and political systems. This transformation happened gradually. During the Archaic period (10,500–2,800 years ago), American Indians adapted to local environments and ecosystems, slowly becoming more sedentary as populations increased.[43] More than 3,000 years ago, during the Late Archaic period, American Indians in Iowa began utilizing domesticated plants. The subsequent Woodland period saw an increased reliance on agriculture and social complexity, with increased use of mounds, ceramics, and specialized subsistence. During the Late Prehistoric period (beginning about AD 900) increased use of maize and social changes led to social flourishing and nucleated settlements.[43] The arrival of European trade goods and diseases in the Protohistoric period led to dramatic population shifts and economic and social upheaval, with the arrival of new tribes and early European explorers and traders. There were numerous Indian tribes living in Iowa at the time of early European exploration. Tribes which were probably descendants of the prehistoric Oneota include the Dakota, Ho-Chunk, Ioway, and Otoe. Tribes which arrived in Iowa in the late prehistoric or protohistoric periods include the Illiniwek, Meskwaki, Omaha, and Sauk.[43] {\r\n"center": [-91.55888, 41.64308],\r\n"zoom": 8.40,\r\n"pitch": 32.00,\r\n"bearing": 0.87\r\n} '),
(5, 'ExhibitPage', 2, 1, 'Chapter One', ' <p>I love it</p> Chapter One '),
(6, 'Collection', 1, 1, '<h1>COOL SAMPLE STORY MAP</h1>', 'mapbox://styles/mapbox/streets-v11 pk.eyJ1IjoibXRidXRsZXIiLCJhIjoiY2pjdzFxaHhiNGt0MjJybnh6OTJnZ3h4dyJ9.KlVoNBd74vYAs16sOxN87w <h1>COOL SAMPLE STORY MAP</h1> <h3>Just testing things out here.</h3> '),
(7, 'Item', 2, 1, 'Nice Stuff', 'Nice Stuff Loving it {"center": [-90.15733, 38.61972],\r\n"zoom": 21,\r\n"pitch": 0.00,\r\n"bearing": 16.80} '),
(8, 'Collection', 2, 1, 'Coffeezone', 'Coffeezone Story Atlas version of CZ '),
(9, 'Item', 3, 1, 'This is coffee', 'This is coffee '),
(10, 'Item', 4, 1, 'THE FIRE', 'THE FIRE SECRETES MADE IT TO THE FIRE {\r\n"center": [-74.00919, 40.73829],\r\n"zoom": 18.91,\r\n"pitch": 60.00,\r\n"bearing": 40.00\r\n} ');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `modified` bigint(20) DEFAULT NULL,
  `lifetime` int(11) DEFAULT NULL,
  `data` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `modified`, `lifetime`, `data`) VALUES
('jtmunj7ddaq9atrt4b1798dbf5', 1573252771, 1209600, 0x416f545934794b4f322d7568554a51354e6262717a694f6575465f674b6c364b553747573170645f58767375614e394c50306173374e45586e574a4867634b4867695331346f634c646738386472497230344a727a304975555f753239504c4d4a4a454630365550494f5776784157324869532d2d32417170753378462d4b3575314d5f755a46486234694f576a4c734d78736c4b2d516956576c556649634f664a686979344a7065674c584a5f756e6970773772546741566468614877417877697175566758554d766e503546793768765947646d75384b5175744e5a785f534369426368395a58444d2e);

-- --------------------------------------------------------

--
-- Table structure for table `simple_pages_pages`
--

CREATE TABLE IF NOT EXISTS `simple_pages_pages` (
`id` int(10) unsigned NOT NULL,
  `modified_by_user_id` int(10) unsigned NOT NULL,
  `created_by_user_id` int(10) unsigned NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  `title` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `slug` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `inserted` timestamp NOT NULL DEFAULT '2000-01-01 06:00:00',
  `order` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned NOT NULL,
  `template` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `use_tiny_mce` tinyint(1) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `simple_pages_pages`
--

INSERT INTO `simple_pages_pages` (`id`, `modified_by_user_id`, `created_by_user_id`, `is_published`, `title`, `slug`, `text`, `updated`, `inserted`, `order`, `parent_id`, `template`, `use_tiny_mce`) VALUES
(1, 1, 1, 1, 'About', 'about', '<p>This is an example page. Feel free to replace this content, or delete the page and start from scratch.</p>', '2019-11-07 15:27:40', '2019-11-07 15:27:40', 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(10) unsigned NOT NULL,
  `username` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `salt` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL,
  `role` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `name`, `email`, `password`, `salt`, `active`, `role`) VALUES
(1, 'mtbutler', 'Super User', 'matthew-butler@uiowa.edu', '824742c4d6bf4c0f47b883e506fc8ec9c68ade18', '237419cee9b92cf5', 1, 'super');

-- --------------------------------------------------------

--
-- Table structure for table `users_activations`
--

CREATE TABLE IF NOT EXISTS `users_activations` (
`id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `url` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `added` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `collections`
--
ALTER TABLE `collections`
 ADD PRIMARY KEY (`id`), ADD KEY `public` (`public`), ADD KEY `featured` (`featured`), ADD KEY `owner_id` (`owner_id`);

--
-- Indexes for table `csv_import_plus_imported_records`
--
ALTER TABLE `csv_import_plus_imported_records`
 ADD PRIMARY KEY (`id`), ADD KEY `import_id` (`import_id`), ADD KEY `record_type_record_id` (`record_type`,`record_id`), ADD KEY `identifier` (`identifier`);

--
-- Indexes for table `csv_import_plus_imports`
--
ALTER TABLE `csv_import_plus_imports`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `csv_import_plus_logs`
--
ALTER TABLE `csv_import_plus_logs`
 ADD PRIMARY KEY (`id`), ADD KEY `import_id` (`import_id`);

--
-- Indexes for table `elements`
--
ALTER TABLE `elements`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name_element_set_id` (`element_set_id`,`name`), ADD UNIQUE KEY `order_element_set_id` (`element_set_id`,`order`), ADD KEY `element_set_id` (`element_set_id`);

--
-- Indexes for table `element_sets`
--
ALTER TABLE `element_sets`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`), ADD KEY `record_type` (`record_type`);

--
-- Indexes for table `element_texts`
--
ALTER TABLE `element_texts`
 ADD PRIMARY KEY (`id`), ADD KEY `record_type_record_id` (`record_type`,`record_id`), ADD KEY `element_id` (`element_id`), ADD KEY `text` (`text`(20));

--
-- Indexes for table `exhibits`
--
ALTER TABLE `exhibits`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `slug` (`slug`), ADD KEY `public` (`public`);

--
-- Indexes for table `exhibit_block_attachments`
--
ALTER TABLE `exhibit_block_attachments`
 ADD PRIMARY KEY (`id`), ADD KEY `block_id_order` (`block_id`,`order`);

--
-- Indexes for table `exhibit_pages`
--
ALTER TABLE `exhibit_pages`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `exhibit_id_parent_id_slug` (`exhibit_id`,`parent_id`,`slug`), ADD KEY `exhibit_id_order` (`exhibit_id`,`order`);

--
-- Indexes for table `exhibit_page_blocks`
--
ALTER TABLE `exhibit_page_blocks`
 ADD PRIMARY KEY (`id`), ADD KEY `page_id_order` (`page_id`,`order`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
 ADD PRIMARY KEY (`id`), ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
 ADD PRIMARY KEY (`id`), ADD KEY `item_type_id` (`item_type_id`), ADD KEY `collection_id` (`collection_id`), ADD KEY `public` (`public`), ADD KEY `featured` (`featured`), ADD KEY `owner_id` (`owner_id`);

--
-- Indexes for table `item_types`
--
ALTER TABLE `item_types`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `item_types_elements`
--
ALTER TABLE `item_types_elements`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `item_type_id_element_id` (`item_type_id`,`element_id`), ADD KEY `item_type_id` (`item_type_id`), ADD KEY `element_id` (`element_id`);

--
-- Indexes for table `keys`
--
ALTER TABLE `keys`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `plugins`
--
ALTER TABLE `plugins`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`), ADD KEY `active_idx` (`active`);

--
-- Indexes for table `processes`
--
ALTER TABLE `processes`
 ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`), ADD KEY `pid` (`pid`), ADD KEY `started` (`started`), ADD KEY `stopped` (`stopped`);

--
-- Indexes for table `records_tags`
--
ALTER TABLE `records_tags`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `tag` (`record_type`,`record_id`,`tag_id`), ADD KEY `tag_id` (`tag_id`);

--
-- Indexes for table `schema_migrations`
--
ALTER TABLE `schema_migrations`
 ADD UNIQUE KEY `unique_schema_migrations` (`version`);

--
-- Indexes for table `search_texts`
--
ALTER TABLE `search_texts`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `record_name` (`record_type`,`record_id`), ADD FULLTEXT KEY `text` (`text`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `simple_pages_pages`
--
ALTER TABLE `simple_pages_pages`
 ADD PRIMARY KEY (`id`), ADD KEY `is_published` (`is_published`), ADD KEY `inserted` (`inserted`), ADD KEY `updated` (`updated`), ADD KEY `created_by_user_id` (`created_by_user_id`), ADD KEY `modified_by_user_id` (`modified_by_user_id`), ADD KEY `order` (`order`), ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `username` (`username`), ADD KEY `active_idx` (`active`);

--
-- Indexes for table `users_activations`
--
ALTER TABLE `users_activations`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `collections`
--
ALTER TABLE `collections`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `csv_import_plus_imported_records`
--
ALTER TABLE `csv_import_plus_imported_records`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `csv_import_plus_imports`
--
ALTER TABLE `csv_import_plus_imports`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `csv_import_plus_logs`
--
ALTER TABLE `csv_import_plus_logs`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `elements`
--
ALTER TABLE `elements`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=92;
--
-- AUTO_INCREMENT for table `element_sets`
--
ALTER TABLE `element_sets`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `element_texts`
--
ALTER TABLE `element_texts`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `exhibits`
--
ALTER TABLE `exhibits`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `exhibit_block_attachments`
--
ALTER TABLE `exhibit_block_attachments`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `exhibit_pages`
--
ALTER TABLE `exhibit_pages`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `exhibit_page_blocks`
--
ALTER TABLE `exhibit_page_blocks`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `item_types`
--
ALTER TABLE `item_types`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `item_types_elements`
--
ALTER TABLE `item_types_elements`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT for table `keys`
--
ALTER TABLE `keys`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT for table `plugins`
--
ALTER TABLE `plugins`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `processes`
--
ALTER TABLE `processes`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `records_tags`
--
ALTER TABLE `records_tags`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `search_texts`
--
ALTER TABLE `search_texts`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `simple_pages_pages`
--
ALTER TABLE `simple_pages_pages`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users_activations`
--
ALTER TABLE `users_activations`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
