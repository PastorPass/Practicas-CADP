{ 11. El colectivo de fotógrafos ArgenPics desea conocer los gustos de sus seguidores en las redes sociales. Para
ello, para cada una de las 200 fotos publicadas en su página de Facebook, cuenta con la siguiente
información: título de la foto, el autor de la foto, cantidad de Me gusta, cantidad de clics y cantidad de
comentarios de usuarios. Realizar un programa que lea y almacene esta información. Una vez finalizada la
lectura, el programa debe procesar los datos e informar:
a) Título de la foto más vista (la que posee mayor cantidad de clics).
b) Cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotógrafo “Art Vandelay”.
c) Cantidad de comentarios recibidos para cada una de las fotos publicadas en esa página  }
Program uno;
const
  dimF = 4;  // valor original 200
type
  rango = 1..dimF;
  foto = record
            titFoto : string;
            autorFoto : string;
            cantLikes : integer;
            cantClicks : integer;
            cantComentarios : integer;
         end;

  vectorFotos = array[rango] of foto;
// Procesos - Funciones

Procedure LeerFoto(var f : foto);
Begin
  with f do begin
    writeln('ingrese titulo de la foto');
    readln(titFoto);
    writeln('ingrese autor de la foto');
    readln(autorFoto);
    writeln('ingrese cantidad de me "gusta" en la foto');
    readln(cantLikes);
    writeln('ingrese cantidad de clics en la foto');
    readln(cantClicks);
    writeln('ingrese cantidad de comentarios en la foto');
    readln(cantComentarios);
  end;
End;

Procedure CargarVectorFotos(var vec : vectorFotos);
var
  i : rango;
  f : foto;
Begin
  for i := 1 to dimF do begin
    LeerFoto(f);
    vec[i] := f;
  end;
End;

Procedure UnMaximo (UntitFoto : string; unosClicks : integer; var max : integer; var titMax : string);
Begin
  if (unosClicks > max) then begin
    max := unosClicks;
    titMax := UntitFoto;
  end;
End;

Function EsVandelay (unAutorFoto : string) : boolean;
Begin
  EsVandelay := (unAutorFoto = 'art vandelay');
End;

Procedure RecorrerVectorEInformar(vec : vectorFotos);
var
  i : rango;
  max,TotalLikes : integer;
  titMax : string;
Begin
  max := -1;
  TotalLikes := 0;
  titMax := ' ';
  for i := 1 to dimF do begin
    UnMaximo(vec[i].titFoto,vec[i].cantClicks,max,titMax);  // inciso a)
    if (EsVandelay(vec[i].autorFoto)) then  // inciso b)
      TotalLikes := TotalLikes + vec[i].cantLikes;
    writeln('------Informe foto Nro : ' , i , '-------');  // informe inciso c)
    writeln('Cantidad de comentarios recibidos = ' , vec[i].cantComentarios);  // inciso c)
  end;
  writeln('----------INFORME GENERAL---------');
  writeln('Título de la foto más vista = ' , titMax , ' cantidad de clics = ' , max);  // informe inciso a)
  writeln('Cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotógrafo “Art Vandelay” = ' , TotalLikes); // informe inciso b)
End;

// P.P
VAR
  vec : vectorFotos;
BEGIN
  CargarVectorFotos(vec);
  RecorrerVectorEInformar(vec);
END.