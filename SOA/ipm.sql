-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 31, 2018 lúc 04:57 SA
-- Phiên bản máy phục vụ: 10.1.21-MariaDB
-- Phiên bản PHP: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `ipm`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `authorities`
--

CREATE TABLE `authorities` (
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `authority` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `authorities`
--

INSERT INTO `authorities` (`username`, `authority`) VALUES
('Taimaddog', 'ROLE_INTERVIEWEE'),
('vanthieu', 'ROLE_ADMIN');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `candidate`
--

CREATE TABLE `candidate` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) COLLATE utf8_bin NOT NULL,
  `major` varchar(50) COLLATE utf8_bin NOT NULL,
  `birthday` date NOT NULL,
  `gender` varchar(7) COLLATE utf8_bin NOT NULL,
  `id_card` varchar(20) COLLATE utf8_bin NOT NULL,
  `email` varchar(100) COLLATE utf8_bin NOT NULL,
  `phone` int(11) NOT NULL,
  `date_create` varchar(15) COLLATE utf8_bin NOT NULL,
  `status` varchar(20) COLLATE utf8_bin NOT NULL,
  `cv` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `candidate`
--

INSERT INTO `candidate` (`id`, `fullname`, `major`, `birthday`, `gender`, `id_card`, `email`, `phone`, `date_create`, `status`, `cv`) VALUES
(2, 'Đào Nhật Tài', 'Software Engineering', '1991-08-27', 'Male', '946453216', 'taidn@gmail.com', 898469751, '2018-07-11', 'Pending', ''),
(3, 'Trần Hán Minh Khoa', 'Software Engineering', '1996-10-28', 'Male', '756415745', 'khoathm@gmail.com', 987412545, '2018-07-13', 'Pending', ''),
(4, 'Lê Văn Thiệu', 'Software Engineering', '1997-09-13', 'Male', '371831263', 'hehehe@gmail.com', 1234567890, '2018-37-30', 'Pending', 'D:\\Temp\\IPM\\target\\IPM-1.0-SNAPSHOT\\371831263.pdf');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `entry_test`
--

CREATE TABLE `entry_test` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `position_id` int(11) NOT NULL,
  `candidate_id` int(11) NOT NULL,
  `round` varchar(100) COLLATE utf8_bin NOT NULL,
  `result` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `entry_test`
--

INSERT INTO `entry_test` (`id`, `name`, `position_id`, `candidate_id`, `round`, `result`) VALUES
(1, 'Background', 5, 1, '1', ''),
(2, 'Technical', 5, 1, '2', ''),
(3, 'Back-end', 4, 2, '1', ''),
(4, 'Front-end', 4, 2, '2', ''),
(5, 'Final test', 4, 2, '3', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `interview`
--

CREATE TABLE `interview` (
  `id` int(11) NOT NULL,
  `date` varchar(15) COLLATE utf8_bin NOT NULL,
  `time` time NOT NULL,
  `location` varchar(100) COLLATE utf8_bin NOT NULL,
  `candidate_id` int(11) NOT NULL,
  `username` varchar(50) COLLATE utf8_bin NOT NULL,
  `result` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `interview`
--

INSERT INTO `interview` (`id`, `date`, `time`, `location`, `candidate_id`, `username`, `result`) VALUES
(7, '2018-07-23', '09:00:00', 'Boston Room, G floor, FT1', 1, 'cdn@gmail.com', ''),
(8, '2018-07-23', '10:00:00', 'Boston Room, G floor, FT1', 2, 'cdn@gmail.com', ''),
(9, '2018-07-30', '11:00:00', 'Boston Room, G floor, FT1', 3, 'cdn@gmail.com', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `major`
--

CREATE TABLE `major` (
  `id` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `major`
--

INSERT INTO `major` (`id`, `name`) VALUES
(1, 'An information system (IS) is an organized system for the collection, organization, storage and communication of information'),
(2, 'Software engineering is the application of engineering to the development of software in a systematic method');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `position`
--

CREATE TABLE `position` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `process` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `position`
--

INSERT INTO `position` (`id`, `name`, `process`, `quantity`) VALUES
(1, 'Quality Assurance', 2, 0),
(2, 'Software Developer', 3, 0),
(3, 'Web Developer', 2, 0),
(4, 'Web Design', 3, 0),
(5, 'Software Testing', 2, 0),
(6, 'Tester', 3, 0),
(7, 'Microsoft Azure Developer', 2, 0),
(8, 'Java Developer', 3, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `position_recruitment`
--

CREATE TABLE `position_recruitment` (
  `position_id` int(11) NOT NULL,
  `recruitment_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `salary` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `position_recruitment`
--

INSERT INTO `position_recruitment` (`position_id`, `recruitment_id`, `quantity`, `salary`) VALUES
(2, 1, 30, 6000000),
(2, 2, 5, 10000000),
(2, 6, 12, 0),
(3, 6, 8, 0),
(7, 5, 10, 0),
(8, 3, 10, 0),
(8, 6, 25, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `potential`
--

CREATE TABLE `potential` (
  `candidate_id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `potential`
--

INSERT INTO `potential` (`candidate_id`, `position_id`) VALUES
(2, 8),
(3, 8);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `recruitment`
--

CREATE TABLE `recruitment` (
  `id` int(11) NOT NULL,
  `title` varchar(250) COLLATE utf8_bin NOT NULL,
  `content` text COLLATE utf8_bin NOT NULL,
  `date_create` varchar(15) COLLATE utf8_bin NOT NULL,
  `date_end` varchar(15) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `recruitment`
--

INSERT INTO `recruitment` (`id`, `title`, `content`, `date_create`, `date_end`) VALUES
(1, 'Recruit Java and Ruby Fresher', 'Required:\n- College graduate or senior student\n- Have 2 years of experience', '2018-07-09', '2018-07-27'),
(2, 'Recruit Java and Ruby Developer', 'Required:\n- College graduate or senior student\n- experience required', '2018-05-10', '2018-07-27'),
(3, 'Java Developer', 'JOB DESCRIPTION:\n- Participate in the development of software systems according to the company\'s projects: Finance, banking, public finance, telecommunication, ERP.\n- Analysis customer requirements, design documentation and code, deploy solutions and unit tests;\n- Assist team members to accomplish tasks in the project;\n- Make reports and other requirements of Project Management.\n\nREQUEST:\n- 0 to 2 years of Java programming experience;\n- Graduated college / university, specialized training centers in information technology or related majors;\n- Knowledge of Java core, OOAD, design patterns;\n- Knowledge of Java / J2EE, Struts, Spring, Hibernate, Database (SQL, Oracle);\n- Knowledge of Web Service (SOAP and RESTful), build tools (Ant, Maven ...), load testing, profiling tools.\n\nRIGHT:\n- Salary negotiable when interviewing;\n- Earnings in the end of the year;\n- be considered for annual salary increase according to capacity;\n- Be involved in, learn with million-dollar projects, onsite / overseas work;\n- Participate in professional training courses;\n- Get 15 vacation days / year and public holidays as regulated;\n- Can buy FPT Care for yourself and families;\n- Annual teambuilding / vacation activities;\n- Have regular medical check-ups;\n- Get involved in cultural activities, interesting events of FPT Corporation.\n\nFILE:\n- The candidate will send 01 file CV into the mail box ngocttb12@fpt.com.vn\n- The name of the CV file and the email header will be the same as in the following format: Java_name_name and English name (Example: Java_HUST_1990_Nguyen Van A);\n- Note: Do not send compressed files, image files or scan certificates. Encourage the use of the Words format. If there is a portrait photo, please size down to 200 * 200;\n- Reference form (Optional) for tech candidates here: https://goo.gl/8Ed1dr\n\nNgười liên hệ:Tuyển dụng FPT IS\nEmail:Tuyendung-fis@fpt.com.vn\nĐiện thoại:024373007373 - 2043\nĐiện thoại di động:', '2018-07-20', '2018-08-15'),
(4, '5 Microsoft Azure Developer', 'JOB INFORMATION:\n- Learn and work in depth on Microsoft Azure\n- Support projects\n- Support Presales, participate and contribute in the bidding process\n- Make the programs of SOLAR\n- Report directly to the SOLAR monitoring unit\n\nREQUIRED CANDIDATE:\nJob information\n- Learn and work in depth on Microsoft Azure\n- Support projects\n- Support Presales, participate and contribute in the bidding process\n- Make the programs of SOLAR\n- Report directly to the SOLAR monitoring unit\n- Required candidate\n\nPRIORITIZE:\n- Have technical knowledge and understanding of latest technology trends (IoT, Big Data, Analytic)\n- Have experience building infrastructure, CICD and deploying DevOps on Azure\nExperienced in Digital Transformation Logistic\n\nBENEFIT:\n- EU Onsite Opportunity at your fingertips\n- Attractive salary\n- Work with a team of talented technology, creative and culture rich identity stico\n-Develop hard and soft skills through professional training and work\n- Opportunity to approach the latest technology trends\n- Opportunity to attend professional training courses, support the Microsoft Azure certification exam\n- The environment is young, dynamic, stico rich culture\n- State-owned insurance and FPT Care insurance for FPT employees\n\nHOW TO APPLY:\n- Send resume including: CV / Resume: Study summary, work experience, transcript, diploma, certificate (soft file)\n- Register directly at: https://career.fpt-software.com/en/freshers/\n\n- Or email to recruitment@fsoft.com.vn\nEmail subject: [MSAzure] _Name and Name\n\nHotline: 0969.125.248', '2018-02-09', '2018-08-15'),
(5, '10 Fresher Tester', 'JOB INFORMATION:\n- Opportunity to become a software tester after the training course at FPT Software.\n- Professional training program, drawn from the experience of working in large projects with large corporations in the world.\n- Local Learners: Roadmap builds on your own level and needs; Faculty members will follow and guide\n- Training allowance of 15,000,000 VND / course; support of machinery, equipment and learning materials\n\nJOB DESCRIPTION:\n- Take a 1-3 month intensive course;\n- Become official staff, participate in software development projects with the company\'s major customers after training.\n- Post-training activities include:\n- Open the test plan\n- Create and follow the plans, test cases\n- Observe errors during the test phase\n- Perform test and report back to management, customer\n- Place of work: FPT SOFTWARE HO CHI MINH\n\nJOB REQUIREMENTS\n- Have basic knowledge and desire to learn about test;\n- Ability to read and understand English well.\n- Have commitment and self motivation in work\n\nRIGHT\n- Training allowance up to 15,000,000 VND / lock;\n- After training will be re-evaluated capacity and wage agreement;\n- Have the opportunity to go onsite in Singapore, Malaysia, USA, Japan, Europe ...;\n- Use the company\'s services such as football pitch, transfer ball, tennis court, gym, yoga ...\n- Receive special remuneration packages of FPT Software when becoming official employees.\n- After 3 months training will be signed official contract with the company within 1 year\n\nCONTACT INFO:\n- Interested candidates please send CV / Resume to:\nRecruitment Department - FPT Software Training Center\nContact Person: Mac Thi Kim Chi\nPhone number: 0167 7162 741\nEmail: recruitment@fsoft.com.vn\nWebsite: https://career.fpt-software.com/freshers/', '2018-03-06', '2018-08-20'),
(6, '50 Developers', 'JOB DESCRIPTION:\n- Working in the big project, development system Machine Translation for FSOFT\n- Research and Develop new automation translation Platform\n- Develope java application with SWT on eclipse\n- Develope web aplication: spring boot, nodejs\n\nJOB QUALIFICATIONS:\nExperience:\n– +3, 4 years experience in any of the following programming languages/softwares Java, Python.\nEducation/Certification\n– Graduated from University or equivalent.\nRequired Skills, Knowledge and Characteristics:\nMust have:\n– Understanding of UI elements, APIs, Database interfaces etc.\n– Clear and articulate communication\n– Presentation skills, structured problem solving skills\nNice to have:\n– Experience on AKAMINDS  platforms such as Automation translate, cloud platforms, Machine Translation  is an advantage.\n– Good  in studying and understanding the existing system architechure.\n– Facilitates effective team interaction.\n– Acknowledges and appreciates each team member’s contributions.\n– Ability to work under pressure and to deadline\n\nBENEFITS:\n- “FPT care” health insurance provided by AON and is exclusive for FPT employees.\n- Company shuttle buses provide convenient way of transportation for all employees.\n- Annual Summer Vacation: follows company’s policy and starts from May every year\n- Salary review 2 times/year or on excellent performance\n- International, dynamic, friendly working environment\n- Annual leave, working conditions follow Vietnam labor laws.\n- Other allowances: lunch allowance, working on-site allowance, etc.\n- FPT Campus provides many facilities for FPT employees such as football ground, basketball & volleyball, gym room, Coffee Shop, etc.\n\nCONTACT                                                                                                                                                                 \nInterested please send your CV to:\n\nRecruiter room\nFPT Software Development Center\nContact Person: Ms. Nguyen Kieu Anh\nEmail: recruitment@fsoft.com.vn\nWebsite: www.career.fpt-software.com', '2018-10-10', '2018-08-15');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `skill`
--

CREATE TABLE `skill` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `skill`
--

INSERT INTO `skill` (`id`, `name`) VALUES
(1, 'Java'),
(2, 'C Sharp'),
(3, 'Servlet'),
(4, 'Ruby'),
(5, 'C'),
(6, 'SQL'),
(7, 'Microsoft Azure'),
(8, 'PHP'),
(9, 'JavaScript'),
(10, 'JSP');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `skill_candidate`
--

CREATE TABLE `skill_candidate` (
  `skill_id` int(11) NOT NULL,
  `candidate_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `skill_candidate`
--

INSERT INTO `skill_candidate` (`skill_id`, `candidate_id`) VALUES
(1, 1),
(1, 2),
(1, 4),
(2, 1),
(2, 3),
(2, 5),
(2, 6),
(2, 9),
(3, 1),
(3, 4),
(3, 6),
(3, 9),
(5, 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `skill_position`
--

CREATE TABLE `skill_position` (
  `position_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `skill_position`
--

INSERT INTO `skill_position` (`position_id`, `skill_id`) VALUES
(1, 2),
(1, 3),
(2, 3),
(2, 5),
(2, 10),
(3, 2),
(3, 4),
(3, 9),
(4, 1),
(4, 6),
(8, 1),
(8, 6);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `fullname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone` int(11) NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`username`, `role`, `password`, `fullname`, `phone`, `email`, `enabled`) VALUES
('minhkhoa', 'interviewer', '123456', 'khoa', 123456789, 'khoa@gmail.com', 0),
('Taimaddog', 'interviewee', '123456789', 'Tai cho dien', 987654321, 'taimaddog@gmail.com', 0),
('vanthieu', 'admin', '12345', 'le van thieu', 123456789, 'levanthieu97@gmail.com', 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `authorities`
--
ALTER TABLE `authorities`
  ADD UNIQUE KEY `ix_auth_username` (`username`,`authority`);

--
-- Chỉ mục cho bảng `candidate`
--
ALTER TABLE `candidate`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `entry_test`
--
ALTER TABLE `entry_test`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `interview`
--
ALTER TABLE `interview`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `major`
--
ALTER TABLE `major`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `position_recruitment`
--
ALTER TABLE `position_recruitment`
  ADD PRIMARY KEY (`position_id`,`recruitment_id`);

--
-- Chỉ mục cho bảng `potential`
--
ALTER TABLE `potential`
  ADD PRIMARY KEY (`candidate_id`,`position_id`);

--
-- Chỉ mục cho bảng `recruitment`
--
ALTER TABLE `recruitment`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `skill`
--
ALTER TABLE `skill`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `skill_candidate`
--
ALTER TABLE `skill_candidate`
  ADD PRIMARY KEY (`skill_id`,`candidate_id`);

--
-- Chỉ mục cho bảng `skill_position`
--
ALTER TABLE `skill_position`
  ADD PRIMARY KEY (`position_id`,`skill_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `candidate`
--
ALTER TABLE `candidate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT cho bảng `entry_test`
--
ALTER TABLE `entry_test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT cho bảng `interview`
--
ALTER TABLE `interview`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT cho bảng `major`
--
ALTER TABLE `major`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT cho bảng `position`
--
ALTER TABLE `position`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT cho bảng `recruitment`
--
ALTER TABLE `recruitment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT cho bảng `skill`
--
ALTER TABLE `skill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
