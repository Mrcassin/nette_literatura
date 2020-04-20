<?php
declare(strict_types = 1);

namespace App\Presenters;

use App\Model;
use Nette\Application\UI;
use Nette\Utils\DateTime;
use Tracy\Debugger;

final class ItemPresenter extends BasePresenter {
   
    private $itemManager;

    public function __construct(Model\ItemManager $itemManager) {
        $this->itemManager = $itemManager;
    }

    public function renderList($order = 'title ASC'): void {
		$this->template->itemList = $this->itemManager->getAll($order);
    }

    public function renderDetail($id): void {
		$this->template->item = $this->itemManager->getById($id);
    }

    public function actionInsert(): void {
		$this['itemForm']['stars']->setDefaultValue('3');

    }

    public function actionUpdate($id): void {
		Debugger::log('Aktualizován záznam ' . $id);
        $data = $this->itemManager->getById($id)->toArray();
        $this['itemForm']->setDefaults($data);
    }

    public function actionDelete($id): void {
        Debugger::log('Odstraněn záznam ' . $id);
        if ($this->itemManager->delete($id)) {
            $this->flashMessage('Záznam byl úspěšně smazán', 'success');
        } else {
            $this->flashMessage('Došlo k nějaké chybě při mazání záznamu', 'danger');
        }
        $this->redirect('list');
	}
	
	protected function createComponentItemForm(): UI\Form {
        $form = new UI\Form;

        $form->addText('title', 'Název díla')->setRequired(true);
        $form->addText('author', 'Autor')->setRequired(true)->addRule(UI\Form::MAX_LENGTH, 'Jméno nemůže být delší než 50 znaků.', 50);
		$form->addTextArea('anotation', 'Stručná charrakteristika díla')->setHtmlAttribute('rows', '6')->setRequired(true);
		$form->addText('year', 'Rok vzniku')->addRule(UI\Form::INTEGER, 'Musíte zadat číslo')->addRule(UI\Form::LENGTH, 'Rok musí mít 4 číslice', 4);
        $category = [
            'drama' => 'drama',
            'poezie' => 'poezie',
            'próza' => 'próza'
        ];
        $form->addSelect('category', 'Literární druh', $category);

        $form->addText('stars', 'Hodnocení:')
                ->setHtmlType('number')
                ->setHtmlAttribute('min', '1.0')
                ->setHtmlAttribute('max', '5.0')
                ->setHtmlAttribute('step', '1')
                ->setHtmlAttribute('title', 'Zadejte hodnocení v rozsahu 1 až 5, čím vyšší číslo, tím lepší hodnocení.')
                ->addRule(UI\Form::RANGE, 'Hodnocení musí být v rozsahu od 1 do 5', [1, 5]);

        $form->addSubmit('submit', 'Potvrdit');

        $form->onSuccess[] = [$this, 'itemFormSucceeded'];
        return $form;
	}
	
	public function itemFormSucceeded(UI\Form $form, $values): void {
        Debugger::barDump($values);
        $itemId = $this->getParameter('id');

        if ($itemId) {
            $item = $this->itemManager->update($itemId, $values);
        } else {
            $item = $this->itemManager->insert($values);
        }
        if ($item) {
            $this->flashMessage('Záznam byl úspěšně uložen', 'success');
        } else {
            $this->flashMessage('Došlo k nějaké chybě při ukládání do databáze nebo záznam nebyl pozměněn.', 'danger');
        }
        $this->redirect('Item:list');
    }

}
