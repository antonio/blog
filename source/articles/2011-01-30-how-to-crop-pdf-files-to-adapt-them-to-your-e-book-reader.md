---
date: '2011-01-30 20:53:15'
layout: post
slug: how-to-crop-pdf-files-to-adapt-them-to-your-e-book-reader
status: publish
title: How to crop pdf files to adapt them to your e-book reader
comments: true
categories:
- ebooks
- reading
---

I have owned a [Sony PRS-600 e-book reader device](http://www.sonystyle.com/webapp/wcs/stores/servlet/ProductDisplay?storeId=10151&catalogId=10551&langId=-1&productId=8198552921665921192) for a year or so. Despite its high price at the time of buying it (nowadays, I would buy [an Amazon Kindle](http://www.amazon.com/Kindle-Wireless-Reader-Wifi-Graphite/dp/B003DZ1Y8Q/) with my eyes closed), I find it worth every single euro it cost, and we are talking about 300 of those. My library, which is managed by [Calibre](http://calibre-ebook.com/) has grown to a number of thousands of books, which is way more than what a person can read in a lifetime.

One little thing has been bugging me, though. Reading pdf files with a 6'' reader is far from pleasant, mainly because the reader adapts the size of the page so that it fits the screen completely. The problem with this is that a book page is usually bigger than 6'', so you end with a really small font size. I wouldn't read more than maybe 10 pages in this way.

Every single reader has an option to increase the text size. Usually, this is not a valid option with pdf files as you will probably get a lot of line unwrapping, unformatted text and images located where they shouldn't be, not to talk of headers and footers merging with the actual contents of the book, leaving to the reader the task of automatically ignoring them while reading. Long story short, don't do that.

Changing the orientation to landscape does indeed work, at least in my reader, and I have read several pdf books (mostly technical) this way. Still, the problem persists, although at a much less critical level. There is a lot of unused space in margins (around 15-20% per page from my experience).

My take on this last problem is cropping the pdf so that it has no margins. That wouldn't look nice in a printed version, but maximizing the reading area in the device is definitely the way to go.

First I tried to use [this Perl script](http://www.ctan.org/tex-archive/help/Catalogue/entries/pdfcrop.html) to get the job done, but the results were not what I expected: it takes a long time and stresses the CPU a lot, the output file is much bigger than the original and the headers and footers (including the page number) are not removed in the automatic mode so you'll have to specify how much to crop, taking into account that most of the pdf books I own have different margins for odd and even pages.

Googling for an alternative I found [PDF-Shuffler](http://sourceforge.net/projects/pdfshuffler/). Quoting from its website:


> PDF-Shuffler is a small python-gtk application, which helps the user to merge or split pdf documents and rotate, crop and rearrange their pages using an interactive and intuitive graphical interface. It is a frontend for python-pyPdf.


The advantages over the first option are speed and the output file being similar in size (or even smaller) to the original one. On the other hand, it has no automatic mode and you have to specify the top, left, right and bottom margins. As an extra feature, you can use PDF-Shuffler to remove pages. I usually remove the portrait, index and the introductory text.

So far, I have been using PDF-Shuffler to crop my books. That was until, via [@ampajaro on Twitter](http://twitter.com/#!/ampajaro) I got to know Briss.

[Briss](http://sourceforge.net/projects/briss/) is a cross-platform application written in Java that scans all pages in the pdf and overlays them graphically on top of each other so that you can easily select the optimal cropping size and apply the transformation. It goes a step forward, as the overlaid pages are grouped in even and odd pages, making it even easier to optimize the cropping. The results are more than satisfactory, the output file being the smaller of all the mentioned alternatives. And generated faster, too.

In the end, what I'm doing is removing the unnecessary pages with PDF-Shuffler and cropping with briss after that. The whole process takes some time, but definitely makes reading pdf on the device a joy.
