Mercury.View.Modules.InterfacePageManager =

  included: ->
    @on('build', @initInterfaceManager)


  initInterfaceManager: ->
    @initPage()
    @on('release', @releasePage)
    @delegateEvents
      'mercury:save': 'save'
      'mercury:action': 'focusActiveRegion'
      'mercury:focus': 'focusActiveRegion'
      'mercury:blur': 'blurActiveRegion'
      'mercury:region:focus': 'onRegionFocus'
      'mercury:region:release': 'onRegionRelease'
      'mercury:reinitialize': 'reinitializeRegions'


  initPage: ->
    @page = new Mercury.Model.Page()
    @page.createRegions(@regionElements())


  regionElements: ->
    $("[#{@config('regions:attribute')}]", @document)


  load: (json) ->
    @page.loadRegionContent(json)


  reinitializeRegions: ->
    @page.createRegions(@regionElements())


  save: ->
    @page.save().always = => @delay(250, -> Mercury.trigger('save:complete'))


  focusDefaultRegion: ->
    @delay(100, @focusActiveRegion)


  activeRegion: ->
    @page.activeRegion()


  focusActiveRegion: ->
    @page.focusActiveRegion()


  blurActiveRegion: ->
    @page.blurActiveRegion()


  releasePage: ->
    @page.release()


  onRegionFocus: (region) ->
    @page.blurActiveRegion() unless @page.region == region
    @page.setActiveRegion(region)


  onRegionRelease: (region) ->
    @page.removeRegion(region)
