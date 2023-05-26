:- dynamic(symptom/3).

% Knowledge Base
symptom(pneumonia, [vrachnada, pyretos, entonos_vixas, aimoptysi], 0.5).
symptom(pneumonia, [dyspnoia, kapnistis, pyretos, aimoptysi], 0.5).
symptom(karkinos_pneumona, [pneumonia, chasimo_varous, ponos_sto_stithos], 0.5).
symptom(karkinos_pneumona, [pneumonia, kapnistis, chasimo_varous], 0.5).
