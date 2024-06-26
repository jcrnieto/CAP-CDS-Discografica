namespace sap.capire.discografica; 

entity Artist {
   Key ID: Integer;
    name : String;
    discs: Composition of many Disc on discs.artist = $self;
    genders: Association to Genders;
    age: Integer;
}

entity Disc {
   Key ID: Integer;
    name : String;
    artist: Association to Artist ;
    discSong:  Composition of many DiscSong on discSong.disc = $self;
    age: Integer;
}

entity Song {
     Key ID: Integer;
     name: String;
     songDisc: Composition of many DiscSong on songDisc.song = $self;
     duration: Integer;
}

entity DiscSong {
   key disc: Association to Disc;
   key song: Association to Song;
}

entity Genders {
   Key ID: Integer;
   descriptionGenders : String;
   status:Boolean default true
}