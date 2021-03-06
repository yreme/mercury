#= require spec_helper
#= require mercury/views/toolbar_palette

describe "Mercury.ToolbarPalette", ->

  Klass = Mercury.ToolbarPalette
  subject = null

  beforeEach ->
    subject = new Klass()

  afterEach ->
    subject.release()

  describe "#constructor", ->

    beforeEach ->
      subject.release()

    it "calls super", ->
      spyOn(Klass.__super__, 'constructor', false)
      subject = new Klass()
      expect( Klass.__super__.constructor ).called
