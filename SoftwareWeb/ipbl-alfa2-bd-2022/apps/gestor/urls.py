from django.urls import path, re_path
from apps.gestor import views

urlpatterns = [
    path("login", views.login, name="gestor"),
    path("verify_login", views.verify_login, name="gestor"),
    path("logoff", views.logoff, name="gestor"),
    path("home", views.home, name="gestor"),
    path("informacoes", views.informacoes, name="gestor"),
    path("escolas", views.escolas, name="gestor"),
    path("cadastro_professores", views.cadastro_professores, name="gestor"),
    path("submit_professores", views.submit_professores, name="gestor"),
    path("professores", views.professores, name="gestor"),
    path("cadastro_alunos", views.cadastro_alunos, name="gestor"),
    path("submit_alunos", views.submit_alunos, name="gestor"),
    path("alunos", views.alunos, name="gestor"),
    path("gestores_escolares", views.gestores_escolares, name="gestor"),
    path("resumo_coletas", views.resumo_coletas, name="gestor"),
    path("cadastro_escolas", views.cadastro_escolas, name="gestor"),
    path("cadastro_turma", views.cadastro_turma, name="gestor"),
    path("escola_individual", views.escola_individual, name="gestor"),
    path("submit_turma", views.submit_turma, name="gestor"),
    path("submit_escola", views.submit_escola, name="gestor"),
]
