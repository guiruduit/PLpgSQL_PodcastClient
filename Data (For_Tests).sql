INSERT INTO PodcastClient.Subject VALUES ('Tecnologia'), ('Variedades');

INSERT INTO PodcastClient.Podcast VALUES
	('Guanacast', ''),
	('Baguete', 'http://www.baguete.com.br/rss/noticias/feed'),
	('Jovem Nerd', '');
	
INSERT INTO PodcastClient.Episode (PK_Episode_ID, FK_Podcast_Name) VALUES
	('82, Noticias Semanais', 'Guanacast'),
	('81, S�rie Hardware: Placa M�e', 'Guanacast'),
	('80, Verdade ou Mentira? Parte III', 'Guanacast'),
	('79, Como Funciona? Parte VI', 'Guanacast'),
	('78, Ao Vivo UaiSEO', 'Guanacast'),
	('77, Conhe�a a Kingo Labs', 'Guanacast'),
	('76, Para que serve o Twitter', 'Guanacast'),
	('75, Tudo sobre o Apple IPad', 'Guanacast'),
	('74, T�cnicas de SEO Parte IV', 'Guanacast'),
	('73, T�cnicas de SEO Parte III', 'Guanacast'),
	('72, Empreendedorismo com Sw Livre', 'Guanacast'),
	('71, Guia do Windows 7', 'Guanacast'),
	('70, Videolog TV', 'Guanacast'),
	('69, Cobertura DevinRio 2009', 'Guanacast'),
	('68b, Noticias da Semana', 'Guanacast'),
	('68, Software Livre e C�digo Aberto', 'Guanacast'),
	('67, Profiss�o: Programador', 'Guanacast'),
	('66b, Saiba tudo sobre CMS Parte II', 'Guanacast'),
	('66a, Saiba tudo sobre CMS Parte I', 'Guanacast');

INSERT INTO PodcastClient.Episode (PK_Episode_ID, FK_Podcast_Name) VALUES
	('Parad�o, ativar!', 'Baguete'),
	('Cisco, arroz e TTs no Parad�o do Baguete', 'Baguete'),
	('Hora do Parad�o!', 'Baguete'),
	('E t� a� o Parad�o!', 'Baguete'),
	('� ele! O Parad�o!', 'Baguete'),
	('Parad�o no ar!', 'Baguete'),
	('Chegou o Parad�o!', 'Baguete'),
	('Amor, sexo, Burger King... � o Parad�o!', 'Baguete'),
	('Sobe o som: t� no ar o Parad�o!', 'Baguete'),
	('J� pode comemorar: chegou o Parad�o', 'Baguete'),
	('Parad�o do Baguete!', 'Baguete'),
	('Veste o jeans amarelo, ta� a familia Parad�o', 'Baguete'),
	('Parad�o... Agora vai!', 'Baguete'),
	('Olha o Parad�o', 'Baguete');
	
INSERT INTO PodcastClient.Tag VALUES
	('Noticias', 'Tecnologia'),
	('Hardware', 'Tecnologia'), ('Placa M�e', 'Tecnologia'),
	('Verdade', 'Tecnologia'), ('Mentira', 'Tecnologia'),
	('Funciona', 'Tecnologia'),
	('SEO', 'Tecnologia'),
	('Kingo Labs', 'Tecnologia'), ('Migre.me', 'Tecnologia'),
	('Twitter', 'Tecnologia'),
	('IPad', 'Tecnologia'),
	('Empreendedorismo', 'Tecnologia'), ('Software Livre', 'Tecnologia'),
	('Windows', 'Tecnologia'), ('Seven', 'Tecnologia'),
	('Videolog', 'Tecnologia'),
	('DevinRio', 'Tecnologia'),
	('Freeware', 'Tecnologia'), ('C�digo Aberto', 'Tecnologia'),
	('Profiss�o', 'Tecnologia'), ('Programador', 'Tecnologia'),
	('CMS', 'Tecnologia');
	
INSERT INTO PodcastClient.Episode_Has_Tag VALUES
	('Noticias', '82, Noticias Semanais'),
	('Hardware', '81, S�rie Hardware: Placa M�e'),
	('Verdade', '80, Verdade ou Mentira? Parte III'), ('Mentira', '80, Verdade ou Mentira? Parte III'),
	('Funciona', '79, Como Funciona? Parte VI'),
	('SEO', '78, Ao Vivo UaiSEO'),
	('Kingo Labs', '77, Conhe�a a Kingo Labs'), ('Migre.me', '77, Conhe�a a Kingo Labs'),
	('Twitter', '76, Para que serve o Twitter'),
	('IPad', '75, Tudo sobre o Apple IPad'),
	('SEO', '74, T�cnicas de SEO Parte IV'),
	('SEO', '73, T�cnicas de SEO Parte III'),
	('Empreendedorismo', '72, Empreendedorismo com Sw Livre'), ('Software Livre', '72, Empreendedorismo com Sw Livre'),
	('Windows', '71, Guia do Windows 7'), ('Seven', '71, Guia do Windows 7'),
	('Videolog', '70, Videolog TV'),
	('DevinRio', '69, Cobertura DevinRio 2009'),
	('Noticias', '68b, Noticias da Semana'),
	('Freeware', '68, Software Livre e C�digo Aberto'), ('C�digo Aberto', '68, Software Livre e C�digo Aberto'),
	('Programador', '67, Profiss�o: Programador'),
	('CMS', '66b, Saiba tudo sobre CMS Parte II'),
	('CMS', '66a, Saiba tudo sobre CMS Parte I');
	
INSERT INTO PodcastClient.Podcaster VALUES ('Gustavo Guanabara');

INSERT INTO PodcastClient.PodcastOwner VALUES ('Gustavo Guanabara', 'Guanacast');
INSERT INTO PodcastClient.PodcastOwner VALUES ('Eduardo Reporter', 'Jornal Podcast');

INSERT INTO PodcastClient.User VALUES
	('bruno', 'Bruno'),
	('camila', 'Camila');

INSERT INTO PodcastClient.User VALUES ('luis', 'Luis');

INSERT INTO PodcastClient.User_Got_Episode (PK_User_ID, PK_Episode_ID) VALUES ('bruno', '66a, Saiba tudo sobre CMS Parte I');
INSERT INTO PodcastClient.User_Got_Episode (PK_User_ID, PK_Episode_ID) VALUES ('bruno', '76, Para que serve o Twitter');