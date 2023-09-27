package org.nix_app.scala

import org.scalatest.FunSuite

class HelloTests extends FunSuite {
  test("displaySalutation returns 'Hello World'") {
    assert(Hello.displaySalutation == "Hello World")
  }
}
