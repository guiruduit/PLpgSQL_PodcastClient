/* Return_Recomended_Episodes */

CREATE OR REPLACE FUNCTION PodcastClient.Return_Recomended_Episodes() RETURNS TRIGGER AS
$Return_Recomended_Episodes$
	DECLARE
		var_tag TEXT;
		var_episode TEXT;
	BEGIN
		FOR var_tag IN (SELECT DISTINCT PK_Tag FROM PodcastClient.Episode_Has_Tag WHERE PK_Episode_ID = NEW.PK_Episode_ID) LOOP
			FOR var_episode IN (SELECT DISTINCT PK_Episode_ID FROM PodcastClient.Episode_Has_Tag WHERE PK_Tag = var_tag) LOOP
				RAISE NOTICE '%', var_episode;
			END LOOP;
			RETURN NULL;
		END LOOP;
	END
$Return_Recomended_Episodes$
LANGUAGE plpgsql;

CREATE TRIGGER Return_Recomended_Episodes AFTER INSERT ON PodcastClient.User_Got_Episode
FOR EACH ROW EXECUTE PROCEDURE PodcastClient.Return_Recomended_Episodes();

/* Is_Episode_Repeated */

CREATE OR REPLACE FUNCTION PodcastClient.Is_Episode_Repeated() RETURNS TRIGGER AS
$Is_Episode_Repeated$
	DECLARE
	BEGIN
		IF (SELECT count(PK_Episode_ID) FROM PodcastClient.User_Got_Episode WHERE PK_Episode_ID = NEW.PK_Episode_ID AND PK_User_ID = NEW.PK_User_ID) THEN
			RAISE NOTICE 'Você já obteve esse episódio em outro momento';
		END IF;
		NEW.Aquisiton_Date := NOW();
		RETURN NEW;
	END
$Is_Episode_Repeated$
LANGUAGE plpgsql;

CREATE TRIGGER Is_Episode_Repeated BEFORE INSERT ON PodcastClient.User_Got_Episode
FOR EACH ROW EXECUTE PROCEDURE PodcastClient.Is_Episode_Repeated()

/* Create_Podcast_AndOr_PodcastOwner */

CREATE OR REPLACE FUNCTION PodcastClient.Create_Podcast_AndOr_PodcastOwner() RETURNS TRIGGER AS
$Create_Podcast_AndOr_PodcastOwner$
	DECLARE
	BEGIN
		IF ((SELECT count(PK_Podcaster_Name) FROM PodcastClient.Podcaster WHERE PK_Podcaster_Name = NEW.PK_Podcaster_Name) = 0) THEN
			INSERT INTO PodcastClient.Podcaster VALUES (NEW.PK_Podcaster_Name);
			RAISE NOTICE 'Podcaster: % criado', NEW.PK_Podcaster_Name;
		END IF;
		
		IF ((SELECT count(PK_Podcast_Name) FROM PodcastClient.Podcast WHERE PK_Podcast_Name = NEW.PK_Podcast_Name) = 0) THEN
			INSERT INTO PodcastClient.Podcast (PK_Podcast_Name) VALUES (NEW.PK_Podcast_Name);
			RAISE NOTICE 'Podcast: % criado', NEW.PK_Podcast_Name;
		END IF;
		
		RETURN NEW;
	END
$Create_Podcast_AndOr_PodcastOwner$
LANGUAGE plpgsql;

CREATE TRIGGER Create_Podcast_AndOr_PodcastOwner BEFORE INSERT ON PodcastClient.PodcastOwner
FOR EACH ROW EXECUTE PROCEDURE PodcastClient.Create_Podcast_AndOr_PodcastOwner()

/* Insert_Episode */
/* 
CREATE OR REPLACE FUNCTION PodcastClient.Insert_Episode_With_Tags(Episode_ID VARCHAR, Podcast_Name VARCHAR, URL VARCHAR, Duration_Time TIME, Tags VARCHAR[]) RETURNS void AS
$Insert_Episode_With_Tags$
	DECLARE
	BEGIN
		INSERT INTO PodcastClient.Episode VALUES (Episode_ID, Podcast_Name, URL, Duration_Time);
		FOR Tag IN Tags LOOP
			INSERT INTO PodcastClient.Tag VALUES (Tag);
			INSERT INTO PodcastClient.Episode_Has_Tag VALUES (Episode_ID, Tag);
		END LOOP;
	END
$Insert_Episode_With_Tags$
LANGUAGE plpgsql;
*/