# Generative Modeling in Large-scale Dynamical Systems

This repository contains the TeX source for [my PhD dissertation](main.pdf), defended on the 16th of January 2026.

#### Abstract

To understand nature is, in part, to predict how it evolves. However, prediction is inherently limited by the uncertainty present in models, states, and observations. Rather than concealing this uncertainty, probabilistic modeling embraces it to produce predictions that are scientifically trustworthy and actionable. This thesis investigates how generative models, notably diffusion models, can serve as probabilistic backbones for large-scale inference problems in physics, particularly in systems whose state evolves with time, known as dynamical systems. We explore, through a series of peer-reviewed publications, multiple facets of probabilistic modeling and dynamical systems, including state estimation, forecasting, reduced-order modeling, and learning from corrupted observations. Our work establishes diffusion models as a promising alternative to classical inference methods and demonstrates that generative models can replicate, discover, and abstract the dynamics of our universe, solely from data.

#### Citation

If you find my work or this template useful, please consider citing

```bib
@phdthesis{rozet2026generative,
  title={Generative Modeling in Large-scale Dynamical Systems},
  author={Rozet, François},
  year=2026,
  school={University of Liege, Belgium},
  url={https://orbi.uliege.be/handle/2268/337979},
}
```

#### Compile

To reproduce the PDF manuscript, run

```console
$ . ./compress-figures.sh
$ pdflatex main.tex
$ biber main
$ pdflatex main.tex
```
