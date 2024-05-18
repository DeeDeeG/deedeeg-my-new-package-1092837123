DeedeegMyNewPackage1092837123View = require './deedeeg-my-new-package-1092837123-view'
{CompositeDisposable} = require 'atom'

module.exports = DeedeegMyNewPackage1092837123 =
  deedeegMyNewPackage1092837123View: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @deedeegMyNewPackage1092837123View = new DeedeegMyNewPackage1092837123View(state.deedeegMyNewPackage1092837123ViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @deedeegMyNewPackage1092837123View.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'deedeeg-my-new-package-1092837123:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @deedeegMyNewPackage1092837123View.destroy()

  serialize: ->
    deedeegMyNewPackage1092837123ViewState: @deedeegMyNewPackage1092837123View.serialize()

  toggle: ->
    console.log 'DeedeegMyNewPackage1092837123 was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
