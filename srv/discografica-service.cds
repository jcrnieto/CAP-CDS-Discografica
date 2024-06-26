using { sap.capire.discografica as my } from '../db/schema';

service discographyService { 
  entity Artist as projection on my.Artist{ 
    *,
    genders.descriptionGenders as genero
  };
  entity Disc as projection on my.Disc;
  entity Song as projection on my.Song;
  entity Genders as projection on my.Genders;
  entity discSong as projection on my.DiscSong{
    *,
    disc.name as nombreDisco   
  };
} 