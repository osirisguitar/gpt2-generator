import {PythonShell} from 'python-shell';

const runPythonCommand = async (command, args) => {
  return new Promise((resolve, reject) => {
    const options = {
      args
    }

    PythonShell.run(command, options, (err, results) => {
      if (err) {
        return reject (err);
      }

      return resolve(results);
    });
  })
}

export default {
  runPythonCommand
}