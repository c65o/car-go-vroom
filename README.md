Racerbils neuro evolution – “normal” opgaven
Opgave: Lav et program, der træner en autonom racerbil så den er i stand til at køre en omgang på kortest tid som muligt m. udleveret kode.

Til den allerede udleveret kode har jeg lavet en ny klasse, der hedder ”raceAlgoritme”, her skriver man alt det primære kode. 
For at ”parre” bilerne skal man parre deres system, hvilket er deres neutralnetværk. Til det har de en arraylist, som hedder ”weights”. For at parre dem er der lavet en forloop, som går igennem den ene liste. Derefter skal der gives nye værdier til ”newWeights” med en if statement, som tager tilfældigt for de to forældre. Man gemmer forældrene i en arrayliste. Den nye generation er de børn, der bliver til af forældrene. Da vi skal lave mange børn bruger vi et for loop til det.
