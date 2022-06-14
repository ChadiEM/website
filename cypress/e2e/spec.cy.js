describe("no horizontal scrollbars", () => {
  for (const viewport of ["iphone-4", "iphone-x", "samsung-s10"]) {
    it("viewport " + viewport, () => {
      cy.viewport(viewport);
      cy.visit("../../website/index.html");
      cy.checkNoHorizontalScrollbar();
    });
  }
});
