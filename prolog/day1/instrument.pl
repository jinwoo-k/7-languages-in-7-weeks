instrument(piano, seonyoung).
instrument(ukulele, jinwoo).
instrument(flute, sunmi).
instrument(castanet, shinhyun).
instrument(guitar, alfred).

genre(piano, classic).
genre(ukulele, jazz).
genre(flute, classic).
genre(castanet, etc).

whoGenre(X, Y) :- instrument(Z, X), genre(Z, Y).