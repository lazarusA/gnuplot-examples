import { defineConfig } from 'vitepress'
import { tabsMarkdownPlugin } from 'vitepress-plugin-tabs'

// https://vitepress.dev/reference/site-config
export default defineConfig({
  base: '/gnuplot-examples/',
  title: "Gnuplot.jl examples",
  description: "A gallery collection",
  lastUpdated: true,
  cleanUrls: true,
  
  markdown: {
    config(md) {
      md.use(tabsMarkdownPlugin)
    },
    theme: {
      light: "github-light",
      dark: "github-dark"}
  },
  themeConfig: {
    // https://vitepress.dev/reference/default-theme-config
    logo: { src: '/logo.png', width: 48, height: 24 },
    search: {
      provider: 'local'
    },
    nav: [
      { text: 'Home', link: '/' },
      { text: 'Pkgs Versions', link: '/examples/pkgs_versions' },
      { text: '2D', 
      items: [
        { text: 'Lines', link: '/examples/2d/lines/line' },
        { text: 'Scatters', link: '/examples/2d/scatters/scatter' },
        { text: 'Filled Curves', link: '/examples/2d/filledcu/filled' },
        { text: 'Heatmaps', link: '/examples/2d/heatmaps/heatmap' },
        { text: 'Contours', link: '/examples/2d/contours/contour' },
      ]
      },
      { text: '3D', 
      items: [
        { text: 'Surfaces', link: '/examples/3d/surfaces/torus' },
        { text: 'Wires', link: '/examples/3d/wires/torus' }
      ]
      },
      ],
      sidebar: {
        // This sidebar gets displayed when a user
        // is on `guide` directory.
        '/examples/2d/': [
          {
            text: '2D',
            items: [
              {
                text: 'lines',
                collapsed: true,
                items: [
                  { text: 'line', link: '/examples/2d/lines/line' },
                  { text: 'two_lines', link: '/examples/2d/lines/two_lines' },
                  { text: 'line_type', link: '/examples/2d/lines/line_type' },
                  { text: 'line_types', link: '/examples/2d/lines/line_types' },
                  { text: 'line_cb', link: '/examples/2d/lines/line_cb' },
                  { text: 'log scales', link: '/examples/2d/lines/log_scales' },
                  { text: 'dates', link: '/examples/2d/lines/dates' },
                  { text: 'dates_break2_axis', link: '/examples/2d/lines/dates_break2_axis' },
                  { text: 'dates_break3_axis', link: '/examples/2d/lines/dates_break3_axis' }
                ],
              },
              {
                text: 'scatters',
                collapsed: true,
                items: [
                  { text: 'scatter', link: '/examples/2d/scatters/scatter' },
                  { text: 'scatter_line', link: '/examples/2d/scatters/scatter_line' },
                  { text: 'scatter_line_markers', link: '/examples/2d/scatters/scatter_line_markers' },
                ],
              },
              {
                text: 'Filled Curves',
                collapsed: true,
                items: [
                  { text: 'filled', link: '/examples/2d/filledcu/filled' },
                  { text: 'between', link: '/examples/2d/filledcu/between' },
                  { text: 'glow', link: '/examples/2d/filledcu/glow' },
                ],
              },
              {
                text: 'Contours',
                collapsed: true,
                items: [
                  { text: 'contour', link: '/examples/2d/contours/contour' },
                  { text: 'contour_egg', link: '/examples/2d/contours/contour_egg' },
                ],
              },
            ]
          }
        ],
  
        // This sidebar gets displayed when a user
        // is on `config` directory.
        '/examples/3d/': [
          {
            text: '3D',
            items: [
              {
                text: 'surfaces',
                collapsed: true,
                items: [
                  { text: 'torus', link: '/examples/3d/surfaces/torus' },
                  { text: 'torus_depth_sorting1', link: '/examples/3d/surfaces/torus_depth_sorting1' },
                  { text: 'torus_depth_sorting', link: '/examples/3d/surfaces/torus_depth_sorting' },
                  { text: 'sphere', link: '/examples/3d/surfaces/sphere' },
                  { text: 'sombrero', link: '/examples/3d/surfaces/sombrero' },
                  { text: 'tube', link: '/examples/3d/surfaces/tube' },

                ],
              },
              {
                text: 'wires',
                collapsed: true,
                items: [
                  { text: 'torus', link: '/examples/3d/wires/torus' },
                  { text: 'sphere', link: '/examples/3d/wires/sphere' },
                  { text: 'sombrero', link: '/examples/3d/wires/sombrero' },
                  { text: 'tube', link: '/examples/3d/wires/tube' },
                ],
              },
            ]
          }

        ]
      },
    socialLinks: [
      { icon: 'linkedin', link: 'https://www.linkedin.com/in/lazaro-alonso/' },
      { icon: 'github', link: 'https://github.com/lazarusA/gnuplot-examples' },
      { icon: 'mastodon', link: 'https://julialang.social/@LazaroAlonso' },
      { icon: 'twitter', link: 'https://twitter.com/LazarusAlon' }
    ],
    footer: {
      message: 'Made with <a href="https://vitepress.dev" target="_blank"><strong>VitePress</strong></a>, <a href="https://documenter.juliadocs.org/stable/" target="_blank">Documenter.jl</a> & <a href="https://fredrikekre.github.io/Literate.jl/v2/" target="_blank">Literate.jl</a> <br> Released under the MIT License. Powered by the <a href="https://julialang.org" target="_blank">Julia Programming Language.</a>',
      copyright: '© Copyright 2023 <strong>Lazaro Alonso</strong>'
    }
  }
})
