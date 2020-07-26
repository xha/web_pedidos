<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class ItemImpuesto
 * 
 * @property int $idItem
 * @property int $idImpuesto
 * @property Carbon $fechaCreacion
 * @property int $idEmpresa
 * @property bool $estado
 * @property bool $activo
 *
 * @package App\Models
 */
class ItemImpuesto extends Model
{
	protected $table = 'item_impuesto';
	public $incrementing = false;
	public $timestamps = false;

	protected $casts = [
		'idItem' => 'int',
		'idImpuesto' => 'int',
		'idEmpresa' => 'int',
		'estado' => 'bool',
		'activo' => 'bool'
	];

	protected $dates = [
		'fechaCreacion'
	];

	protected $fillable = [
		'fechaCreacion',
		'idEmpresa',
		'estado',
		'activo'
	];
}
