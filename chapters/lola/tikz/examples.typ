// typst c examples.typ
// for i in {1..51}; do mutool clean -cggggls examples.pdf ../figures/examples/example_$i.pdf $i; done

#import "@preview/oxifmt:0.2.1": strfmt

#set page(width: auto, height: auto, margin: 0cm)

#set text(size: 6pt, weight: "light")
#set align(center + horizon)

#let sample = "0"

#let r(body) = rotate(-90deg, reflow: true, body)
#let c(body) = $scripts(div)_#body$
#let i(path) = image(path, height: 2cm)

#let a = 2cm / (1 * 256 + 2 * 8) * (3 * 256 + 4 * 8)
#let b = 2cm / (1 * 256 + 2 * 8) * (6 * 128 + 7 * 8)

#grid(
  columns: (1.25em, a, 1.25em, b),
  row-gutter: -0.05cm,
  r[Ground-truth], i("images/euler/euler_3_gt.png"),
  r[Ground-truth], i("images/rb/rb_3_gt.png"),
  r[Autoencoder #c(1280)], i("images/euler/euler_3_autoencoder_1280_0.png"),
  r[Autoencoder #c(256)], i("images/rb/rb_3_autoencoder_0256_0.png"),
  r[Diffusion #c(1280)], i("images/euler/euler_3_diffusion_1280_1.png"),
  r[Diffusion #c(256)], i("images/rb/rb_3_diffusion_0256_0.png"),
  r[Neural solver #c(1280)], i("images/euler/euler_3_neural solver_1280_0.png"),
  r[Neural solver #c(256)], i("images/rb/rb_3_neural solver_0256_0.png"),
  v(1.25em), grid(
    columns: (1fr, 1fr, 1fr),
    $tau = 20$,
    $tau = 60$,
    $tau = 100$,
  ),
  v(1.25em), grid(
    columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    $tau = 0$,
    $tau = 16$,
    $tau = 32$,
    $tau = 48$,
    $tau = 64$,
    $tau = 128$,
  )
)

#pagebreak()
#grid(
  columns: (1.25em, b, 1.25em, a),
  row-gutter: -0.05cm,
  block(
    height: 1fr,
    grid(
      columns: (auto),
      rows: (1fr, 1fr, 1fr, 1fr),
      r[Observation],
      r[Ground-truth],
      r[Guided diffusion #c(64)],
      r[Diffusion #c(64)],
    )
  ),
  image("images/rb/rb_guidance.png", width: b),
  block(
    height: 1fr,
    grid(
      columns: (auto),
      rows: (1fr, 1fr, 1fr),
      r[Observation],
      r[Ground-truth],
      r[Guided diffusion #c(48)],
      r[Diffusion #c(48)],
    )
  ),
  image("images/tgc/tgc_guidance.png", width: a),
  v(1.25em), grid(
    columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    $tau = 0$,
    $tau = 16$,
    $tau = 32$,
    $tau = 48$,
    $tau = 64$,
    $tau = 128$,
  ),
  v(1.25em), grid(
    columns: (1fr, 1fr, 1fr),
    $tau = 5$,
    $tau = 25$,
    $tau = 45$,
  )
)

#for traj in "2346" {
  [
    #pagebreak()
    #grid(
      columns: (1.25em, a),
      row-gutter: -0.05cm,
      r[Ground-truth], i(strfmt("images/euler/euler_{}_gt.png", traj)),
      r[Neural solver #c(1)], i(strfmt("images/euler/euler_{}_neural solver_0001_0.png", traj)),
      v(1.25em), grid(
        columns: (1fr, 1fr, 1fr),
        $tau = 20$,
        $tau = 60$,
        $tau = 100$,
      )
    )
  ]

  for compression in ("0080", "0320", "1280") [
    #pagebreak()
    #grid(
      columns: (1.25em, a),
      row-gutter: -0.05cm,
      r[Ground-truth], i(strfmt("images/euler/euler_{}_gt.png", traj)),
      r[Autoencoder #c(int(compression))], i(strfmt("images/euler/euler_{}_autoencoder_{}_0.png", traj, compression)),
      r[Diffusion #c(int(compression))], i(strfmt("images/euler/euler_{}_diffusion_{}_0.png", traj, compression)),
      r[Diffusion #c(int(compression))], i(strfmt("images/euler/euler_{}_diffusion_{}_1.png", traj, compression)),
      r[Neural solver #c(int(compression))], i(strfmt("images/euler/euler_{}_neural solver_{}_0.png", traj, compression)),
      v(1.25em), grid(
        columns: (1fr, 1fr, 1fr),
        $tau = 20$,
        $tau = 60$,
        $tau = 100$,
      )
    )
  ]
}

#for traj in "1356" {
  [
    #pagebreak()
    #grid(
      columns: (1.25em, b),
      row-gutter: -0.05cm,
      r[Ground-truth], i(strfmt("images/rb/rb_{}_gt.png", traj)),
      r[Neural solver #c(1)], i(strfmt("images/rb/rb_{}_neural solver_0001_0.png", traj)),
      v(1.25em), grid(
        columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        $tau = 0$,
        $tau = 16$,
        $tau = 32$,
        $tau = 48$,
        $tau = 64$,
        $tau = 128$,
      )
    )
  ]

  for compression in ("0064", "0256", "1024") [
    #pagebreak()
    #grid(
      columns: (1.25em, b),
      row-gutter: -0.05cm,
      r[Ground-truth], i(strfmt("images/rb/rb_{}_gt.png", traj)),
      r[Autoencoder #c(int(compression))], i(strfmt("images/rb/rb_{}_autoencoder_{}_0.png", traj, compression)),
      r[Diffusion #c(int(compression))], i(strfmt("images/rb/rb_{}_diffusion_{}_0.png", traj, compression)),
      r[Diffusion #c(int(compression))], i(strfmt("images/rb/rb_{}_diffusion_{}_1.png", traj, compression)),
      r[Neural solver #c(int(compression))], i(strfmt("images/rb/rb_{}_neural solver_{}_0.png", traj, compression)),
      v(1.25em), grid(
        columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        $tau = 0$,
        $tau = 16$,
        $tau = 32$,
        $tau = 48$,
        $tau = 64$,
        $tau = 128$,
      )
    )
  ]
}

#for traj in "1346" {
  [
    #pagebreak()
    #box("empty")
  ]

  for compression in ("0048", "0192", "0768") [
    #pagebreak()
    #grid(
      columns: (1.25em, a),
      row-gutter: -0.05cm,
      r[Ground-truth], i(strfmt("images/tgc/tgc_{}_gt.png", traj)),
      r[Autoencoder #c(int(compression))], i(strfmt("images/tgc/tgc_{}_autoencoder_{}_0.png", traj, compression)),
      r[Diffusion #c(int(compression))], i(strfmt("images/tgc/tgc_{}_diffusion_{}_0.png", traj, compression)),
      r[Diffusion #c(int(compression))], i(strfmt("images/tgc/tgc_{}_diffusion_{}_1.png", traj, compression)),
      r[Neural solver #c(int(compression))], i(strfmt("images/tgc/tgc_{}_neural solver_{}_0.png", traj, compression)),
      v(1.25em), grid(
        columns: (1fr, 1fr, 1fr),
        $tau = 5$,
        $tau = 25$,
        $tau = 45$,
      )
    )
  ]
}

#let aa = 2cm / (1 * 256 + 2 * 8) * (4 * 256 + 5 * 8)

#pagebreak()
#grid(
  columns: (1.25em, aa),
  row-gutter: -0.05cm,
  block(
    height: 1fr,
    grid(
      columns: (auto),
      rows: (1fr, 1fr, 1fr, 1fr, 1fr),
      r[$gamma = 1.2$],
      r[$gamma = 1.3$],
      r[$gamma = 1.4$],
      r[$gamma = 1.5$],
      r[$gamma = 1.6$],
    )
  ),
  image("images/euler/euler_theta_151525.png", width: aa),
  v(1.25em), grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    $tau = 4$,
    $tau = 20$,
    $tau = 60$,
    $tau = 100$,
  )
)
