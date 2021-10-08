import pyRunnerUtil from '../utils/pyrunner.js'

const generateText = async (initialText, length, temperature) => {
  const textLines = await pyRunnerUtil.runPythonCommand('generate.py', [ process.env.checkpoint, initialText, length ?? 300, temperature ?? 0.8 ])
  // First line is output from generate, last line is truncated - so skip those
  return textLines.slice(1, -1);
}

export default {
  generateText
}