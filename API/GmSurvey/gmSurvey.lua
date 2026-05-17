--==============================
-- GM Survey functions
--==============================

--- Returns text of multiple-choice question answers in a GM survey
---@param questionIndex number Index of a survey question (between 1 and MAX_SURVEY_QUESTIONS )
---@param answerIndex number Index of one of the question's answers (between 1 and MAX_SURVEY_ANSWERS )
---@return string answerText Text of the answer choice
function GMSurveyAnswer(questionIndex, answerIndex) end

--- Submits an answer to a GM survey question
---@param question number The index of the question being answered
---@param rank number The rank selected
---@param comment string A comment for the given question
function GMSurveyAnswerSubmit(question, rank, comment) end

--- Submits a comment to the current GM survey
---@param comment string The comment made on the GM Survey
function GMSurveyCommentSubmit(comment) end

--- Returns the number of possible answers for a GM Survey question. Deprecated; default UI uses the constant MAX_SURVEY_ANSWERS instead.
--- Flags: deprecated
---@param questionIndex number Index of a survey question (between 1 and MAX_SURVEY_QUESTIONS )
---@return number numAnswers Number of multiple-choice answers to present for the question
function GMSurveyNumAnswers(questionIndex) end

--- Returns the text of a specific question from a GM survey
---@param index number The index of a GM survey question
---@return string surveyQuestion The question being asked
function GMSurveyQuestion(index) end

--- Submits the current GM survey
function GMSurveySubmit() end
