# Controle de Finanças Pessoais

Aplicativo para controle de finanças focado em uso pessoal, inspirado no Organizze. Desenvolvido com foco na experiência Android e Web.

## 🛠 Stack Tecnológica
*   **Frontend:** Flutter (Mobile-first e Web)
*   **Gerenciamento de Estado:** Riverpod (Arquitetura MVVM)
*   **Backend & Autenticação:** Supabase (PostgreSQL)
*   **Banco de Dados Local:** Drift (SQLite - Offline-first)

---

## 🏗 Estrutura de Pastas (Feature-First)

A arquitetura do projeto isola o núcleo de dados das funcionalidades visuais.

/lib
  /core         # Configurações globais (temas, rotas, utilitários)
  /data         # Camada offline-first
    /local      # Configuração Drift (imports condicionais Web/Native)
    /remote     # Cliente Supabase
    /sync       # Motor de sincronização em background
  /features     # Módulos independentes (MVVM)
    /auth         # Views e ViewModels de Login
    /dashboard    # Telas de resumo e cálculos
    /transactions # Gerenciamento de receitas/despesas

---

## 🚀 Roteiro de Implementação

A construção do sistema deve seguir uma ordem de dependência estrita para evitar refatorações e garantir o funcionamento offline.

### Fase 1: Fundação e Dependências
1. Inicializar o projeto Flutter.
2. Adicionar pacotes no `pubspec.yaml`: `flutter_riverpod`, `drift`, `supabase_flutter`, `uuid`.
3. Criar a estrutura base de pastas listada acima.

### Fase 2: Camada de Dados (O Coração Offline)
1. Configurar os imports condicionais do Drift (`unsupported.dart`, `native.dart`, `web.dart` e `connection.dart`).
2. Criar a tabela `Transacoes` com as colunas obrigatórias para sincronização (`id` UUID, `is_synced`, `updated_at`, `deleted_at`).
3. Rodar o `build_runner` para gerar o ORM local do Drift.

### Fase 3: Backend e Sincronização
1. Configurar o projeto no painel do Supabase.
2. Habilitar a Autenticação por E-mail/Senha e configurar as políticas de segurança (RLS).
3. Criar a tabela `transacoes` no PostgreSQL (refletindo a estrutura do Drift).
4. Desenvolver o `SyncService` (Motor de Sincronização) executando o fluxo de Pull (baixar alterações) e Push (subir dados locais não sincronizados).

### Fase 4: Interface e Regras de Negócio (MVVM)
1. **Módulo Auth:** Criar a View de Login e a ViewModel que se comunica com o Supabase Auth.
2. **Módulo Dashboard:** Criar o provedor Riverpod que escuta os saldos via *Streams* do Drift e a View principal.
3. **Módulo Transações:** Implementar o formulário de inclusão/edição. A ViewModel deve salvar *exclusivamente* no Drift, delegando a comunicação com a nuvem ao `SyncService`.