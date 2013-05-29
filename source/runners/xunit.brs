function xUnitRunner() as Object
  return {


    'public
    run: function(tests as Object, results as Object) as Void
      xml = CreateObject("roXMLElement")
      xml.SetName("root")

      testsuites = xml.AddBodyElement()
      testsuites.SetName("testsuites")
      testsuite = testsuites.AddBodyElement()
      testsuite.SetName("testsuite")

      ? results.failures

      for each failure in results.failures
        ? ""
        ? failure
      end for

      for each test in tests._tests
        testcase = testsuite.AddBodyElement()
        testcase.setName("testcase")
        testcase.addAttribute("name", test.toString())
      end for

      subel2 = xml.AddBodyElement()
      subel2.SetName("subelement2")-
      'printXml(xml, 0)
    end function
  }

end Function

Sub PrintXML(element As Object, depth As Integer)
    print tab(depth*3);"Name: ";element.GetName()
    if not element.GetAttributes().IsEmpty() then
        print tab(depth*3);"Attributes: ";
        for each a in element.GetAttributes()
            print a;"=";left(element.GetAttributes()[a], 20);
            if element.GetAttributes().IsNext() then print ", ";
        end for
        print
    end if
    if element.GetText()<>invalid then
        print tab(depth*3);"Contains Text: ";left(element.GetText(), 40)
    end if
    if element.GetChildElements()<>invalid
        print tab(depth*3);"Contains roXMLList:"
        for each e in element.GetChildElements()
            PrintXML(e, depth+1)
        end for
    end if
    print
end sub
