% page 8-9 powerpoint
% goal -> s(ναυτ).
s --> np, vp.
np --> ousiastiko(Koino, Fulo, Iso_aniso); katal(Katal).
vp --> ousiastiko(Koino, Fulo, Iso_aniso); ousiastiko(Koino, Fulo, Iso_aniso), np.
% gia na epistrepsw ton kwdiko katalixeis na ta spasw se duo katigorimata ta arsenika
ousiastiko(koino, arseniko, isoSulavo,
    (
        [[ναύτ, ναύτ],[ναύτ, ναυτ, ναύτ]], [παροξύτονη,παροξύτονη], [ης,ες], ousArs01);
        (koino, arseniko, isoSulavo, [[νικητ,νικητ],[νικητ,νικητ,νικητ]], [οξύτονη, οξύτονη], [ής,ές], ousArs02)
    ).
ousiastiko(koino, oudetero, anisoSulavo,
    [[κύμα, κύματ], [κύματ, κυμάτ, κύματ]],
    [παροξύτονη,παροξύτονη], [α,α],
    katal(katalOud02)).

ousiastiko(koino, oudetero, anisoSulavo,
    [[όνομα,ονόματ], [ονόματ,ονομάτ,ονόματ]],
    [προπαροξύτονη, προπαροξύτονη], [α,α], 
    katalOud02).

katal(ousArs01, arsenika-isosulava-se-is-xwris-tono, [ης,η,η,η],[ες,ών,ες,ες]).

katal(ousArs02, arsenika-isosulava-se-is-me-tono, [ής,ή,ή,ή],[ές,ών,ές,ές]).

katal(katalOud02, oudetero-anisosulava-se-a, [-,ος,-,-],[α,ων,α,α]).
