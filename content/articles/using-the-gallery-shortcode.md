+++
banner = ""
categories = []
date = "2002-05-01"
description = ""
images = []
menu = ""
tags = []
title = "Using the gallery shortcode"
+++

This way you can easily include a gallery into your page. Copy the code below into your content file and enter the relative paths to your images.

<!--more-->


    {{</* gallery
        "/banners/placeholder.png"
        "/banners/banner_apropos.png"
        "/banners/placeholder.png"
    */>}}

<p></p>

{{< gallery "/banners/placeholder.png" "/banners/banner_apropos.png" "/banners/placeholder.png" >}}
