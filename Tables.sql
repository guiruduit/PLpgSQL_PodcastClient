CREATE SCHEMA PodcastClient;

CREATE TABLE PodcastClient.Subject (
	PK_Subject_Name 
		VARCHAR (60)
		NOT NULL
        PRIMARY KEY
);

CREATE TABLE PodcastClient.Podcast (
	PK_Podcast_Name
		VARCHAR (100)
        PRIMARY KEY
		NOT NULL,
	URL_Feader
		VARCHAR (200)
);

CREATE TABLE PodcastClient.Episode (
	PK_Episode_ID
		VARCHAR (200)
		NOT NULL
		PRIMARY KEY,
	FK_Podcast_Name
		VARCHAR (100)
		REFERENCES PodcastClient.Podcast (PK_Podcast_Name),
	URL
		VARCHAR (300),
	Duration_Time
		TIME
);

CREATE TABLE PodcastClient.Tag (
	PK_Tag
		VARCHAR (40)
		PRIMARY KEY
		NOT NULL,
	FK_Subject_Name
		VARCHAR (60)
		REFERENCES PodcastClient.Subject (PK_Subject_Name)
);

CREATE TABLE PodcastClient.Episode_Has_Tag (
	PK_Tag
		VARCHAR (40)
		REFERENCES PodcastClient.Tag (PK_Tag),
	PK_Episode_ID
		VARCHAR (200)
		REFERENCES PodcastClient.Episode (PK_Episode_ID),
	PRIMARY KEY (PK_Tag, PK_Episode_ID)
);

CREATE TABLE PodcastClient.Podcaster (
	PK_Podcaster_Name
		VARCHAR (100)
		PRIMARY KEY
		NOT NULL
);

CREATE TABLE PodcastClient.PodcastOwner (
	PK_Podcaster_Name
		VARCHAR (100)
		REFERENCES PodcastClient.Podcaster (PK_Podcaster_Name),
	PK_Podcast_Name
		VARCHAR (100)
		REFERENCES PodcastClient.Podcast (PK_Podcast_Name),
	PRIMARY KEY (PK_Podcaster_Name, PK_Podcast_Name)
);

CREATE TABLE PodcastClient.EpisodeGuest (
	PK_Podcaster_Name
		VARCHAR (100)
		REFERENCES PodcastClient.Podcaster (PK_Podcaster_Name),
	PK_Episode_ID
		VARCHAR (200)
		REFERENCES PodcastClient.Episode (PK_Episode_ID),
	PRIMARY KEY (PK_Podcaster_Name, PK_Episode_ID)
);

CREATE TABLE PodcastClient.User (
	PK_User_ID
		VARCHAR (60)
        PRIMARY KEY
		NOT NULL,
	User_Name
		VARCHAR (100)
);

CREATE TABLE PodcastClient.User_Got_Episode (
	PK_User_ID
		VARCHAR (60)
		REFERENCES PodcastClient.User (PK_User_ID),
	PK_Episode_ID
		VARCHAR (200)
		REFERENCES PodcastClient.Episode (PK_Episode_ID),
	PRIMARY KEY (PK_User_ID, PK_Episode_ID),
	Aquisition_Date
		DATE
);