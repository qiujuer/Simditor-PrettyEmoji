class EmojiButton extends EmojiBaseButton
  constructor: (args...) ->
    super args...
    $.merge @editor.formatter._allowedAttributes['img'], ['data-emoji', 'alt']

  renderMenu: ->
    formatListHtml = (values) ->
      html = ""
      for value in values
        html += "<li data-name='[:#{ value }]'><img src='#{ dir }#{ value}.png' alt='[:#{ value }]'/></li>"
      return html     
      
    formatTitleHtml = (e) ->
      html = ""      
      for value in e
        html += "<li data-name='#{ value }'><img src='#{ dir }category-#{ value }.png' title='#{ value }'/></li>"
      html += "<div style='clear:left;'></div>"
      return html        
      
    changeCategory = (e) ->
      $selected = $categoryVar.find('li.selected')
      if $selected
        $selected.removeClass('selected')       
      $(e).addClass('selected')    
      
    choiceCategory = (e) ->
      if e == 'face'
        return EmojiButton.imgface
      else if e == 'fashion'
        return EmojiButton.imgfashion
      else if e == 'animal'
        return EmojiButton.imganimal
      else if e == 'food'
        return EmojiButton.imgfood
      else if e == 'travel'
        return EmojiButton.imgtravel
      else if e == 'time'
        return EmojiButton.imgtime
      else if e == 'work'
        return EmojiButton.imgwork
      else if e == 'font'
        return EmojiButton.imgfont
      else if e == 'tool'
        return EmojiButton.imgtool
      else
        return EmojiButton.imgother
    
    list = '''<ul></ul>'''    
    listDiv = '''<div class="emoji-list"></div>'''
    category = '''<ul class="emoji-category"></ul>'''

    opts = $.extend({
      imagePath: 'images/emoji/'
      categories: EmojiButton.categories
      autoClose: true
    }, @editor.opts.emoji || {})

    dir  = opts.imagePath.replace(/\/$/, '') + '/'
    
    $categoryVar = $(category)
    $categoryVar.html(formatTitleHtml opts.categories)
    $categoryVar.find('li:first').addClass('selected')
    $categoryVar.appendTo(@menuWrapper)
      
    $list= $(list)
    $listDiv= $(listDiv)
    $list.html(formatListHtml EmojiButton.imgface).appendTo($listDiv)    
    $listDiv.appendTo(@menuWrapper)
    
    @menuWrapper.on 'mousedown', (e) =>
      false
    
    $categoryVar.on 'mousedown', 'li', (e) =>
      $category = $(e.currentTarget)
      changeCategory $category
      categoryList = choiceCategory $category.attr('data-name')
      $list.html(formatListHtml categoryList)
      false

    $list.on 'mousedown', 'li', (e) =>
      if opts.autoClose
        @wrapper.removeClass('menu-on')
        return unless @editor.inputManager.focused      

      $timg = $(e.currentTarget).find('img');      
      $img = $timg.clone()
        .attr({
          'data-emoji': $timg.attr('alt')
          'data-non-image': true
        })
        
      @editor.selection.insertNode $img      
      @editor.trigger 'valuechanged'
      @editor.trigger 'selectionchanged'
      false

  status: ->
    # do samething....

Simditor.Toolbar.addButton EmojiButton
