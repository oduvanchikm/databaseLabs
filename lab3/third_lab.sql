create table Artierts (
	ArtiertID int primary key,
	ArtietName text not null,
	DatesOfLife date
);

create table Galleries (
	GalleryID int primary key,
	Address text not null,
	ContactInfo text
);

create table Visitors (
	VisitorID int primary key,
	VisitorName text not null,
	VisitorAge int not null,
	Cintactinfo text not null
)

create table ArtObjects (
	ArtObjectID int primary key,
	ArtiertID int,
	GalleryID int,
	Name text not null,
	Description text not null,
	foreign key (ArtiertID) references Artierts(ArtiertID),
	foreign key (GalleryID) references Galleries(GalleryID)
);

create table Tours (
	TourID int primary key,
	TourName text not null,
	TourDate date not null,
	Quantity int,
	GalleryID int,
	foreign key (GalleryID) references Galleries(GalleryID)
);

create table Visits (
	VisitID int primary key,
	GalleryID int,
	VisitorID int,
	VisitDate date not null,
	foreign key (GalleryID) references Galleries(GalleryID),
	foreign key (VisitorID) references Visitors(VisitorID)
);
