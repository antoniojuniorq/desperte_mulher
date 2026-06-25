import '../domain/entities/question_entity.dart';

/// Perguntas baseadas no FONAR —
/// Formulário Nacional de Avaliação de Risco (CNJ/CNMP)
/// NÃO modificar o conteúdo das perguntas.
final List<QuestionEntity> mockQuestions = [
  const QuestionEntity(
    id: 'q01',
    text: 'Ele já tentou ou ameaçou te matar?',
    weight: 5,
    category: 'Violência Física',
    helpText: 'Inclui ameaças verbais, com objetos ou armas de qualquer tipo.',
  ),
  const QuestionEntity(
    id: 'q02',
    text: 'Ele possui ou tem acesso fácil a armas de fogo?',
    weight: 5,
    category: 'Acesso a Armas',
    helpText: 'Considera armas legais ou ilegais, próprias ou de terceiros.',
  ),
  const QuestionEntity(
    id: 'q03',
    text: 'Ele já te estrangulou, sufocou ou tentou te afogar?',
    weight: 4,
    category: 'Violência Física',
    helpText:
        'O estrangulamento é um dos indicadores mais sérios de risco de feminicídio.',
  ),
  const QuestionEntity(
    id: 'q04',
    text: 'Ele é extremamente ciumento ou possessivo?',
    weight: 3,
    category: 'Controle',
    helpText:
        'Verifica mensagens, segue você, não permite sair sem explicações.',
  ),
  const QuestionEntity(
    id: 'q05',
    text: 'Ele controla seu dinheiro ou te impede de trabalhar?',
    weight: 3,
    category: 'Controle Financeiro',
    helpText:
        'Inclui tirar documentos, cartões, ou proibir emprego/renda própria.',
  ),
  const QuestionEntity(
    id: 'q06',
    text: 'Ele te isola de familiares e amigos?',
    weight: 3,
    category: 'Isolamento Social',
    helpText:
        'Proíbe visitas, monitora ligações ou gera conflitos com sua rede de apoio.',
  ),
  const QuestionEntity(
    id: 'q07',
    text: 'A violência tem piorado ou ficado mais frequente?',
    weight: 4,
    category: 'Escalada da Violência',
    helpText:
        'A escalada progressiva é um sinal grave de risco elevado.',
  ),
  const QuestionEntity(
    id: 'q08',
    text: 'Ele já ameaçou ou machucou seus filhos ou outros familiares?',
    weight: 4,
    category: 'Ameaça a Terceiros',
    helpText: 'Inclui ameaças a animais de estimação ou pessoas próximas.',
  ),
  const QuestionEntity(
    id: 'q09',
    text: 'Você acredita que ele é capaz de te matar?',
    weight: 5,
    category: 'Percepção de Risco',
    helpText:
        'A percepção da vítima é um dos preditores mais confiáveis de risco real.',
  ),
  const QuestionEntity(
    id: 'q10',
    text: 'Ele faz uso abusivo de álcool ou drogas?',
    weight: 3,
    category: 'Substâncias',
    helpText: 'O uso abusivo aumenta significativamente o risco de agressões.',
  ),
  const QuestionEntity(
    id: 'q11',
    text: 'Ele já te forçou a ter relações sexuais contra sua vontade?',
    weight: 4,
    category: 'Violência Sexual',
  ),
  const QuestionEntity(
    id: 'q12',
    text: 'Ele te humilha, xinga ou diminui na frente de outras pessoas?',
    weight: 3,
    category: 'Violência Psicológica',
  ),
  const QuestionEntity(
    id: 'q13',
    text: 'Ele já te ameaçou com faca, arma ou outro objeto perigoso?',
    weight: 5,
    category: 'Violência com Armas',
  ),
  const QuestionEntity(
    id: 'q14',
    text: 'Você tem filhos menores de idade morando com vocês?',
    weight: 3,
    category: 'Vulnerabilidade Infantil',
    helpText: 'A presença de crianças aumenta os fatores de vulnerabilidade.',
  ),
  const QuestionEntity(
    id: 'q15',
    text: 'Você depende financeiramente dele para sobreviver?',
    weight: 3,
    category: 'Vulnerabilidade Financeira',
    helpText: 'A dependência financeira pode dificultar a saída da situação.',
  ),
];
