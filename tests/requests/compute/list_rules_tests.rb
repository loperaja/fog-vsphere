Shindo.tests('Fog::Compute[:vsphere] | list_rules request', ['vsphere']) do
  tests('When listing all rules') do
    response = Fog::Compute[:vsphere].list_rules
    test('Rules extracted... ') { response.length == 1 }

    tests('The response data format ...') do
      test('be a kind of Array') { response.is_a? Array }
    end
  end
  tests('When listing filtered rules') do
    response = Fog::Compute[:vsphere].list_rules(name: 'affinity-foo')
    test('Rules extracted... ') { response.length == 1 }
    test('Correct rule found... ') { response.first[:name] == 'affinity-foo' }

    tests('The response data format ...') do
      test('be a kind of Array') { response.is_a? Array }
    end
  end
end
