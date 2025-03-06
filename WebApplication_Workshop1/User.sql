/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  acer
 * Created: Mar 6, 2025
 */
CREATE DATABASE prj_1820_ws1
GO

use prj_1820_ws1
GO



CREATE TABLE tblUsers(
	userName varchar(50) PRIMARY KEY,
	name varchar(100) not null,
	password varchar(255) not null,
	role varchar(20) not null,
);
GO

INSERT INTO tblUsers(userName, name, password, role) VALUES
('founder001', N'Erwin','founder123', 'Founder'),
('member001', N'Levi', 'member123', 'Team Member'),
('member002', N'Hange', 'member456', 'Team Member'),
('member003', N'Mike', 'member789', 'Team Member');
GO
