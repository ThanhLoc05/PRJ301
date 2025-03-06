/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  acer
 * Created: Mar 6, 2025
 */

CREATE TABLE tblStartupProjects(
	project_id INT PRIMARY KEY,
	project_name varchar(100) not null,
	Description text,
	Status varchar(20) not null,
	estimate_launch DATE not null,
);

INSERT INTO tblStartupProjects (project_id, project_name, Description, Status, estimate_launch) VALUES
(1, 'AI-Powered Chatbot', 'A chatbot using AI to enhance customer support.', 'Ideation', '2025-06-15'),
(2, 'Smart Home Automation', 'A project focused on IoT-based home automation systems.', 'Development', '2025-09-01'),
(3, 'E-Learning Platform', 'An online education platform with interactive courses.', 'Launch', '2024-12-10'),
(4, 'Blockchain Payment System', 'A secure and decentralized payment processing system.', 'Scalling', '2025-08-20');