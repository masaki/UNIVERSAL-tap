use inc::Module::Install;
name 'UNIVERSAL-tap';
all_from 'lib/UNIVERSAL/tap.pm';

readme_from 'lib/UNIVERSAL/tap.pm';
readme_markdown_from 'lib/UNIVERSAL/tap.pm';
auto_set_repository;

# requires '';

tests 't/*.t';
test_requires 'Test::More';
test_requires 'Test::UseAllModules';

author_tests 'xt';
author_requires 'Test::LoadAllModules';
author_requires 'Test::Pod';
author_requires 'Test::Pod::Coverage';
author_requires 'Test::Spelling';
author_requires 'ShipIt';
author_requires 'ShipIt::Step::Manifest';
author_requires 'ShipIt::Step::DistClean';
author_requires 'ShipIt::Step::Twitter';

auto_include_deps;
WriteAll;
