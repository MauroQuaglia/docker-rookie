# Le bridge del Docker Host
* Dal container posso vedere il Docker Host o tramite l'IP del gateway della rete bridge o tramite la definizione dell'extra_hosts.
* Anche dal Docker Host posso vedere  il container per IP: curl http://10.45.0.194:80 (dove 10.45.0.194 è l'IP del container) 