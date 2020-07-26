<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Instancia
 * 
 * @property int $idInstancia
 * @property int $idPadre
 * @property string $descripcion
 * @property Carbon $fechaCreacion
 * @property bool|null $esServicio
 * @property bool|null $esCompuesto
 * @property string|null $orden
 * @property int $idEmpresa
 * @property bool $estado
 * @property bool $activo
 * 
 * @property Collection|Item[] $items
 *
 * @package App\Models
 */
class Instancia extends Model
{
	protected $table = 'instancia';
	protected $primaryKey = 'idInstancia';
	public $timestamps = false;

	protected $casts = [
		'idPadre' => 'int',
		'esServicio' => 'bool',
		'esCompuesto' => 'bool',
		'idEmpresa' => 'int',
		'estado' => 'bool',
		'activo' => 'bool'
	];

	protected $dates = [
		'fechaCreacion'
	];

	protected $fillable = [
		'idPadre',
		'descripcion',
		'fechaCreacion',
		'esServicio',
		'esCompuesto',
		'orden',
		'idEmpresa',
		'estado',
		'activo'
	];

	public function items()
	{
		return $this->hasMany(Item::class, 'idInstancia');
	}
}
