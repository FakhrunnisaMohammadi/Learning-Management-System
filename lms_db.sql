-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 05, 2026 at 04:20 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `ai_explanations`
--

CREATE TABLE `ai_explanations` (
  `id` int(11) NOT NULL,
  `content_type` enum('material','assignment') NOT NULL,
  `content_id` int(11) NOT NULL,
  `language` enum('en','bn','fa') NOT NULL,
  `explanation_text` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ai_explanations`
--

INSERT INTO `ai_explanations` (`id`, `content_type`, `content_id`, `language`, `explanation_text`, `created_at`) VALUES
(1, 'material', 2, 'en', '# Audio Guide: Software Requirements Specification (SRS) for Voice-Driven AI-Enhanced LMS\n\n---\n\n## Welcome and Introduction\n\nWelcome to this comprehensive audio description of the document titled **\"Software Requirements Specification (SRS) for Voice-Driven AI-Enhanced Learning Management System for Visually Impaired Students with Intelligent Chart Interpretation.\"** \n\nThis document outlines the blueprint for a specialized Learning Management System—or LMS—designed to make digital learning materials, specifically visual charts inside PDF documents, completely accessible to visually impaired students through voice interaction and artificial intelligence.\n\nBelow is a complete, clear walkthrough of all the concepts, structure, functional tables, and non-functional requirements contained in the document.\n\n---\n\n## Section 1: Overview of the Visual Layout\n\nThe document is organized into two main parts across seven pages:\n\n1. **Part One: Functional Requirements (Pages 1 to 5):** Contains 10 specific functional specification blocks. Each block is formatted inside a structured visual table detailing the **Name of Function**, **Inputs**, **Processes**, **Outputs**, **Preconditions**, **Postconditions**, **Alternate Options**, and **Side Effects**.\n2. **Part Two: Non-Functional Requirements (Pages 6 and 7):** Contains 10 tables outlining system quality attributes. Each table provides the **Requirement ID**, **Details**, and **Rationale**.\n\n---\n\n## Section 2: Functional Requirements Breakdown\n\n### Function 1: User Registration\n* **Purpose:** Allows new users to create an account as either a Professor or a Student.\n* **Inputs:** Full Name, Email Address, Password, and User Role.\n* **Process:** The system verifies the entered details, checks if the email already exists, encrypts the password, and stores the user details in the database.\n* **Output:** A new user account is successfully created.\n* **Precondition:** The user must not already be registered.\n* **Postcondition:** A user account is created.\n* **Alternate Options:** Triggered if the email already exists or if required fields are missing.\n* **Side Effects:** A new user record is stored in the database.\n\n---\n\n### Function 2: User Login\n* **Purpose:** Authenticates registered users into the system.\n* **Inputs:** Email Address and Password.\n* **Process:** Verifies the email format and password, authenticates credentials, identifies whether the user is a student or professor, and redirects them to their tailored dashboard.\n* **Output:** User successfully logs into the LMS.\n* **Precondition:** User must have an existing registered account.\n* **Postcondition:** An active user session is created.\n* **Alternate Options:** Triggered if an invalid email or password is provided, or if the user account does not exist.\n* **Side Effects:** Login timestamp is recorded.\n\n---\n\n### Function 3: Create Course\n* **Purpose:** Enables professors to set up new academic courses.\n* **Inputs:** Course Name, Course Code, and Course Description.\n* **Process:** Verifies professor authentication, validates course details, saves information to the database, and creates the course entry.\n* **Output:** A new course is created.\n* **Precondition:** The professor must be logged in.\n* **Postcondition:** The course becomes available on the LMS platform.\n* **Alternate Options:** Triggered if the course code already exists or required information is missing.\n* **Side Effects:** A new course record is generated.\n\n---\n\n### Function 4: Upload Learning Material\n* **Purpose:** Allows professors to upload PDF learning materials for a course.\n* **Inputs:** Course Selection, PDF File, and Material Title.\n* **Process:** Verifies professor identity, validates the PDF file, stores the file in local storage, and saves material information in the database.\n* **Output:** Learning material is uploaded.\n* **Precondition:** Professor must be logged in, and the course must exist.\n* **Postcondition:** Students enrolled in the course can access the material.\n* **Alternate Options:** Triggered on invalid file format or upload failure.\n* **Side Effects:** System storage space increases.\n\n---\n\n### Function 5: View Learning Material\n* **Purpose:** Allows students to open and review course content.\n* **Inputs:** Course Selection and Learning Material Selection.\n* **Process:** Verifies student identity, retrieves the selected PDF document, opens the built-in PDF viewer, and displays the content.\n* **Output:** Selected learning material is displayed.\n* **Precondition:** Student must be logged in.\n* **Postcondition:** Student can read or interact with the material.\n* **Alternate Options:** Triggered if the selected material is not found.\n* **Side Effects:** Student viewing history may be recorded.\n\n---\n\n### Function 6: Submit Assignment\n* **Purpose:** Enables students to upload completed assignment files.\n* **Inputs:** Assignment Selection and Assignment File.\n* **Process:** Verifies student identity, validates the uploaded file, saves the submission, and records the exact submission date and time.\n* **Output:** Assignment is successfully submitted.\n* **Precondition:** Student must be logged in and the assignment must be available.\n* **Postcondition:** The submission file is stored safely.\n* **Alternate Options:** Triggered by an invalid file format or if the deadline has passed.\n* **Side Effects:** A submission record is created in the database.\n\n---\n\n### Function 7: Grade Assignment\n* **Purpose:** Allows professors to evaluate student work and provide feedback.\n* **Inputs:** Student Submission, Grade, and Feedback text.\n* **Process:** Verifies professor identity, retrieves the submission, saves the grade and written feedback, and updates submission status.\n* **Output:** The student receives their grade and feedback.\n* **Precondition:** Professor must be logged in and a valid submission must exist.\n* **Postcondition:** The grade is saved in system records.\n* **Alternate Options:** Triggered if submission is not found or an invalid grade value is entered.\n* **Side Effects:** Student academic records are updated.\n\n---\n\n### Function 8: Voice Command Recognition\n* **Purpose:** Captures spoken input from visually impaired students to operate the system hands-free.\n* **Inputs:** Spoken Voice Command.\n* **Process:** Activates the microphone, captures audio speech, converts speech to text, and validates the command.\n* **Output:** The voice command is recognized by the LMS.\n* **Precondition:** Student must be logged in with a learning material open.\n* **Postcondition:** Voice command text is ready for AI command processing.\n* **Alternate Options:** Triggered if speech is not recognized or microphone access is denied.\n* **Side Effects:** Voice input audio is temporarily processed.\n\n---\n\n### Function 9: AI Chart Interpretation\n* **Purpose:** Interprets visual charts, graphs, and images within course PDF materials using artificial intelligence.\n* **Inputs:** Voice Command and Current Learning Material PDF page.\n* **Process:** \n  1. Retrieves the currently opened PDF page.\n  2. Extracts the page content using PyMuPDF software library.\n  3. Sends the page content to the Google Gemini AI API.\n  4. Generates a detailed textual explanation of visual charts found on the page.\n  5. Returns the generated explanation back to the LMS.\n* **Output:** An AI-generated chart explanation is produced.\n* **Precondition:** Learning material must be actively open.\n* **Postcondition:** An AI text explanation is available for playback.\n* **Alternate Options:** Triggered if no chart is detected on the page or if the AI service is unavailable.\n* **Side Effects:** AI processing computational resources are used.\n\n---\n\n### Function 10: Audio Response\n* **Purpose:** Delivers the AI chart explanation back to the student via speech output.\n* **Inputs:** AI-generated textual explanation.\n* **Process:** Converts the text explanation into spoken voice output (Text-to-Speech), plays the audio aloud, displays text on screen, and prepares to listen for follow-up voice commands.\n* **Output:** The student hears the spoken chart explanation.\n* **Precondition:** An AI explanation must be available.\n* **Postcondition:** Audio playback finishes.\n* **Alternate Options:** Triggered if audio playback fails.\n* **Side Effects:** Audio hardware resources are used.\n\n---\n\n## Section 3: Non-Functional Requirements Breakdown\n\nPages 6 and 7 list 10 quality standard categories, summarized below:\n\n1. **Usability:**\n   * **NFR-Usability1:** Simple and easy-to-use interface to help users operate the system without difficulty.\n   * **NFR-Usability2:** Consistent page navigation across all sections to improve user experience.\n\n2. **Accessibility:**\n   * **NFR-Accessibility1:** Supports voice commands for requesting AI chart explanations to assist visually impaired students.\n   * **NFR-Accessibility2:** Delivers clear audio output for AI responses to make visual learning materials fully accessible.\n\n3. **Performance:**\n   * **NFR-Performance1:** Learning materials must open within a reasonable time for a smooth learning experience.\n   * **NFR-Performance2:** AI generates chart explanations quickly upon request to reduce wait time.\n\n4. **Security:**\n   * **NFR-Security1:** Requires mandatory user authentication before granting system access.\n   * **NFR-Security2:** Limits platform access based on user roles (Student vs. Professor) to prevent unauthorized actions.\n\n5. **Reliability:**\n   * **NFR-Reliability1:** Stores learning materials and user data safely to prevent loss.\n   * **NFR-Reliability2:** Maintains accurate course and grade records to preserve data integrity.\n\n6. **Compatibility:**\n   * **NFR-Compatibility1:** Works reliably on modern web browsers.\n   * **NFR-Compatibility2:** Supports desktop and laptop hardware devices.\n\n7. **Maintainability:**\n   * **NFR-Maintainability1:** Uses a modular system architecture to make future updates easier.\n   * **NFR-Maintainability2:** Allows the AI module to be updated independently from the core LMS framework.\n\n8. **Scalability:**\n   * **NFR-Scalability1:** Capable of expanding to support an increasing number of users and courses over time.\n\n9. **Availability:**\n   * **NFR-Availability1:** Remains operational whenever students need to access learning materials.\n\n10. **Portability:**\n    * **NFR-Portability1:** Deployable across different operating systems to ensure flexible hosting and installation.\n\n---\n\n## Conclusion\n\nThis SRS specification outlines a complete ecosystem centered around accessible learning. By combining PyMuPDF for PDF extraction, Google Gemini API for visual interpretation, and hands-free voice control, the system transforms visual graphical data into accessible audio explanations tailored for visually impaired learners.', '2026-08-04 21:29:29'),
(2, 'material', 2, 'bn', 'এই শিক্ষা সহায়িকা নথিটির মূল বিষয়বস্তু নিচে সহজ ও স্পষ্টভাবে বাংলা ভাষায় ব্যাখ্যা করা হলো, যা স্ক্রিন রিডার বা টেক্সট-টু-স্পিচ (TTS) অডিও সফটওয়্যারের মাধ্যমে সহজে শোনার উপযোগী করে সাজানো হয়েছে।\n\n---\n\n# সফটওয়্যার রিকোয়ারমেন্ট স্পেসিফিকেশন (SRS)\n### প্রজেক্টের নাম: দৃষ্টিপ্রতিবন্ধী শিক্ষার্থীদের জন্য ভয়েস-চালিত এআই সম্বলিত শিক্ষা ব্যবস্থাপনা সিস্টেম ও বুদ্ধিমান চার্ট বিশ্লেষণ\n\nএই নথিটিতে একটি আধুনিক শিক্ষা ব্যবস্থাপনা সিস্টেম বা লার্নিং ম্যানেজমেন্ট সিস্টেম (LMS)-এর মূল বৈশিষ্ট্য ও প্রয়োজনীয়তাসমূহ তুলে ধরা হয়েছে। সিস্টেমটির মূল উদ্দেশ্য হলো দৃষ্টিপ্রতিবন্ধী শিক্ষার্থীরা যেন কণ্ঠস্বর বা ভয়েস কমান্ডের মাধ্যমে পড়ালেখা করতে পারে এবং পিডিএফ ফাইলের মধ্যে থাকা বিভিন্ন চার্ট বা গ্রাফ এআই (AI)-এর মাধ্যমে শুনে বুঝতে পারে।\n\nনথিটিকে প্রধানত দুটি অংশে ভাগ করা হয়েছে:\n১. কার্যকরী প্রয়োজনীয়তাসমূহ (Functional Requirements)\n২. অকার্যকরী প্রয়োজনীয়তাসমূহ (Non-Functional Requirements)\n\n---\n\n## ১ম অংশ: কার্যকরী প্রয়োজনীয়তাসমূহ (Functional Requirements)\n\nএখানে মোট ১০টি প্রধান কাজের কথা বলা হয়েছে:\n\n### ১. ব্যবহারকারী নিবন্ধন (User Registration)\n* **কাজ:** নতুন শিক্ষক বা শিক্ষার্থী সিস্টেমে অ্যাকাউন্ট তৈরি করবেন।\n* **ইনপুট:** নাম, ইমেইল, পাসওয়ার্ড এবং পদবি (শিক্ষক নাকি শিক্ষার্থী)।\n* **প্রক্রিয়া:** তথ্য যাচাই, ইমেইল আগে থেকে আছে কিনা তা পরীক্ষা, পাসওয়ার্ড এনক্রিপ্ট করা এবং ডাটাবেজে সংরক্ষণ করা।\n* **আউটপুট:** একটি নতুন ব্যবহারকারী অ্যাকাউন্ট তৈরি হয়।\n\n### ২. ব্যবহারকারী লগইন (User Login)\n* **কাজ:** নিবন্ধিত ব্যবহারকারী সিস্টেমে প্রবেশ করবেন।\n* **ইনপুট:** ইমেইল ও পাসওয়ার্ড।\n* **প্রক্রিয়া:** ইমেইল ও পাসওয়ার্ড যাচাই করে সঠিক ড্যাশবোর্ডে রিডাইরেক্ট করা।\n* **আউটপুট:** সফলভাবে সিস্টেমে লগইন।\n\n### ৩. কোর্স তৈরি (Create Course)\n* **কাজ:** শিক্ষক নতুন কোর্স তৈরি করবেন।\n* **ইনপুট:** কোর্সের নাম, কোর্স কোড এবং বিবরণ।\n* **প্রক্রিয়া:** শিক্ষকের পরিচয় যাচাই ও কোর্সের তথ্য ডাটাবেজে সংরক্ষণ।\n* **আউটপুট:** নতুন কোর্স তৈরি হয়।\n\n### ৪. শিক্ষা সামগ্রী আপলোড (Upload Learning Material)\n* **কাজ:** শিক্ষক কোর্সের অধীনে পড়াশোনার উপাদান আপলোড করবেন।\n* **ইনপুট:** নির্দিষ্ট কোর্স নির্বাচন, পিডিএফ (PDF) ফাইল এবং শিরোনাম।\n* **প্রক্রিয়া:** পিডিএফ ফাইল পরীক্ষা করে লোকাল স্টোরেজ ও ডাটাবেজে সংরক্ষণ।\n* **আউটপুট:** স্টাডি মেটেরিয়াল বা শিক্ষা সামগ্রী সফলভাবে আপলোড হয়।\n\n### ৫. শিক্ষা সামগ্রী দেখা (View Learning Material)\n* **কাজ:** শিক্ষার্থী পড়াশোনার ফাইল ওপেন করবে।\n* **ইনপুট:** কোর্স ও নির্দিষ্ট ফাইল নির্বাচন।\n* **প্রক্রিয়া:** শিক্ষার্থী যাচাই করে পিডিএফ ভিউয়ারে ফাইলটি প্রদর্শন করা।\n* **আউটপুট:** স্ক্রিনে পড়ালেখার ফাইলটি প্রদর্শিত হয়।\n\n### ৬. অ্যাসাইনমেন্ট জমা দেওয়া (Submit Assignment)\n* **কাজ:** শিক্ষার্থী তার অ্যাসাইনমেন্ট জমা দেবে।\n* **ইনপুট:** নির্দিষ্ট অ্যাসাইনমেন্ট নির্বাচন ও ফাইল আপলোড।\n* **প্রক্রিয়া:** ফাইল ফরম্যাট যাচাই, জমা দেওয়ার তারিখ ও সময় রেকর্ড করা।\n* **আউটপুট:** অ্যাসাইনমেন্ট জমা সম্পন্ন হয়।\n\n### ৭. অ্যাসাইনমেন্ট মূল্যায়ন বা গ্রেডিং (Grade Assignment)\n* **কাজ:** শিক্ষক জমা দেওয়া অ্যাসাইনমেন্টের নম্বর ও ফিডব্যাক দেবেন।\n* **ইনপুট:** শিক্ষার্থীর সাবমিশন, গ্রেড এবং ফিডব্যাক।\n* **প্রক্রিয়া:** গ্রেড ও মন্তব্য ডাটাবেজে সংরক্ষণ করা।\n* **আউটপুট:** শিক্ষার্থী তার গ্রেড ও শিক্ষকের মন্তব্য দেখতে পায়।\n\n### ৮. ভয়েস কমান্ড শনাক্তকরণ (Voice Command Recognition)\n* **কাজ:** দৃষ্টিপ্রতিবন্ধী শিক্ষার্থীর কণ্ঠস্বরের নির্দেশ বোঝা।\n* **ইনপুট:** শিক্ষার্থীর মুখের ভয়েস কমান্ড।\n* **প্রক্রিয়া:** মাইক্রোফোন চালু করা, কথা রেকর্ড করা, কথাকে লেখায় (Speech-to-Text) রূপান্তর করা এবং কমান্ড যাচাই করা।\n* **আউটপুট:** ভয়েস কমান্ড সফলভাবে শনাক্ত হয়।\n\n### ৯. এআই চার্ট ব্যাখ্যা (AI Chart Interpretation)\n* **কাজ:** পিডিএফে থাকা ছবি বা চার্ট বিশ্লেষণ করে বুঝিয়ে দেওয়া।\n* **ইনপুট:** ভয়েস কমান্ড এবং বর্তমানে খোলা থাকা শিক্ষা সামগ্রী।\n* **প্রক্রিয়া:** \n  ১. পিডিএফের বর্তমান পৃষ্ঠা চিহ্নিত করা।\n  ২. পাইমুপিডিএফ (PyMuPDF) লাইব্রেরির মাধ্যমে পৃষ্ঠাটি এক্সট্র্যাক্ট বা আলাদা করা।\n  ৩. গুগল জেমিনি এআই (Google Gemini API)-তে পৃষ্ঠাটি পাঠানো।\n  ৪. এআই চার্টের ওপর একটি বিস্তারিত বিবরণ বা ব্যাখ্যা তৈরি করে সিস্টেমে পাঠায়।\n* **আউটপুট:** এআই কর্তৃক তৈরি চার্টের ব্যাখ্যা প্রস্তুত হয়।\n\n### ১০. অডিও প্রতিক্রিয়া (Audio Response)\n* **কাজ:** এআই-এর তৈরি ব্যাখ্যাটি শিক্ষার্থীকে শুনিয়ে দেওয়া।\n* **ইনপুট:** এআই-এর লেখা ব্যাখ্যা।\n* **প্রক্রিয়া:** লেখাকে অডিওতে (Text-to-Speech) রূপান্তর করে বাজানো এবং প্রয়োজনে পরবর্তী ভয়েস নির্দেশ গ্রহণ করা।\n* **আউটপুট:** শিক্ষার্থী চার্টের ব্যাখ্যাটি অডিও হিসেবে শুনতে পায়।\n\n---\n\n## ২য় অংশ: অকার্যকরী প্রয়োজনীয়তাসমূহ (Non-Functional Requirements)\n\nসিস্টেমটি কতটা দক্ষতার সাথে কাজ করবে, তার জন্য ১০টি মানদণ্ড নির্ধারণ করা হয়েছে:\n\n১. **ব্যবহারযোগ্যতা (Usability):** ইন্টারফেসটি খুব সহজ ও সরল রাখা হয়েছে যাতে কোনো অসুবিধা ছাড়াই এটি ব্যবহার করা যায়।\n২. **সহজগম্যতা (Accessibility):** দৃষ্টিপ্রতিবন্ধী শিক্ষার্থীদের সুবিধার জন্য ভয়েস কমান্ড এবং অডিও আউটপুটের ব্যবস্থা রাখা হয়েছে।\n৩. **কর্মক্ষমতা (Performance):** ফাইল দ্রুত ওপেন হবে এবং এআই খুব কম সময়ে চার্টের ব্যাখ্যা তৈরি করে দেবে।\n৪. **নিরাপত্তা (Security):** ব্যবহারকারীর ডেটা সুরক্ষিত রাখতে লগইন সিস্টেম এবং পদবিভিত্তিক এক্সেস নিয়ন্ত্রণ করা হয়েছে।\n৫. **নির্ভরযোগ্যতা (Reliability):** কোর্সের তথ্য ও গ্রেডের সঠিকতা বজায় রাখা এবং ডেটা লস রোধ করা।\n৬. **সামঞ্জস্যতা (Compatibility):** যেকোনো আধুনিক ওয়েব ব্রাউজার, ডেস্কটপ এবং ল্যাপটপ ডিভাইসে এটি নির্বিঘ্নে চলবে।\n৭. **রক্ষাণাবেক্ষণ (Maintainability):** সিস্টেমটি মডুলার ডিজাইনে তৈরি, ফলে মূল LMS ক্ষতিগ্রস্ত না করে এআই মডিউল আলাদাভাবে আপডেট করা যাবে।\n৮. **সম্প্রসারণযোগ্যতা (Scalability):** ভবিষ্যতে ব্যবহারকারী এবং কোর্সের সংখ্যা বাড়লেও সিস্টেমটি সহজে তা পরিচালনা করতে পারবে।\n৯. **সহজলভ্যতা (Availability):** শিক্ষার্থীরা যেকোনো সময় বাধাহীনভাবে তাদের পড়াশোনার মেটেরিয়াল দেখতে পারবে।\n১০. **বহুমাত্রিকতা বা পোর্টাবিলিটি (Portability):** সিস্টেমটি বিভিন্ন অপারেটিং সিস্টেমে (যেমন: উইন্ডোজ, লিনাক্স ইত্যাদি) সহজে ইনস্টল ও ব্যবহার করা যাবে।\n\n---\n\n## সারসংক্ষেপ\n\nএই সম্পূর্ণ ডকুমেন্টটিতে দৃষ্টিপ্রতিবন্ধী শিক্ষার্থীদের জন্য একটি সম্পূর্ণ অনলাইন শিক্ষা ব্যবস্থার ব্লু-প্রিন্ট দেওয়া হয়েছে। এটি মূলতঃ এমন একটি প্ল্যাটফর্ম যা অডিও আউটপুট, ভয়েস কমান্ড এবং গুগল জেমিনি এআই ব্যবহার করে ভিজ্যুয়াল চার্ট ব্যাখ্যা করার মাধ্যমে পড়াশোনাকে দৃষ্টিপ্রতিবন্ধী শিক্ষার্থীদের জন্য অত্যন্ত সহজ ও স্বাধীন করে তোলে।', '2026-08-04 21:31:01'),
(3, 'assignment', 14, 'en', 'Audio Guide for Assignment Analysis.\n\nThis audio guide is designed to assist you with the assignment titled Biggemr. Below is a complete, clear breakdown of the assignment details, task description, and recommendations for handling visual figures and text accessibility.\n\n---\n\nAssignment Overview\n\nTitle of Assignment: Biggemr.\n\nTask Description Code: jandhIUQGF.\n\n---\n\nDetailed Description of the Task String\n\nThe task description provided consists of a ten-character alphanumeric string. Because this string does not form standard English words, it is spelled out character by character for clarity:\n\nCharacter 1: Lowercase j.\nCharacter 2: Lowercase a.\nCharacter 3: Lowercase n.\nCharacter 4: Lowercase d.\nCharacter 5: Lowercase h.\nCharacter 6: Uppercase I.\nCharacter 7: Uppercase U.\nCharacter 8: Uppercase Q.\nCharacter 9: Uppercase G.\nCharacter 10: Uppercase F.\n\nAltogether, the string reads as: lowercase j, lowercase a, lowercase n, lowercase d, lowercase h, followed by uppercase I, uppercase U, uppercase Q, uppercase G, uppercase F.\n\n---\n\nAnalysis and Instructions\n\n1. Interpreting the Task Description:\nThe string jandhIUQGF appears to be a unique key, a cipher, a submission identifier, or a temporary placeholder provided by your online learning platform. \n\nIf this string represents a substitution cipher or encrypted task:\n- The first five characters are all lowercase letters: j, a, n, d, h.\n- The remaining five characters are all uppercase letters: I, U, Q, G, F.\n- Notice that the string transitions directly from lowercase to uppercase halfway through.\n\nIf this string is a system code or missing text link:\n- Check your course portal to see if this code corresponds to a specific downloadable file, dataset, or interactive module named Biggemr.\n\n2. Instructions for Completing the Assignment:\nStep 1: Verify the assignment file. Access your course portal and search for the assignment title Biggemr. Confirm whether an attached document, PDF, or audio file contains the full narrative instructions.\n\nStep 2: Contact your instructor or accessibility coordinator if no further text is present. Inform them that the task description displays only the ten-character code j, a, n, d, h, capital I, capital U, capital Q, capital G, capital F, and request the unencoded text.\n\nStep 3: If this string is part of a cryptography or computer science exercise, apply standard decryption methods, such as checking for Caesar shift patterns or base conversions between the lowercase and uppercase sections.\n\n---\n\nVisual Figures and Layout Guidance\n\nIf this assignment includes visual figures, diagrams, or charts upon opening the main file, use the following visual structure to understand their content:\n\n1. Overview of Visual Elements:\nVisual figures are typically presented with a figure number, a title, a visual graphic, and a caption beneath it.\n\n2. Spatial Orientation Framework:\n- Top Area: Contains the title of the figure and the main header.\n- Center Area: Contains the primary visual data, such as a bar chart, flow diagram, or illustration.\n- Bottom Area: Contains the legend, key, source information, and explanatory caption text.\n- Left to Right Flow: Charts and process diagrams read from left to right. Timelines move chronologically from left to right.\n\n3. Requesting Image Descriptions:\nWhen visual figures are present, ask your screen reader or accessibility service to describe:\n- The type of graphic, such as a line graph, pie chart, or structural diagram.\n- The x-axis horizontal label and y-axis vertical label for graphs.\n- Key data points, trends, or distinct color-coded categories mentioned in the visual key.\n\n---\n\nSummary of Action Steps\n\nFirst, note the assignment title: Biggemr.\nSecond, keep a record of the reference code: lowercase j, lowercase a, lowercase n, lowercase d, lowercase h, uppercase I, uppercase U, uppercase Q, uppercase G, uppercase F.\nThird, verify the complete assignment details on your learning management platform or request a fully descriptive text document from your instructor.\n\nThis concludes the audio explanation for the assignment Biggemr.', '2026-08-04 21:31:47');

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`id`, `course_id`, `message`, `created_at`) VALUES
(2, 1, 'Kabul', '2026-08-02 14:57:59'),
(3, 2, 'Good Morning, \r\nDue to un avoidable situation class is cancelled but there will surely be mandatory makeup calss', '2026-08-03 06:58:14'),
(4, 1, 'read good bad', '2026-08-03 16:07:49');

-- --------------------------------------------------------

--
-- Table structure for table `announcement_hidden`
--

CREATE TABLE `announcement_hidden` (
  `announcement_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `hidden_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `announcement_hidden`
--

INSERT INTO `announcement_hidden` (`announcement_id`, `student_id`, `hidden_at`) VALUES
(2, 1, '2026-08-03 05:49:33');

-- --------------------------------------------------------

--
-- Table structure for table `announcement_reads`
--

CREATE TABLE `announcement_reads` (
  `id` int(11) NOT NULL,
  `announcement_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `read_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `announcement_reads`
--

INSERT INTO `announcement_reads` (`id`, `announcement_id`, `student_id`, `read_at`) VALUES
(1, 2, 1, '2026-08-02 17:27:39'),
(11, 3, 6, '2026-08-03 08:55:49'),
(14, 4, 1, '2026-08-03 17:23:05');

-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

CREATE TABLE `assignments` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `filepath` varchar(255) DEFAULT NULL,
  `due_date` datetime DEFAULT NULL,
  `submission_type` enum('individual','group') NOT NULL DEFAULT 'individual',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assignments`
--

INSERT INTO `assignments` (`id`, `course_id`, `title`, `description`, `filepath`, `due_date`, `submission_type`, `created_at`) VALUES
(11, 1, '123', '123', '', '2026-08-03 01:41:00', 'individual', '2026-08-02 19:39:45'),
(12, 2, 'GitHub Configuration', 'This assingment is about github cinfig practice', 'uploads/assignments/1785740148_6a703b74c378a.pdf', '2026-08-03 13:05:00', 'individual', '2026-08-03 06:55:48'),
(13, 1, 'Coding contest', 'This is the coding contest part', 'uploads/assignments/1785773200_6a70bc90f3cd1.pdf', '2026-08-03 22:11:00', 'individual', '2026-08-03 16:06:41'),
(14, 1, 'Biggemr', 'jandhIUQGF', '', '2026-08-03 14:19:00', 'individual', '2026-08-03 17:19:20'),
(15, 1, 'ABDCD', 'good morning', '', '2026-08-07 23:20:00', 'individual', '2026-08-03 17:20:51');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `professor_id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `join_code` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `professor_id`, `title`, `description`, `join_code`, `created_at`) VALUES
(1, 2, 'DSA4000', 'This course is for Data Structure and Algorithms', 'D7VKLKZ9', '2026-08-02 14:48:56'),
(2, 2, 'Python and R', 'This course teaches Python and R', '82UJELCD', '2026-08-03 06:51:44');

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `enrolled_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrollments`
--

INSERT INTO `enrollments` (`id`, `course_id`, `student_id`, `enrolled_at`) VALUES
(1, 1, 1, '2026-08-02 14:49:35'),
(2, 1, 4, '2026-08-02 16:25:05'),
(3, 1, 3, '2026-08-02 16:25:44'),
(4, 1, 5, '2026-08-02 16:26:06'),
(5, 2, 6, '2026-08-03 08:54:47');

-- --------------------------------------------------------

--
-- Table structure for table `group_members`
--

CREATE TABLE `group_members` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `group_members`
--

INSERT INTO `group_members` (`id`, `group_id`, `course_id`, `student_id`) VALUES
(5, 5, 1, 4),
(7, 5, 1, 3),
(8, 5, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `materials`
--

CREATE TABLE `materials` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `filepath` varchar(255) NOT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `materials`
--

INSERT INTO `materials` (`id`, `course_id`, `title`, `filename`, `filepath`, `uploaded_at`) VALUES
(2, 1, 'hvgd', 'Phase02_SE_Group_5.pdf', 'uploads/materials/1785739564_6a70392c605af.pdf', '2026-08-03 06:46:04'),
(3, 2, 'jkhfuwg', 'Phase02_SE_Group_5.pdf', 'uploads/materials/1785746022_6a705266dbad2_0.pdf', '2026-08-03 08:33:42'),
(4, 2, 'g', 'updated Transcript.pdf', 'uploads/materials/1785746099_6a7052b3c0c6e_0.pdf', '2026-08-03 08:34:59'),
(5, 2, 'g', 'Systematic_literature_review_group5.pdf', 'uploads/materials/1785746099_6a7052b3c2336_1.pdf', '2026-08-03 08:34:59'),
(6, 1, 'aiHDIUPQ', 'Screenshot 2026-08-04 101214.png', 'uploads/materials/1785864703_6a7221ff62f4e_0.png', '2026-08-04 17:31:43');

-- --------------------------------------------------------

--
-- Table structure for table `student_groups`
--

CREATE TABLE `student_groups` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_groups`
--

INSERT INTO `student_groups` (`id`, `course_id`, `name`) VALUES
(5, 1, '123'),
(6, 1, '233'),
(7, 2, 'Group C');

-- --------------------------------------------------------

--
-- Table structure for table `submissions`
--

CREATE TABLE `submissions` (
  `id` int(11) NOT NULL,
  `assignment_id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `filepath` varchar(255) NOT NULL,
  `grade` decimal(5,2) DEFAULT NULL,
  `feedback` text DEFAULT NULL,
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('Submitted','Late','Missing') DEFAULT 'Submitted'
) ;

--
-- Dumping data for table `submissions`
--

INSERT INTO `submissions` (`id`, `assignment_id`, `student_id`, `group_id`, `filepath`, `grade`, `feedback`, `submitted_at`, `status`) VALUES
(8, 15, 1, NULL, '', NULL, NULL, '2026-08-04 19:11:49', 'Submitted');

-- --------------------------------------------------------

--
-- Table structure for table `submission_files`
--

CREATE TABLE `submission_files` (
  `id` int(11) NOT NULL,
  `submission_id` int(11) NOT NULL,
  `filepath` varchar(255) NOT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('student','professor') NOT NULL,
  `preferred_language` enum('en','bn','fa') NOT NULL DEFAULT 'en',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password_hash`, `role`, `preferred_language`, `created_at`) VALUES
(1, 'Shahr Bano Rezai', 'shahr.rezai@auw.edu.bd', '$2y$10$h1hFAkVPdnRalATUWSh0Au..R774fzy1Zd6HeBcebYi/MXbzfPgEO', 'student', 'en', '2026-08-02 14:40:02'),
(2, 'Nisa', 'nisa@gmail.com', '$2y$10$esU9vSW/rkTB065lWnpn1O2DyQp8e3TSroFxnMn2Tdx1dMPGqAgQe', 'professor', 'en', '2026-08-02 14:41:15'),
(3, 'sahar', 'sahar@gmial.com', '$2y$10$aeX8Zs5YgQgSS14Irbrly.iYLdFfsaKUV47yCVEqmAE.M0oZqQPMW', 'student', 'en', '2026-08-02 16:22:37'),
(4, 'Ahmad', 'ahmad@gmail.com', '$2y$10$BsWxIf4Xa99/UMabGyk4HO4bHKE6vIM2pw../WShPlGgnss1nu17u', 'student', 'en', '2026-08-02 16:23:01'),
(5, 'kobra', 'kobra@gmail.com', '$2y$10$5qg0jKqR1R.P3rmaCVqtFO3R5pcuXMcfKT87oHUd8tDzMIqmE6ZlW', 'student', 'en', '2026-08-02 16:23:24'),
(6, 'jabar', 'jabar@gmail.com', '$2y$10$0H0mML2kO5efnewfRz56vet2S89FAQx18wGpLvZCVl6WCGBeRHWJO', 'student', 'en', '2026-08-03 08:52:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ai_explanations`
--
ALTER TABLE `ai_explanations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_explanation` (`content_type`,`content_id`,`language`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_announcement_course` (`course_id`);

--
-- Indexes for table `announcement_hidden`
--
ALTER TABLE `announcement_hidden`
  ADD PRIMARY KEY (`announcement_id`,`student_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `announcement_reads`
--
ALTER TABLE `announcement_reads`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `announcement_id` (`announcement_id`,`student_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `assignments`
--
ALTER TABLE `assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_assignment_course` (`course_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_courses_join_code` (`join_code`),
  ADD KEY `fk_courses_professor` (`professor_id`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_enrollment` (`course_id`,`student_id`),
  ADD KEY `fk_enroll_student` (`student_id`);

--
-- Indexes for table `group_members`
--
ALTER TABLE `group_members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_student_course` (`course_id`,`student_id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `materials`
--
ALTER TABLE `materials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_material_course` (`course_id`);

--
-- Indexes for table `student_groups`
--
ALTER TABLE `student_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_group_course` (`course_id`);

--
-- Indexes for table `submissions`
--
ALTER TABLE `submissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_student_assignment` (`assignment_id`,`student_id`),
  ADD KEY `fk_submission_student` (`student_id`),
  ADD KEY `fk_submission_group` (`group_id`);

--
-- Indexes for table `submission_files`
--
ALTER TABLE `submission_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `submission_id` (`submission_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_users_email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ai_explanations`
--
ALTER TABLE `ai_explanations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `announcement_reads`
--
ALTER TABLE `announcement_reads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `assignments`
--
ALTER TABLE `assignments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `group_members`
--
ALTER TABLE `group_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `materials`
--
ALTER TABLE `materials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `student_groups`
--
ALTER TABLE `student_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `submissions`
--
ALTER TABLE `submissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `submission_files`
--
ALTER TABLE `submission_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `announcements`
--
ALTER TABLE `announcements`
  ADD CONSTRAINT `fk_announcement_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `announcement_hidden`
--
ALTER TABLE `announcement_hidden`
  ADD CONSTRAINT `announcement_hidden_ibfk_1` FOREIGN KEY (`announcement_id`) REFERENCES `announcements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `announcement_hidden_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `announcement_reads`
--
ALTER TABLE `announcement_reads`
  ADD CONSTRAINT `announcement_reads_ibfk_1` FOREIGN KEY (`announcement_id`) REFERENCES `announcements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `announcement_reads_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `assignments`
--
ALTER TABLE `assignments`
  ADD CONSTRAINT `fk_assignment_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `fk_courses_professor` FOREIGN KEY (`professor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `fk_enroll_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_enroll_student` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `group_members`
--
ALTER TABLE `group_members`
  ADD CONSTRAINT `group_members_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `student_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `group_members_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `group_members_ibfk_3` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `materials`
--
ALTER TABLE `materials`
  ADD CONSTRAINT `fk_material_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_groups`
--
ALTER TABLE `student_groups`
  ADD CONSTRAINT `fk_group_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `submissions`
--
ALTER TABLE `submissions`
  ADD CONSTRAINT `fk_submission_assignment` FOREIGN KEY (`assignment_id`) REFERENCES `assignments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_submission_group` FOREIGN KEY (`group_id`) REFERENCES `student_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_submission_student` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `submission_files`
--
ALTER TABLE `submission_files`
  ADD CONSTRAINT `submission_files_ibfk_1` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
