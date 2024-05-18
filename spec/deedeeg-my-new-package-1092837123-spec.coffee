DeedeegMyNewPackage1092837123 = require '../lib/deedeeg-my-new-package-1092837123'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "DeedeegMyNewPackage1092837123", ->
  [workspaceElement, activationPromise] = []

  beforeEach ->
    workspaceElement = atom.views.getView(atom.workspace)
    activationPromise = atom.packages.activatePackage('deedeeg-my-new-package-1092837123')

  describe "when the deedeeg-my-new-package-1092837123:toggle event is triggered", ->
    it "hides and shows the modal panel", ->
      # Before the activation event the view is not on the DOM, and no panel
      # has been created
      expect(workspaceElement.querySelector('.deedeeg-my-new-package-1092837123')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.commands.dispatch workspaceElement, 'deedeeg-my-new-package-1092837123:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(workspaceElement.querySelector('.deedeeg-my-new-package-1092837123')).toExist()

        deedeegMyNewPackage1092837123Element = workspaceElement.querySelector('.deedeeg-my-new-package-1092837123')
        expect(deedeegMyNewPackage1092837123Element).toExist()

        deedeegMyNewPackage1092837123Panel = atom.workspace.panelForItem(deedeegMyNewPackage1092837123Element)
        expect(deedeegMyNewPackage1092837123Panel.isVisible()).toBe true
        atom.commands.dispatch workspaceElement, 'deedeeg-my-new-package-1092837123:toggle'
        expect(deedeegMyNewPackage1092837123Panel.isVisible()).toBe false

    it "hides and shows the view", ->
      # This test shows you an integration test testing at the view level.

      # Attaching the workspaceElement to the DOM is required to allow the
      # `toBeVisible()` matchers to work. Anything testing visibility or focus
      # requires that the workspaceElement is on the DOM. Tests that attach the
      # workspaceElement to the DOM are generally slower than those off DOM.
      jasmine.attachToDOM(workspaceElement)

      expect(workspaceElement.querySelector('.deedeeg-my-new-package-1092837123')).not.toExist()

      # This is an activation event, triggering it causes the package to be
      # activated.
      atom.commands.dispatch workspaceElement, 'deedeeg-my-new-package-1092837123:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        # Now we can test for view visibility
        deedeegMyNewPackage1092837123Element = workspaceElement.querySelector('.deedeeg-my-new-package-1092837123')
        expect(deedeegMyNewPackage1092837123Element).toBeVisible()
        atom.commands.dispatch workspaceElement, 'deedeeg-my-new-package-1092837123:toggle'
        expect(deedeegMyNewPackage1092837123Element).not.toBeVisible()
