# com.ojemedia.pdf69

A DITA-OT plugin that provides a clean, modern 6"x9" layout
for technical books.
Goals are:

*  Simple and easy to maintain as possible
*  Works well with Lightweight DITA (LwDITA)
*  Compatibility with KDP/CreateSpace and other print on demand (PoD) services
*  Improved header configuration and control
*  Easy customization

## Installing

Clone the repository, then copy it into the `plugins` directory
of your DITA-OT installation.
To try it out:

    dita --input=yourmap.ditamap --format=pdf69

## Customizing

To get started:

*  Replace `cfg/common/artwork/logo.png` with your own logo.
*  Edit `cfg/common/vars/en.xml` to customize headers and other auto-generated text.
   Contributed translations would be much appreciated!
*  Edit `cfg/fo/font-mappings.xml`, if desired, to change the fonts.
   The default fonts are [Noto Serif](https://fonts.google.com/specimen/Noto+Serif),
   and [Anka/Coder Narrow](https://fontlibrary.org/en/font/anka-coder-narrow).
   Both have open-source licenses.

To gain further control, edit the XSL files in `cfg/fo/attrs`
and `cfg/fo/xsl`.

## Contributing

Bugfixes are always welcome.
Enhancements will be evaluated against the goals above,
and incorporated whenever possible.
Localizations will be received with gratitude.
