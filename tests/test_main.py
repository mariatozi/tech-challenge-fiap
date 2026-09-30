from tech_challenge.main import main


def test_main_runs(capsys):
    main()
    assert "Tech Challenge FIAP" in capsys.readouterr().out
